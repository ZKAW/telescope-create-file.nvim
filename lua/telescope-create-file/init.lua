local M = {}

function M.setup(opts)
  -- This function will be called when the plugin is setup
  -- You can add configuration options here if needed
  opts = opts or {}
end

-- Export the main functions
M.find_or_create_files = require("actions").find_or_create_files
M.find_or_create_files_from_cwd = require("actions").find_or_create_files_from_cwd

return M
