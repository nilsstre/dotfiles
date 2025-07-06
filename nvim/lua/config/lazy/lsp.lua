return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"onsails/lspkind.nvim",
	},
	config = function()
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		vim.keymap.set(
			"n",
			"Äd",
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			{ desc = "Go to previous diagnostic error" }
		)
		vim.keymap.set("n", "äd", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to next diagnostic error" })

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				-- these will be buffer-local keybindings
				-- because they only work if you have an active language server

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = event.buf, desc = "Show info" })
				vim.keymap.set(
					"n",
					"gd",
					"<cmd>lua vim.lsp.buf.definition()<cr>",
					{ buffer = event.buf, desc = "Goto definition" }
				)
				vim.keymap.set(
					"n",
					"gD",
					"<cmd>lua vim.lsp.buf.declaration()<cr>",
					{ buffer = event.buf, desc = "Goto declaration" }
				)
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>lua vim.lsp.buf.implementation()<cr>",
					{ buffer = event.buf, desc = "Goto implementation" }
				)
				vim.keymap.set(
					"n",
					"go",
					"<cmd>lua vim.lsp.buf.type_definition()<cr>",
					{ buffer = event.buf, desc = "Goto type definition" }
				)
				vim.keymap.set(
					"n",
					"gr",
					"<cmd>lua vim.lsp.buf.references()<cr>",
					{ buffer = event.buf, desc = "Show references" }
				)
				vim.keymap.set(
					"n",
					"gs",
					"<cmd>lua vim.lsp.buf.signature_help()<cr>",
					{ buffer = event.buf, desc = "Show signature help" }
				)
				vim.keymap.set(
					"n",
					"<F2>",
					"<cmd>lua vim.lsp.buf.rename()<cr>",
					{ buffer = event.buf, desc = "Rename" }
				)
				vim.keymap.set(
					{ "n", "x" },
					"<F3>",
					"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
					{ buffer = event.buf, desc = "Reformat (async)" }
				)
				vim.keymap.set(
					"n",
					"<F4>",
					"<cmd>lua vim.lsp.buf.code_action()<cr>",
					{ buffer = event.buf, desc = "Code action" }
				)
			end,
		})

		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local lsp_capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		local default_setup = function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = lsp_capabilities,
			})
		end

		require("fidget").setup({})

		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				"sqls",
				"taplo",
				"terraformls",
				"ts_ls",
				"vimls",
				"yamlls",
			},
			handlers = {
				default_setup,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = lsp_capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				"editorconfig-checker",
				"eslint_d",
				"golangci-lint",
				"pflake8",
				"prettier",
				"pylint",
				"stylua",
				"tflint",
				"tfsec",
				"vale",
			},
		})

		require("luasnip.loaders.from_vscode").lazy_load()

		local snippet_expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end

		local lspkind = require("lspkind")

		vim.diagnostic.config({
			float = { border = "round" },
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "spell" },
			}),
			mapping = cmp.mapping.preset.insert({
				-- Enter key confirms completion item
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- Ctrl + c triggers completion menu
				["<C-c>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			}),
			snippet = {
				expand = snippet_expand,
			},
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 80,
					ellipsis_char = "...",
					mode = "symbol_text",
					menu = {
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						-- path = "[PATH]",
						cmdline = "[CMD]",
						luasnip = "[LuaSnip]",
						spell = "[Spell]",
					},
				}),
			},
			window = {
				completion = {
					scrollbar = false,
					border = "rounded",
					winhighlight = "Normal:CmpNormal",
				},
				documentation = {
					scrollbar = false,
					border = "rounded",
					winhighlight = "Normal:CmpNormal",
				},
			},
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
