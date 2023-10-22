local setup = function()
  local highlight = {
    "CursorColumn",
    "Whitespace",
  }
  require("ibl").setup({
    indent = { highlight = highlight, char = "" },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  })
end

return {
  -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
  config = setup,
}
