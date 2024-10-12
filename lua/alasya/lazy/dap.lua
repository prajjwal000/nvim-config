vim.keymap.set('n', '<leader>dc',":lua require('dap').continue()<CR>" )
vim.keymap.set('n', '<leader>s',":lua require('dap').step_over()<CR>" )
vim.keymap.set('n', 's',":lua require('dap').step_into()<CR>" )
vim.keymap.set('n', '<leader>db',":lua require('dap').step_out()<CR>" )
vim.keymap.set('n', '<Leader>b',":lua require('dap').toggle_breakpoint()<CR>" )
vim.keymap.set('n', '<Leader>B',":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint message: '))<CR>" )
vim.keymap.set('n', '<Leader>lp',":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" )
vim.keymap.set('n', '<Leader>dr',":lua require('dap').repl.open()<CR>" )
vim.keymap.set('n', '<Leader>dt',":lua require('dap-go').debug_test()<CR>" )
vim.keymap.set('n', '<leader>st',":lua require('dapui').float_element()<CR>" )

return{
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        require("nvim-dap-virtual-text").setup()
        require("dapui").setup({
            layouts = { {
        elements = { {
            id = "scopes",
            size = 0.75
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "repl",
            size = 1.0
          } },
        position = "bottom",
        size = 10
      } },
        })
        require("dap-go").setup()


        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
    end
}
