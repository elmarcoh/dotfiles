require('lint').linters_by_ft = {
  python = {'flake8',},
}

vim.cmd "autocmd BufWritePost *.py lua require('lint').try_lint()"
