local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<C-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local autocmd = vim.api.nvim_create_autocmd
autocmd('BufRead,BufNewFile', {
    pattern = "*.rs",
    command = "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
})
