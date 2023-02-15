local configs = require('nvim-treesitter.configs')
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- Tell vim what the Salesforce filetypes are so the lsp and tree sitter can work
vim.filetype.add({
    extension = {
        cls = "apexcode",
        trigger = "apexcode",
        soql = "soql",
        sosl = "sosl",
    }
})

-- Salesforce-specific parser stuff here because the ones from 'lspconfig' and the Mason packages are broked;
-- I took someone's treesitter setup and made it specific to neovim's treesitter
parser_config.apexcode = {
	install_info = {
		url = "https://github.com/dkelll/tree-sitter-apex",
		files = {
			"src/parser.c",
		},
		branch = "main",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
	filetype = "apexcode",
}

parser_config.soql = {
	install_info = {
		url = "https://github.com/dkelll/tree-sitter-soql",
		files = {
			"src/parser.c",
		},
		branch = "main",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
}

parser_config.sosl = {
	install_info = {
		url = "https://github.com/dkelll/tree-sitter-sosl",
		files = {
			"src/parser.c",
		},
		branch = "main",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
}

configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "apexcode", "help", "javascript", "lua", "rust", "typescript" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
      },
  }
}
