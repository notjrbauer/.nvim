vim.opt.completeopt = { "menuone", "noinsert" }

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        -- If <S-Tab> is not working in your terminal, change it to <C-h>
        return t "<S-Tab>"
    end
end

-- Don't show the dumb matching stuff.
vim.cmd [[set shortmess+=c]]


local has_compe, compe = pcall(require, "compe")
if has_compe then
    compe.setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        throttle_time = 200,
        source_timeout = 200,
        incomplete_delay = 400,
        allow_prefix_unmatch = false,

        source = {
            path = true,
            buffer = true,
            calc = false,
            vsnip = false,
            nvim_lsp = true,
            nvim_lua = true,
            spell = true,
            tags = true,
            treesitter = false,
            snippets_nvim = false,
        },
    }

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
end

local has_completion = pcall(require, "completion")
if has_completion then
    -- completion.nvim
    vim.g.completion_confirm_key = ""
    vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
    -- vim.g.completion_enable_snippet = "snippets.nvim"

    -- Decide on length
    vim.g.completion_trigger_keyword_length = 2

    -- vim.g.completion_chain_complete_list = {
        --   default = {
            --     {
                --       {complete_items = {'lsp', 'snippet'}},
                --       {complete_items = {'buffer'}}, {mode = 'file'}
                --     }
                --   }
                -- }
            end

