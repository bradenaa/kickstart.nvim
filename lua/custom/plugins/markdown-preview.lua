return {
  {
    -- install without yarn or npm
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    keys = {
      {
        '<leader>mp',
        ft = 'markdown',
        '<cmd>MarkdownPreviewToggle<cr>',
        desc = 'Markdown Preview',
      },
    },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      -- Not really sure what this would do at the moment so I am leaving it as is.
      -- vim.cmd [[do FileType]]
      vim.cmd [[
         function OpenMarkdownPreview (url)
             execute "silent ! firefox --new-window " . a:url
             "execute "silent ! open -a Google\ Chrome -n --args --new-window " . a:url
         endfunction
      ]]
      vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    end,
  },
}
