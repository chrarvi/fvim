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

 (fn M.config []
   (local dap (require :dap))
   (local dap-python (require :dap-python))

   ;; Mason provides debugpy; the project venv runs the debuggee.
   (dap-python.setup :debugpy-adapter)
   (set dap-python.resolve_python project-python)
   (set dap-python.test_runner :pytest)

   (map! [n] :<F5> dap.continue)
   (map! [n] :<F10> dap.step_over)
   (map! [n] :<F11> dap.step_into)
   (map! [n] :<F12> dap.step_out)
   (map! [n] :<leader>db dap.toggle_breakpoint)
   (map! [n] :<leader>dr dap.repl.toggle)
   (map! [n] :<leader>dt dap-python.test_method)
   (map! [n] :<leader>dT dap-python.test_class)
   (map! [n] :<leader>dq dap.terminate))

 M
