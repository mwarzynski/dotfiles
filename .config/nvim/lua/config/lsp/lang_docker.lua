vim.api.nvim_create_autocmd("FileType", {
  pattern = "dockerfile",
  callback = function()
    vim.lsp.start({
      name = "dockerls",
      cmd = { "docker-langserver", "--stdio" },
      root_dir = vim.fn.getcwd(),
    })
  end,
})
