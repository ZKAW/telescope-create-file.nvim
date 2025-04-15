local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("This plugin requires nvim-telescope/telescope.nvim")
end

local actions = require("telescope-create-file.actions")

return telescope.register_extension({
  exports = {
    create_file = actions.find_or_create_files,
    create_file_from_cwd = actions.find_or_create_files_from_cwd,
  },
})
