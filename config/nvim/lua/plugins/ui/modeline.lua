return {
  'nvimdev/modeline.nvim',
  event = { 'BufReadPost */*', 'BufNewFile' },
  config = function()
    require('modeline').setup()
  end,
}
