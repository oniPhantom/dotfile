local function open_nvim_tree()
  if vim.fn.argc() > 0 or not vim.fn.empty(vim.fn.glob(vim.fn.stdpath("config") .. "/*")) then
    return
  end
  require("nvim-tree.api").tree.open()
end

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
    require("nvim-tree").setup({
      auto_reload_on_write = true
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = open_nvim_tree,
    })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" }
}
