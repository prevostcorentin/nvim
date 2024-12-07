require('telescope').setup {
    extensions = {
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
                "fd",
                "--type",
                "file",
                "--hidden",
                "--strip-cwd-prefix"
            }
        }
    }
}

require('telescope').load_extension('fzf')
