-- Theme
require("tokyonight").setup {
	transparent = true,
	style = "moon",
}

-- Telescope
-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
    defaults = {
        initial_mode = "normal"
    },
    extensions = {
        file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                -- your custom insert mode mappings
                },
                ["n"] = {
                -- your custom normal mode mappings
                },
            },
        },
    },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
	"n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Zen Mode
require("zen-mode").setup {
  on_open = function(_)
    vim.cmd 'cabbrev <buffer> q let b:quitting = 1 <bar> q'
    vim.cmd 'cabbrev <buffer> wq let b:quitting = 1 <bar> wq'
  end,
  on_close = function()
    if vim.b.quitting == 1 then
      vim.b.quitting = 0
      vim.cmd 'q'
    end
  end,
  window = {
    width = .65
  }
}

