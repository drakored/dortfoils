local cmp = require('cmp')
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed {
--	'apex_ls',
	'eslint',
	'rust_analyzer',
	-- 'soql',
	-- 'sosl',
	-- 'sumneko_lua',
}

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({ 
	mapping = cmp_mappings

})

lsp.on_attach(function(client,bufnr)
	print("help")
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.worspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
end)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.worspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
end

require'lspconfig'.apex_ls.setup({
    cmd = {
        "java",
        "-jar",
       os.getenv("HOME") ..  "/.vscode-server/extensions/salesforce.salesforcedx-vscode-apex-56.5.1/dist/apex-jorje-lsp.jar",
        --"apex.jorje.lsp.ApexLanguageServerLauncher"
    },
    on_attach = on_attach,
    apex_jar_path = os.getenv("HOME") ..  "/.vscode-server/extensions/salesforce.salesforcedx-vscode-apex-56.5.1/dist/apex-jorje-lsp.jar",
    apex_enable_semantic_errors = true,
    apex_enable_completion_statistics = false,
    filetypes = { "apex", "cls", "trigger" },
    root_dir = require'lspconfig'.util.root_pattern("sfdx-project.json")
})

lsp.nvim_workspace()
lsp.setup()
