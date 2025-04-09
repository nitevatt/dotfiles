require("formatter").setup({
  filetype = {
    lua = { require("formatter.filetypes.lua").stylua },
    css = { require("formatter.defaults.prettier") },
    html = { require("formatter.defaults.prettier") },
    javascript = { require("formatter.defaults.prettier") },
    javascriptreact = { require("formatter.defaults.prettier") },
    json = { require("formatter.defaults.prettier") },
    markdown = { require("formatter.defaults.prettier") },
    scss = { require("formatter.defaults.prettier") },
    typescript = { require("formatter.defaults.prettier") },
    typescriptreact = { require("formatter.defaults.prettier") },
    yaml = { require("formatter.defaults.prettier") },
  },
})
