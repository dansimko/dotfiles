-- Create EQ sink when device is connected
--
-- Copyright (C) 2022 Daniel Simko <daniel@simko.xyz>

local node_input_tpl <const> = [[
    {
        type   = builtin
        name   = input
        label  = copy
    }
]]

local node_preamp_tpl <const> = [[
    {
        type = builtin
        name = eq_preamp
        label = bq_highshelf
        control = { "Freq" = 0.0 "Q" = 1.0 "Gain" = %f }
    }
]]

local node_eqband_tpl <const> = [[
    {
        type  = builtin
        name  = %s
        label = %s
        control = { "Freq" = %f "Q" = %f "Gain" = %f }
    }
]]

local link_tpl <const> = [[
    { output = "%s" input = "%s" }
]]

local args_tpl <const> = [[
    node.description = "%s Equalizer Sink"
    media.name       = "%s Equalizer Sink"
    filter.graph = {
        nodes = [
            %s
        ]
        links = [
            %s
        ]
    }
    audio.channels = 2
    audio.position = [ FL FR ]
    capture.props = {
        node.name   = "effect_input.eq-%s"
        media.class = Audio/Sink
    }
    playback.props = {
        node.name           = "effect_output.eq-%s"
        target.object       = "%s"
        stream.dont-remix   = true
        node.passive        = true
    }
]]

local config = ... or {}
local eq_sink = {}

for k, v in pairs(config) do
    local constraints = {
        Constraint { "media.class", "matches", "Audio/Sink", type = "pw-global" }
    }

    for _, m in pairs(v.matches) do
        table.insert(constraints, Constraint { type = "pw", table.unpack(m) })
    end

    config[k]["interest"] = Interest {
        type = "node",
        table.unpack(constraints)
    }
end

function generateEqNodes(preamp, bands)
    local nodes = ""
    local links = ""
    local prev_node = nil

    -- First we need input node
    nodes = nodes .. node_input_tpl

    -- Create preamp node
    nodes = nodes .. string.format(node_preamp_tpl, preamp)
    links = links .. string.format(link_tpl, "input:Out", "eq_preamp:In")
    prev_node = "eq_preamp"

    -- Generate EQ band nodes
    for i, band in ipairs(bands) do
        local band_name = "eq_band_" .. tostring(i)

        nodes = nodes .. string.format(node_eqband_tpl, band_name,
                band["type"], band["freq"], band["q"], band["gain"])
        links = links .. string.format(link_tpl, prev_node .. ":Out",
                band_name .. ":In")

        prev_node = band_name
    end

    return nodes, links
end

function createEqSink(cfg, name, desc, target)
    local node_name = string.gsub(string.lower(name), "-", "")
    local nodes, links = generateEqNodes(cfg["preamp"], cfg["bands"])

    return LocalModule("libpipewire-module-filter-chain", string.format(
            args_tpl, desc, name, nodes, links, node_name, node_name, target))
end

local interests = {}

for _, eq in pairs(config) do
    table.insert(interests, eq["interest"])
end

node_om = ObjectManager {
    table.unpack(interests)
}

node_om:connect("object-added", function(_, node)
    local name = node.properties["node.name"]

    for _, eq in pairs(config) do
        if eq["interest"]:matches(node) then
            Log.debug("adding eq sink for " .. name)
            eq_sink[name] = createEqSink(eq.config,
                    node.properties["media.name"],
                    node.properties["node.description"], name)
        end
    end
end)

node_om:connect("object-removed", function(_, node)
    local name = node.properties["node.name"]
    Log.debug("removing eq sink for " .. name)
    eq_sink[name] = nil
end)

node_om:activate()
