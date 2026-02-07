-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Quitar background de selección visual - FORZAR
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    pattern = "*",
    group = vim.api.nvim_create_augroup("RemoveVisualBg", { clear = true }),
    callback = function()
        vim.schedule(function()
            -- Forzar con comando vim directo
            vim.cmd("highlight Visual guibg=NONE ctermbg=NONE")
            vim.cmd("highlight VisualNOS guibg=NONE ctermbg=NONE")
            -- También con API
            vim.api.nvim_set_hl(0, "Visual", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "VisualNOS", { bg = "NONE" })
        end)
    end,
})

-- Aplicar periódicamente para asegurar
vim.defer_fn(function()
    vim.cmd("highlight Visual guibg=NONE ctermbg=NONE")
    vim.cmd("highlight VisualNOS guibg=NONE ctermbg=NONE")
end, 2000)
