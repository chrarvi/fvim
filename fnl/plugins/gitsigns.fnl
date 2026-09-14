(local {: require-and : gh} (require :functions))

(vim.pack.add [(gh :lewis6991/gitsigns.nvim)])

(require-and :gitsigns #($.setup {:signs {:add {:text "+"}
                                :change {:text "~"}
                                :delete {:text "_"}
                                :topdelete {:text "‾"}
                                :changedelete {:text "~"}}}))
