local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use("nvim-lua/plenary.nvim") -- Common lua utilities for Neovim
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("neovim/nvim-lspconfig") -- LSP
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("windwp/nvim-autopairs")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("numToStr/Comment.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- use("glepnir/lspsaga.nvim")
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"lewis6991/gitsigns.nvim",
		tag = "release",
	})
	use("dinhhuy258/git.nvim") -- For git blame & browse
	use("~/Code/neovim/lspsaga.nvim")
	use("lukas-reineke/indent-blankline.nvim")
end)
