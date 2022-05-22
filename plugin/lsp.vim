set completeopt=menuone,noinsert,noselect

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR> nnoremap <leader>vi :lua
vim.lsp.buf.implementation()<CR> nnoremap <leader>vsh :lua
vim.lsp.buf.signature_help()<CR> nnoremap <leader>vh :lua
vim.lsp.buf.hover()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy'] lua
lua require'lspconfig'.tsserver.setup{
on_attach=require'completion'.on_attach}
