local M = {}

function M.clean_whitespace()
  -- Delete trailing whitespace
  vim.cmd([[%s/\s\+$//e]])
  -- Remove multiple newlines at EOF
  vim.cmd([[%s/\(\n\)\+\%$//e]])
end

vim.api.nvim_create_augroup('AutoCleanWhitespace', { clear = true })

function M.enable_clean_whitespace()
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'AutoCleanWhitespace',
    pattern = '*',
    callback = M.clean_whitespace,
  })
end

function M.disable_clean_whitespace()
  vim.api.nvim_clear_autocmds({ group = 'AutoCleanWhitespace' })
end

vim.api.nvim_create_user_command('EnableAutoCleanWhitespace', M.enable_clean_whitespace, {})
vim.api.nvim_create_user_command('DisableAutoCleanWhitespace', M.disable_clean_whitespace, {})
vim.api.nvim_create_user_command('CleanWhitespace', M.clean_whitespace, {})

-- Enable by default
M.enable_clean_whitespace()
