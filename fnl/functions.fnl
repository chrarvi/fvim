(local M {})

(lambda M.require-and [module callback]
  (callback (require module)))

(lambda M.file-exists-p [file]
  (> (vim.fn.filereadable file) 0))

(fn M.project-root []
  (let [git-cmd "git rev-parse --show-toplevel"
                handle (io.popen git-cmd)]
    (var result (handle:read :*a))
    (handle:close)
    (set result
         (result:gsub "^%s*(.-)%s*$" "%1"))
    result))

(fn M.gh [src] (.. "https://github.com/" src))
(fn M.cb [src] (.. "https://codeberg.org/" src))

M
