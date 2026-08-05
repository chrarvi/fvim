(import-macros {: map!} :hibiscus.vim)

(map! [n] :<leader>wm :<C-w>h "Select window left")
(map! [n] :<leader>wn :<C-w>j "Select window down")
(map! [n] :<leader>we :<C-w>k "Select window up")
(map! [n] :<leader>wi :<C-w>l "Select window right")
(map! [n] :<leader>wh :<C-w>h "Select window left")
(map! [n] :<leader>wj :<C-w>j "Select window down")
(map! [n] :<leader>wk :<C-w>k "Select window up")
(map! [n] :<leader>wl :<C-w>l "Select window right")
(map! [n] :<leader>wv :<C-w>v "Split vertically")
(map! [n] :<leader>ws :<C-w>s "Split horizontally")
(map! [n] :<leader>w= :<C-W>=)
(map! [n] :<leader>wo ":only<CR>")

(map! [n] :<leader>wq :<cmd>q<CR> "Quit window")

(map! [n] :<Esc> :<cmd>nohlsearch<CR>)

(map! [n] "[d" vim.diagnostic.goto_prev)
(map! [n] "]d" vim.diagnostic.goto_next)
(map! [n] :<leader>e vim.diagnostic.open_float)
(map! [n] :<leader>lq vim.diagnostic.setloclist)

(map! [v] :<M-down> ":m '>+1<CR>gv=gv")
(map! [v] :<M-up> ":m '>-2<CR>gv=gv")
(map! [n] :J "mzJ`z")

(map! [n] :<leader>ol :<cmd>Lazy<CR>)

(map! [n] :<leader>. :<cmd>Ex<CR>)

(map! [n] :<leader>br :<cmd>edit!<CR>)
(map! [n] :<leader>bf vim.lsp.buf.format)
(map! [n] :<leader>bn :<cmd>enew<CR>)

(fn get-relative-path-to-git-root []
  (let [uv vim.loop
        filepath (vim.fn.expand "%:p")
        dir (uv.fs_realpath (vim.fn.expand "%:p:h"))]
    (when (not dir)
      (lua "return nil, \"Cannot find directory of current file.\""))

    (fn is-git-dir [path]
      (let [git-path (uv.fs_realpath (.. path :/.git))]
        (and git-path (not= (uv.fs_stat git-path) nil))))

    (var root-dir dir)
    (while root-dir
      (when (is-git-dir root-dir) (lua :break))
      (local parent-dir (uv.fs_realpath (.. root-dir "/..")))
      (if (= parent-dir root-dir) (set root-dir nil) (set root-dir parent-dir)))
    (when (not root-dir)
      (lua "return nil, \"No .git directory found in any parent directories.\""))
    (local relative-path (filepath:sub (+ (length root-dir) 2)))
    relative-path))

(map! [n] :<leader>fY
      (fn []
        (let [path (vim.fn.expand "%:p")]
          (when path
            (vim.fn.setreg "+" path)
            (vim.notify (.. "Copied '" path "' to the clipboard!"))))))

(map! [n] :<leader>fy
      (fn []
        (let [path (get-relative-path-to-git-root)]
          (when path
            (vim.fn.setreg "+" path)
            (vim.notify (.. "Copied '" path "' to the clipboard!"))))))

(map! [n] :<M-g>n :<cmd>cnext<CR>)
(map! [n] :<M-g>p :<cmd>cprev<CR>)

(map! [n] :<leader>qr "<cmd>luafile ~/.config/nvim/init.lua<CR>")

