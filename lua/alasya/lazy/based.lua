return {
    "folke/tokyonight.nvim",

    {
        "mbbill/undotree",
        config = function()

            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
            end
        },
  "https://github.com/tpope/vim-fugitive",
  "folke/zen-mode.nvim",
}
