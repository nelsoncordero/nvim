vim.api.nvim_exec(
    [[
        autocmd BufNewFile,BufRead *.mdx set filetype=markdown.mdx
    ]],
    false
)
vim.api.nvim_exec(
    [[
        autocmd BufNewFile,BufRead *.astro set filetype=astro
    ]],
    false
)
