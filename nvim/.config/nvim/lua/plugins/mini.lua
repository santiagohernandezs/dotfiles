require("mini.files").setup({
  mappings = {
    close = "<ESC>",
  },
  windows = {
    preview = true,
    border = "rounded",
    width_preview = 80,
  },
})

require("mini.icons").setup()

require("mini.move").setup()

require("mini.clue").setup({
  triggers = {
    -- leader
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    -- g key
    { mode = { "n", "x" }, keys = "g" },

    -- Registers
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "i", "c" }, keys = "<C-r>" },

    -- `z` key
    { mode = { "n", "x" }, keys = "z" },
  },
  clues = {
    require("mini.clue").gen_clues.g(),
    require("mini.clue").gen_clues.registers(),
    require("mini.clue").gen_clues.z(),
  },
})

require("mini.pick").setup({
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
    scroll_down = "<S-j>",
    scroll_up = "<S-k>",
  },
})

require("mini.pairs").setup()

require("mini.completion").setup({
  process_items = function(items, base)
    return require("mini.icons").get_lsp_completion_items(items, base)
  end,
})

require("mini.snippets").setup()

require("mini.basics").setup({
  options = {
    basic = true,
    extra_ui = true,
    win_borders = "double",
  },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\]],
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = false,
  },
})

require("mini.statusline").setup()
