require('telescope').setup {
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_cursor { }
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case'
        }
    },
    defaults = {
      layout_strategy = 'vertical',
      layout_config = { height = 0.95 },
    },
    pickers = {
        find_files = {
            find_command = {
                'fd',
                '--type',
                'file',
                '--hidden',
                '--strip-cwd-prefix'
            }
        }
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')
