require("ultest").setup({
    builders = {
        ['python#pytest'] = function (cmd)
            -- The command can start with python command directly or an env manager
            local non_modules = {'python', 'pipenv', 'poetry'}
            -- Index of the python module to run the test.
            local module
            if vim.tbl_contains(non_modules, cmd[1]) then
                module_index = 3
            else
                module_index = 1
            end
            -- Remaining elements are arguments to the module
            local args = vim.list_slice(cmd, module_index + 1)
            return {
                dap = {
                    type = 'python',
                    name = 'Ultest Debugger',
                    request = 'launch',
                    module = cmd[module_index],
                    args = args
                }
            }
        end
    }
})
