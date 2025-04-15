if vim.g.loaded_telescope_create_file == 1 then
  return
end
vim.g.loaded_telescope_create_file = 1

-- Create user commands
vim.api.nvim_create_user_command("TelescopeCreateFile", function()
  require("telescope-create-file").find_or_create_files()
end, {})

vim.api.nvim_create_user_command("TelescopeCreateFileCwd", function()
  require("telescope-create-file").find_or_create_files_from_cwd()
end, {})
