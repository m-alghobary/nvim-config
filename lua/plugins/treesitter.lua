return { 
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master', 
    lazy = false, 
    build = ":TSUpdate",

    opts = {
        ensure_installed = { "c", "lua", "javascript", "typescript", "php", "vue", "html", "css" },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true
        }
    }
}
