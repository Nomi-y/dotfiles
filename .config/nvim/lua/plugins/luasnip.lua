return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local ls = require("luasnip")

        -- Basic LuaSnip configuration
        ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })

        -- Load built-in snippets from vscode and snipmate
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()

        -- Load custom snippets from snippets directory
        local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets/"
        require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_path })
    end
}
