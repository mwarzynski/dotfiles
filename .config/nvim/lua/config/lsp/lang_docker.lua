local M = {}

function M.setup(on_attach_func, capabilities_table)
    require('lspconfig').dockerls.setup({
        on_attach = on_attach_func,      -- Use the shared on_attach function
        capabilities = capabilities_table, -- Use the shared capabilities table

        settings = {
            docker = {
                -- Example setting (check dockerls documentation for available options)
                -- validation = "strict",
            }
        },
    })
end

return M
