vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/b0o/SchemaStore.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		javascript = { "biome" },
		typescript = { "biome-check" },
		typescriptreact = { "biome-check" },
		css = { "biome" },
		html = { "biome" },
		json = { "biome" },
		yaml = { "biome" },
		lua = { "stylua" },
		python = { "isort" },
		go = { "gofmt" },
		typst = { "typstyle" },
		sh = { "beautysh" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ansiblels",
		"ts_ls",
		"dockerls",
		"rust_analyzer",
		"yamlls",
		"tailwindcss",
		"cssls",
		"jsonls",
	},
})

local capabilities = require("mini.completion").get_lsp_capabilities()

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
				disable = { "missing-fields" },
			},
			completion = {
				callSnippet = "Replace",
			},
			hint = {
				enable = true,
			},
		},
	},
})

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			},
		},
	},
})

vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
	settings = {
		tailwindCSS = {
			classFunctions = { "cva", "cx" },
		},
	},
})

vim.lsp.config("yamlls", {
	capabilities = capabilities,
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})

vim.lsp.config("jsonls", {
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})
