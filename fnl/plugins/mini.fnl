(local {: require-and : gh} (require :functions))

(vim.pack.add [(gh :echasnovski/mini.nvim)])

(require-and :mini.ai #($.setup {:n_lines 500}))
(require-and :mini.statusline #($.setup {:use_icons vim.g.have_nerd_font}))
