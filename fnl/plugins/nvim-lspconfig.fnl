(local {: require-and} (require :functions))

(local M { 1 "neovim/nvim-lspconfig" 
       :event :BufReadPost
       :dependencies [:mason.nvim]
       :init (fn []
               (set vim.lsp.set_log_level :trace)
               (require-and :vim.lsp.log #($.set_format_func vim.inspect)))})

(fn M.config []
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (fn [event]
                                            ; (vim.keymap.set :n :gd (. (require :telescope.builtin) :lsp_definitions))
                                            ; (vim.keymap.set :n :gR (. (require :telescope.builtin) :lsp_references))
                                            ; (vim.keymap.set :n :gI (. (require :telescope.builtin) :lsp_implementations))
                                            ; (vim.keymap.set :n :<leader>lD (. (require :telescope.builtin) :lsp_type_definitions))
                                            ; (vim.keymap.set :n :<leader>ls (. (require :telescope.builtin) :lsp_document_symbols))
                                            ; (vim.keymap.set :n :<leader>lw (. (require :telescope.builtin) :lsp_dynamic_workspace_symbols))
                                            (vim.keymap.set :n :<leader>lr vim.lsp.buf.rename)
                                            (vim.keymap.set :n :<leader>la vim.lsp.buf.code_action)
                                            (vim.keymap.set :n :<leader>lf vim.lsp.buf.format)
                                            (vim.keymap.set :n :K vim.lsp.buf.hover)
                                            (vim.keymap.set :n :gD vim.lsp.buf.declaration)
                                            (local client (vim.lsp.get_client_by_id event.data.client_id))
                                            (when (and client client.server_capabilities.documentHighlightProvider)
                                              (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI] {:buffer event.buf :callback vim.lsp.buf.document_highlight})
                                              (vim.api.nvim_create_autocmd [:CursorMoved :CursorMovedI] {:buffer event.buf :callback vim.lsp.buf.clear_references})))
                               :group (vim.api.nvim_create_augroup :fvim-lsp-attach {:clear true})})	


  (vim.lsp.enable :clangd)
  (vim.lsp.enable :rust_analyzer)
  (vim.lsp.enable :fennel_language_server)
  (vim.lsp.enable :pyright)
  (vim.lsp.enable :zls)
  (vim.lsp.enable :gopls))
                       
M
