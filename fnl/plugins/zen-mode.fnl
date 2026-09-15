(import-macros {: map!} :hibiscus.vim)
(local {: require-and : gh} (require :functions))

(vim.pack.add [(gh :folke/zen-mode.nvim)])
(require-and :zen-mode
             #($.setup {:backdrop 1.0 :plugins {:alacritty {:enabled true}}}))
(map! [n] :<leader>tz :<cmd>ZenMode<CR>)
