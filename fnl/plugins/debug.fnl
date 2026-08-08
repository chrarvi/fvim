 (import-macros {: map!} :hibiscus.vim)

 (local M
   {1 :mfussenegger/nvim-dap
    :dependencies [{1 :mfussenegger/nvim-dap-python}
                   :williamboman/mason.nvim]})

 (fn project-python []
   (let [root (vim.fs.root 0 :.git)
         marker (and root
                     (vim.fs.joinpath root :confs :coding :ty.toml))
         python (and root
                     (vim.fs.joinpath root :tools :venv :bin :python))]
     (if (and marker
              (= (vim.fn.filereadable marker) 1)
              python
              (= (vim.fn.executable python) 1))
         python
         (or (vim.fn.exepath :python3) :python3))))


(fn project-dap-config [config]
  (let [root (vim.fs.root 0 :.git)
        wrapper (and root
                     (vim.fs.joinpath root :tools :bin :uv_run.sh))]
    (if (and (= config.request :launch)
             wrapper
             (= (vim.fn.executable wrapper) 1))
        (vim.tbl_extend :force config
                        {:cwd root
                         :python [wrapper :python]})
        config)))

 (fn M.config []
   (local dap (require :dap))
   (local dap-python (require :dap-python))

   ;; Mason provides debugpy; the project venv runs the debuggee.
   (dap-python.setup :debugpy-adapter)
   (set dap-python.resolve_python project-python)
   (set dap-python.test_runner :pytest)

   (tset dap.listeners.on_config :project-uv
         project-dap-config)

   (map! [n] :<leader>dc dap.continue)
   (map! [n] :<leader>dn dap.step_over)
   (map! [n] :<leader>ds dap.step_into)
   (map! [n] :<leader>do dap.step_out)
   (map! [n] :<leader>db dap.toggle_breakpoint)
   (map! [n] :<leader>dr dap.repl.toggle)
   (map! [n] :<leader>dt dap-python.test_method)
   (map! [n] :<leader>dT dap-python.test_class)
   (map! [n] :<leader>dq dap.terminate)

   (vim.api.nvim_create_user_command
     :RunScriptWithArgs
     (fn [t]
       (let [args (vim.split (vim.fn.expand t.args) "\n")
                  approval
                  (vim.fn.confirm
                    (.. "Will try to run:\n    "
                        vim.bo.filetype " "
                        (vim.fn.expand "%") " "
                        t.args "\n\n"
                        "Do you approve? ")
                    "&Yes\n&No"
                    1)]
         (when (= approval 1)
           (dap.run {:type vim.bo.filetype
                    :request :launch
                    :name "Launch file with custom arguments (adhoc)"
                    :program "${file}"
                    :args args}))))
     {:complete :file
     :nargs "*"})

    (map! [n] :<leader>dR
          ":RunScriptWithArgs "
          "Run script with arguments"))

 M
