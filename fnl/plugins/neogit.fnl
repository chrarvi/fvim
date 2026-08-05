(local {: require-and} (require :functions))

(local M {1 :NeogitOrg/neogit
          :dependencies [:nvim-lua/plenary.nvim
                         :sindrets/diffview.nvim ]
          :config true
          :keys [{1 :<leader>gs 2 #(require-and :neogit #($.open))}]
          :lazy false})

(fn M.config []
  (local neogit (require :neogit))
  (neogit.setup {:mappings {:commit_editor {:<c-c><c-c> :Submit
                                            :<c-c><c-k> :Abort
                                            :q :Close}
                            :finder {:<c-c> :Close
                                     :<c-j> :NOP
                                     :<c-n> :Next
                                     :<c-p> :Previous
                                     :<cr> :Select
                                     :<down> :Next
                                     :<esc> :Close
                                     :<s-tab> :MultiselectTogglePrevious
                                     :<tab> :MultiselectToggleNext
                                     :<up> :Previous}
                            :popup {:? :HelpPopup
                                    :A :CherryPickPopup
                                    :d :DiffPopup
                                    :M :RemotePopup
                                    :p :PushPopup
                                    :O :ResetPopup
                                    :z :StashPopup
                                    :b :BranchPopup
                                    :c :CommitPopup
                                    :f :FetchPopup
                                    :l :LogPopup
                                    :m :MergePopup
                                    :F :PullPopup
                                    :r :RebasePopup
                                    :_ :RevertPopup
                                    :Z :WorktreePopup}
                            :rebase_editor {:<c-c><c-c> :Submit
                                            :<c-c><c-k> :Abort
                                            :<cr> :OpenCommit
                                            :b :Break
                                            :d :Drop
                                            :e :Edit
                                            :f :Fixup
                                            :gj :MoveDown
                                            :gk :MoveUp
                                            :p :Pick
                                            :q :Close
                                            :r :Reword
                                            :s :Squash
                                            :x :Execute}
                            :status {:$ :CommandHistory
                                     :1 :Depth1
                                     :2 :Depth2
                                     :3 :Depth3
                                     :4 :Depth4
                                     :<c-r> :RefreshBuffer
                                     :<c-s> :StageAll
                                     :<c-t> :TabOpen
                                     :<c-v> :VSplitOpen
                                     :<c-x> :SplitOpen
                                     :<enter> :GoToFile
                                     :<tab> :Toggle
                                     :I :InitRepo
                                     :S :StageUnstaged
                                     :U :UnstageStaged
                                     :Y :YankSelected
                                     :q :Close
                                     :s :Stage
                                     :u :Unstage
                                     :x :Discard
                                     "{" :GoToPreviousHunkHeader
                                     "}" :GoToNextHunkHeader}}}))

M
