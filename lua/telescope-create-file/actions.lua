local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local Path = require("plenary.path")
local utils = require("telescope.utils")
local builtin = require("telescope.builtin")

local M = {}

local function create_or_open_file(path)
  local file_path = Path:new(path)
  local dir_path = file_path:parent()
  
  -- Create parent directories if they don't exist
  if not dir_path:exists() then
    dir_path:mkdir({ parents = true })
  end
  
  -- Create the file if it doesn't exist
  file_path:touch()
  
  -- Open the file
  vim.cmd("edit! " .. vim.fn.fnameescape(file_path:absolute()))
end

local function find_or_create_files(opts)
  opts = opts or {}
  local original_attach = opts.attach_mappings
  
  opts.attach_mappings = function(prompt_bufnr, map)
    if original_attach then
      original_attach(prompt_bufnr, map)
    end
    
    actions.select_default:replace(function()
      local prompt = action_state.get_current_line()
      actions.close(prompt_bufnr)
      
      if not prompt or prompt == "" then return end
      
      local target_path = Path:new(opts.cwd or vim.loop.cwd(), prompt):absolute()
      
      if vim.fn.filereadable(target_path) == 1 then
        vim.cmd("edit! " .. vim.fn.fnameescape(target_path))
      else
        create_or_open_file(target_path)
      end
    end)
    
    return true
  end
  
  builtin.find_files(opts)
end

M.find_or_create_files = function()
  find_or_create_files({ cwd = utils.buffer_dir() })
end

M.find_or_create_files_from_cwd = function()
  find_or_create_files() -- no cwd override
end

return M
