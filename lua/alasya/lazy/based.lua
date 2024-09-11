return {
    "folke/tokyonight.nvim",

    {
        "mbbill/undotree",
        config = function()

            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
            end
        },
  "folke/zen-mode.nvim",
}
