local colors = {
  black        = '#282828',
  white        = '#ebdbb2',
  red          = '#fb4934',
  green        = '#b8bb26',
  blue         = '#83a598',
  purple       = '#d3869b',
  yellow       = '#fe8019',
  inactivegray = '#7c6f64',
  transparent  = '#1d2021',
}

local custom_gruvbox = require'lualine.themes.gruvbox'

custom_gruvbox = {
  normal = {
    a = {bg = colors.green},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.white, gui = 'bold'},
  },
  insert = {
    a = {bg = colors.blue},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.white, gui = 'bold'},
  },
  visual = {
    a = {bg = colors.yellow},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.white, gui = 'bold'},
  },
  replace = {
    a = {bg = colors.red},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.white, gui = 'bold'},
  },
  command = {
    a = {bg = colors.purple},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.white, gui = 'bold'},
  },
  inactive = {
    c = {bg = colors.transparent, fg = colors.inactivegray, gui = 'none'},
  }
}

local function check_git_workspace()
  local filepath = vim.fn.expand('%:p:h')
  local gitdir = vim.fn.finddir('.git', filepath .. ';')
  return gitdir and #gitdir > 0 and #gitdir < #filepath
end

local function git_icon()
  return check_git_workspace() and '' or ''
end

local function mode_whitespace()
  return ' '
end

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = custom_gruvbox,
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {{mode_whitespace, padding = 0}},
    lualine_b = {},
    lualine_c = {
      'filename',
      {git_icon, color = {fg = '#F1502F'}, right_padding = 0},
      {'branch', icon = '', padding = 0}
    },
    lualine_x = {'filetype', 'location'},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'nvim-tree'}
})
