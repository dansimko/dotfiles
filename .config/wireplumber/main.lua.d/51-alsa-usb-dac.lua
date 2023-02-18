rule = {
    matches = {
        {
            { "device.name", "matches", "alsa_card.usb-Focusrite_Scarlett_Solo_USB-*" }
        },
        {
            { "device.name", "matches", "alsa_card.usb-Burr-Brown_from_TI_USB_Audio_CODEC-*" }
        }
    },
    apply_properties = {
        --[ "api.alsa.period-size" ] = 32,
        [ "api.alsa.disable-batch" ] = true,
        --[ "session.suspend-timeout-seconds" ] = 0,
        [ "api.alsa.headroom" ] = 0,
    }
}

table.insert (alsa_monitor.rules, rule)
