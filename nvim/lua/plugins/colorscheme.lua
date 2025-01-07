return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        style = "night",
        terminal_colors = true,
        bg_opacity = 0.9,
      }
    end,
  },
}
