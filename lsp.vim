" Enable diagnostics highlighting and custmo sign characters
autocmd User LspSetup call LspOptionsSet(#{
        \   autoHighlightDiags: v:true,
        \   diagSignErrorText: '✘',
        \   diagSignWarningText: '▲',
        \   diagSignInfoText: '»',
        \   diagSignHintText: '⚑',
        \ })
let lspServers = [
        \ #{
        \    name: 'tsserver',
        \    filetype: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
        \    path: 'typescript-language-server',
        \    args: ['--stdio']
        \ },
        \ #{
        \    name: 'pyright',
        \    filetype: ['python'],
        \    path: 'pyright-langserver',
        \    args: ['--stdio']
        \ },
        \ #{
        \    name: 'rustanalyzer',
        \    filetype: ['rust'],
        \    path: 'rust-analyzer',
        \    args: [],
        \    syncInit: v:true,
        \    initializationOptions: {
        \      'rust-analyzer': {
        \        'cargo': {
        \          'buildScripts': { 'enable': v:true }
        \        },
        \        'procMacro': { 'enable': v:true }
        \      }
        \    }
        \ }
        \ ]

autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :call LspOptionsSet(#{hoverInPreview: v:false}) \| LspHover<CR>
nnoremap <leader>K  :call LspOptionsSet(#{hoverInPreview: v:true}) \| LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

