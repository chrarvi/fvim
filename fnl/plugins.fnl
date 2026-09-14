(local plugin-dir (.. (vim.fn.stdpath :config) :/lua/plugins))

(fn load []
  (let [plugins []]
    (each [name type (vim.fs.dir plugin-dir)]
      (when (= type :file)
        (table.insert plugins name)))
    (table.sort plugins)
    (each [_ name (ipairs plugins)]
      (require (.. :plugins. (string.gsub name "%.lua$" ""))))))

(load)
