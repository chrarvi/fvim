(import-macros {: set! : set+} :hibiscus.vim)


;; Indentation
(set! expandtab)
(set! shiftwidth 4)
(set! tabstop 2)

(vim.api.nvim_create_augroup "go" { :clear true })
(vim.api.nvim_create_autocmd "FileType" {
                             :group :go
                             :pattern :go
                             :command "setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab" })

;; Line numbers
(set! number)
(set! relativenumber)
(set! numberwidth 3)

(set! showtabline 0)
(set! laststatus 0)
(set! conceallevel 2)

;; mouse
(set! mouse :a)

;; viz
(set! showmode true)
(set! breakindent true)
(set! signcolumn :yes)
(set! listchars { :tab "» " :trail "·" :nbsp "␣" })
(set! cursorline true)
(set! scrolloff 0)
(set! termguicolors true)

;; functionality
(set! notimeout)
(set! clipboard :unnamedplus)
(set! undofile true)
(set! ignorecase true)
(set! smartcase true)
(set! updatetime 250)
(set! timeoutlen 300)
(set! splitright true)
(set! inccommand :nosplit)

;; cpp
(set! cindent)
(vim.opt.iskeyword:remove :_)

