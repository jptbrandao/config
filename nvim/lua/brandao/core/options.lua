local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- tabs & identation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.smartcase = true
opt.ignorecase = true

opt.cursorline = true

opt.termguicolors = true
opt.signcolumn = "yes"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- disable backup files
opt.backup = false

-- disable swap files
opt.swapfile = false

opt.scrolloff = 6

opt.colorcolumn = "100"

-- disable mouse
opt.mouse = "nvi"

-- #grib to decide
-- opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldlevel = 10
