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
    use("folke/lsp-colors.nvim")
    -- use("ray-x/go.nvim")
    -- use("ray-x/guihua.lua") -- recommanded if need floating window support

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
    use({ "glepnir/lspsaga.nvim", commit = "b7b4777369b441341b2dcd45c738ea4167c11c9e" })
    use("mfussenegger/nvim-dap")
    use("leoluz/nvim-dap-go")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("theHamsta/nvim-dap-virtual-text")
    use({
        "lewis6991/gitsigns.nvim",
    })
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    use("dinhhuy258/git.nvim") -- For git blame & browse
    use("nvim-tree/nvim-tree.lua")
    use({ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" })
end)
