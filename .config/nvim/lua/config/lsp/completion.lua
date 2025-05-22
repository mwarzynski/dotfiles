local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- Check if luasnip has a next placeholder to jump to
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				-- If no completion visible and no snippet jump, call fallback
				-- This might be useful for other Tab behavior like indenting
				fallback()
			end
		end, { "i", "s" }), -- "i" for insert mode, "s" for select mode (while in a snippet)

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			-- Check if luasnip has a previous placeholder to jump to
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				-- If no completion visible and no snippet jump, call fallback
				fallback()
			end
		end, { "i", "s" }), -- "i" for insert mode, "s" for select mode
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})
