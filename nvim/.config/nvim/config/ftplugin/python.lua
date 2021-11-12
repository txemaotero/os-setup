-- DAP settings

local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = '/usr/local/bin/python3';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options for debugpy (https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings) 
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- Try to find the python interpreter in venv if not return the default python3
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/local/bin/python3'
      end
    end;
  },
}
