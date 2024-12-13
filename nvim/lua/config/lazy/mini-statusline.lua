return {
  "echasnovski/mini.statusline",
  version = "*",
  dependencies = {
    {
      "echasnovski/mini-git",
      version = "*",
      main = "mini.git"
    },
    {
      "echasnovski/mini.diff",
      version = "*"
    }
  },
  config = function ()
    require("mini.statusline").setup()
  end
}
