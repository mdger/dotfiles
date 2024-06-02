local M = {}

M.json_decode = vim.json.decode

---@param path string?
---@return table
function M.getconfigs(path)
  local resolved_path = path or (vim.fn.getcwd() .. "/.vscode/launch.json")
  if not vim.loop.fs_stat(resolved_path) then
    return {}
  end
  local lines = {}
  for line in io.lines(resolved_path) do
    if not vim.startswith(vim.trim(line), "//") then
      table.insert(lines, line)
    end
  end
  local contents = table.concat(lines, "\n")
  return vim.json.decode(contents)
end

return M
