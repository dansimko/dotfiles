-- Pick up and use system parsers

vim.cmd.runtime({ 'plugin/query_predicates.lua', bang = true })
vim.cmd.runtime({ 'plugin/filetypes.lua', bang = true })
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start)
  end,
})

-- Directory with distribution tree-sitter libs
local lib_dir = "/usr/lib64/"

-- Pattern to match: libtree-sitter-[lang].so.[version]
-- We focus on the symlinks or the main .so to avoid duplicates
local parser_files = vim.fn.glob(lib_dir .. "libtree-sitter-*.so*", false, true)

for _, filepath in ipairs(parser_files) do
    -- Extract language name using regex
    -- Example: /usr/lib64/libtree-sitter-rust.so.15 -> rust
    local lang = filepath:match("libtree%-sitter%-([^%.]+)%.so")

    if lang then
        -- Register the parser path with Neovim
        vim.treesitter.language.add(lang, { path = filepath })
    end
end

-- highlighting queries definitions
vim.opt.rtp:prepend("/usr/share/tree-sitter")
vim.opt.rtp:prepend(vim.fn.expand("~/.local/share/tree-sitter"))

-- Register additional filetypes for parsers
-- from nvim-treesitter
local filetypes = {
  angular = { 'htmlangular' },
  bash = { 'sh' },
  bibtex = { 'bib' },
  c_sharp = { 'cs', 'csharp' },
  commonlisp = { 'lisp' },
  cooklang = { 'cook' },
  devicetree = { 'dts' },
  diff = { 'gitdiff' },
  eex = { 'eelixir' },
  elixir = { 'ex' },
  embedded_template = { 'eruby' },
  erlang = { 'erl' },
  facility = { 'fsd' },
  faust = { 'dsp' },
  gdshader = { 'gdshaderinc' },
  git_config = { 'gitconfig' },
  git_rebase = { 'gitrebase' },
  glimmer = { 'handlebars', 'html.handlebars' },
  godot_resource = { 'gdresource' },
  haskell = { 'hs' },
  haskell_persistent = { 'haskellpersistent' },
  idris = { 'idris2' },
  ini = { 'confini', 'dosini' },
  janet_simple = { 'janet' },
  javascript = { 'javascriptreact', 'ecma', 'ecmascript', 'jsx', 'js' },
  json = { 'jsonc' },
  glimmer_javascript = { 'javascript.glimmer' },
  latex = { 'tex' },
  linkerscript = { 'ld' },
  m68k = { 'asm68k' },
  make = { 'automake' },
  markdown = { 'pandoc' },
  muttrc = { 'neomuttrc' },
  ocaml_interface = { 'ocamlinterface' },
  perl = { 'pl' },
  poe_filter = { 'poefilter' },
  powershell = { 'ps1' },
  properties = { 'jproperties' },
  python = { 'py', 'gyp' },
  qmljs = { 'qml' },
  runescript = { 'clientscript' },
  scala = { 'sbt' },
  slang = { 'shaderslang' },
  sqp = { 'mysqp' },
  ssh_config = { 'sshconfig' },
  starlark = { 'bzl' },
  surface = { 'sface' },
  systemverilog = { 'verilog' },
  t32 = { 'trace32' },
  tcl = { 'expect' },
  terraform = { 'terraform-vars' },
  textproto = { 'pbtxt' },
  tlaplus = { 'tla' },
  tsx = { 'typescriptreact', 'typescript.tsx' },
  typescript = { 'ts' },
  glimmer_typescript = { 'typescript.glimmer' },
  typst = { 'typ' },
  udev = { 'udevrules' },
  uxntal = { 'tal', 'uxn' },
  v = { 'vlang' },
  vhs = { 'tape' },
  xml = { 'xsd', 'xslt', 'svg' },
  xresources = { 'xdefaults' },
}

for lang, ft in pairs(filetypes) do
  vim.treesitter.language.register(lang, ft)
end
