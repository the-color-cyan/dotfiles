-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- move to window using <ctrl> arrow keys
map("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- move to window using <leader>w arrow keys
map("n", "<leader>w<Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<leader>w<Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<leader>w<Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<leader>w<Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- resize window using <ctrl + alt> arrow keys
map("n", "<C-A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- navigate buffers with <shift> left/right
map("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- move lines with <alt> up/down
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- claude-code
map("n", "<leader>ct", "<cmd>ClaudeCode<CR>", { desc = "Claude Code" })

-- vscode keymaps
if vim.g.vscode then
    -- general keymaps
    map({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
    map({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
    map({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
    map({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
    map({ "n", "v" }, "<leader>z", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")
    map({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
    map({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
    map({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
    map({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
    map({ "n", "v" }, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
    map({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

    -- harpoon keymaps
    map({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
    map({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
    map({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
    map({ "n", "v" }, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
    map({ "n", "v" }, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
    map({ "n", "v" }, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
    map({ "n", "v" }, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
    map({ "n", "v" }, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
    map({ "n", "v" }, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
    map({ "n", "v" }, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
    map({ "n", "v" }, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
    map({ "n", "v" }, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

    -- project manager keymaps
    -- map({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
    -- map({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
    -- map({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
end
