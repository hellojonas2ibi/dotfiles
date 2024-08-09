local function nmap(key, action)
    vim.keymap.set('n', key, action, { noremap = true, silent = true })
end

nmap('<Esc>', '<cmd>nohlsearch<CR>')
nmap('<leader>db', '<cmd>bw!<CR>')
nmap('<leader>dba', '<cmd>%bw!<CR>')
nmap('<leader>fe', '<cmd>Ex<CR>')

nmap('<C-k>', '<C-w>k')
nmap('<C-j>', '<C-w>j')
nmap('<C-h>', '<C-w>h')
nmap('<C-l>', '<C-w>l')

nmap('gh', '<cmd>diffget //2<CR>')
nmap('gl', '<cmd>diffget //3<CR>')

nmap('<leader>odb', '<cmd>DBUI<CR>')

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local function reload_config()
    for name, _ in pairs(package.loaded) do
        if name:match('^user') and not name:match('lazy') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("neovim configuration reloaded..", vim.log.levels.INFO)
end

nmap('<leader><leader>r', reload_config)

nmap('<leader><leader>x', '<cmd>source %<CR>')
