--[[
if true then
    return {}
end
--]]

return {
    "saghen/blink.cmp",
    enabled = false,
    dependencies = { "saghen/blink.compat" },
    opts = {
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        },
        completion = {
            ghost_text = {
                enabled = false,
                -- trigger = {
                --     show_on_blocked_trigger_characters = {},
            },
        },
        -- sources = {
        -- compat = { "supermaven" },
        -- providers = {
        --     supermaven = {
        --         kind = "Supermaven",
        --         score_offset = 100,
        --         async = true,
        --     },
        --     -- lsp = {
        --     --     override = {
        --     --         get_trigger_characters = function(self)
        --     --             local trigger_characters = self:get_trigger_characters()
        --     --             vim.list_extend(trigger_characters, { "\n", "\t", " " })
        --     --             return trigger_characters
        --     --         end,
        --     --     },
        --     -- },
        -- },
        -- },
    },
}
