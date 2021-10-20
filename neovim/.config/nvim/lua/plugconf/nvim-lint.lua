require('lint').linters_by_ft = {
  python = {'flake8',},
}

vim.api.nvim_command("au BufWritePost <buffer> lua require('lint').try_lint()")
