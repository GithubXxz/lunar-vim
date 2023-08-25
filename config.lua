--[[
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
local home   = os.getenv("HOME")
package.path = home .. "/.config/lvim/?.lua"


-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
lvim.log.level              = "warn"
lvim.format_on_save.enabled = false

-- themes: https://vimcolorschemes.com/
-- lightscheme base16-atelier-seaside-light
lvim.colorscheme            = "tokyonight-night"
-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "colorscheme rose-pine"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- ---------- option ---------- ---
vim.opt.foldlevel           = 99
vim.opt.foldmethod          = "expr"
vim.opt.foldexpr            = "nvim_treesitter#foldexpr()"


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader                    = "space"

-- ---------- insert mode ---------- ---
lvim.keys.insert_mode["jj"]    = "<ESC>"
lvim.keys.insert_mode["<C-a>"] = "<Home>"
lvim.keys.insert_mode["<C-e>"] = "<End>"
lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"


-- ---------- visual mode ---------- ---
-- move
lvim.keys.visual_mode["<C-j>"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["<C-k>"] = ":m '<-2<CR>gv=gv"
lvim.keys.visual_mode["J"]     = "5j"
lvim.keys.visual_mode["K"]     = "5k"
lvim.keys.visual_mode["H"]     = "^"
lvim.keys.visual_mode["L"]     = "g_"


-- ---------- normal mode ---------- ---
lvim.keys.normal_mode["<C-l>"] = "<cmd>wincmd l<CR>"
lvim.keys.normal_mode["<C-h>"] = "<cmd>wincmd h<CR>"
lvim.keys.normal_mode["<C-j>"] = "<cmd>wincmd j<CR>"
lvim.keys.normal_mode["<C-k>"] = "<cmd>wincmd k<CR>"
lvim.keys.normal_mode["{"]     = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["}"]     = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-w>"] = "<cmd>bd<CR>"


-- move
lvim.keys.normal_mode["H"]     = "^"
lvim.keys.normal_mode["L"]     = "g_"
lvim.keys.normal_mode["J"]     = "5j"
lvim.keys.normal_mode["K"]     = "5k"
-- lvim.keys.normal_mode["j"]          = [[v:count ? 'j' : 'gj']]
-- lvim.keys.normal_mode["k"]          = [[v:count ? 'k' : 'gk']]

-- no highlight
lvim.keys.normal_mode["<C-n>"] = ":nohl<CR>"


-- ---------- OperatorPending ---------- ---
vim.keymap.set("o", "H", "^")
vim.keymap.set("o", "L", "g_")
-- lvim.keys.operator_pending_mode["H"]             = "^"
-- lvim.keys.operator_pending_mode["L"]             = "g_"

-- remove the builtin which_key maps
lvim.builtin.which_key.mappings.f          = nil
lvim.builtin.which_key.mappings.s          = nil
lvim.builtin.which_key.mappings.d          = nil
lvim.builtin.which_key.mappings.w          = nil
lvim.builtin.which_key.mappings.h          = nil
lvim.builtin.which_key.mappings.h          = nil
lvim.builtin.which_key.mappings.b          = nil
lvim.builtin.which_key.mappings.T          = nil
lvim.builtin.which_key.mappings.d          = nil

-- windows
lvim.builtin.which_key.mappings["w"]       = {
  name = "Windows",
  v = {
    "<cmd>wincmd v<CR>", "New Windows vertical"
  },
  h = {
    "<cmd>wincmd s<CR>", "New Windows horizontal"
  },
  e = {
    ":WinResizerStartResize<CR>", "Resize Windows"
  },
}

-- lsp
-- lvim.keys.normal_mode["<leader>in"]                   = ":lua vim.lsp.buf.incoming_calls()<cr>"
lvim.lsp.buffer_mappings.normal_mode['K']  = nil
lvim.lsp.buffer_mappings.normal_mode['gh'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" }
lvim.keys.visual_mode["<leader>lf"]        = "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>"

-- rm lvim/config.lua gr shortcut first
lvim.keys.term_mode["<C-h>"]               = false
lvim.keys.term_mode["<C-j>"]               = false
lvim.keys.term_mode["<C-k>"]               = false
lvim.keys.term_mode["<C-l>"]               = false


-- leap
lvim.keys.normal_mode["t"]                            = "<Plug>(leap-forward-to)"
lvim.keys.normal_mode["T"]                            = "<Plug>(leap-backward-to)"

-- undo tree
lvim.keys.normal_mode["<leader>u"]                    = ":UndotreeToggle<cr>"

-- indentlines
lvim.builtin.indentlines.options.use_treesitter       = true
lvim.builtin.indentlines.options.show_current_context = true

-- lualine
lvim.builtin.lualine.sections.lualine_c               = { { 'filename', path = 1 } }

-- auto pairs
lvim.builtin.autopairs.disable_filetype               = { "TelescopePrompt", "spectre_panel", "repl" }

-- dap
-- lvim.builtin.which_key.mappings.d                   = {
--   name = "Debug",
--   h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
--   x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
--   t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--   b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
--   c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--   C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
--   d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
--   g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
--   i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
--   o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
--   u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
--   p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
--   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
--   s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
--   q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
--   U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
-- }

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions                                      = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings              = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"]                  = { "<cmd>SessionManager load_session<CR>", "Projects" }


-- Fzf conftg
lvim.builtin.which_key.mappings["f"]                = {
  name = "Fzf",
  s = { ":FzfLua lsp_document_symbols<cr>", "Document symbols" },
  S = { ":FzfLua lsp_workspace_symbols<cr>", "Workspace symbols" },
  f = { ":FzfLua files<cr>", "Find files" },
  g = { ":FzfLua live_grep_glob<cr>", "Grep GW" },
  w = { ":FzfLua grep_cword<cr>", "Grep CW" },
  b = { ":FzfLua buffers<cr>", "Find buffers" },
  r = { ":FzfLua resume<cr>", "Resume" },
  h = { ":FzfLua oldfiles<cr>", "History files" },
  c = { ":FzfLua colorschemes<cr>", "Color Scheme" }
}
lvim.keys.normal_mode["gr"]                         = ":FzfLua lsp_references<cr>"
lvim.keys.normal_mode["<C-f>"]                      = ":FzfLua lgrep_curbuf<cr>"
lvim.keys.normal_mode["<leader>in"]                 = ":FzfLua lsp_incoming_calls<cr>"
lvim.keys.visual_mode["v"]                          = ":<c-u>FzfLua grep_visual<cr>"

-- CMake config
lvim.builtin.which_key.mappings["c"]                = {
  name = "CMake",
  g = { ":CMakeGenerate<CR>", "Generate" },
  b = { ":CMakeBuild<CR>", "Build" },
  r = { ":CMakeRun<CR>", "Run" },
}

-- alpha
lvim.builtin.alpha.active                           = false
lvim.builtin.alpha.mode                             = "dashboard"

-- terminal
lvim.builtin.terminal.active                        = true

-- nvim tree
-- lvim.keys.normal_mode["<C-e>"]                      = "<cmd>NvimTreeToggle<CR>"
lvim.builtin.nvimtree.setup.view.side               = "left"
lvim.builtin.nvimtree.setup.view.adaptive_size      = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- cmp
lvim.builtin.cmp.cmdline.enable                     = true
table.insert(lvim.builtin.cmp.sources, {
  name = 'nvim_lsp_signature_help'
});

-- gitsigns
lvim.builtin.gitsigns.opts.current_line_blame = false
lvim.builtin.gitsigns.opts.current_line_blame_opts.virt_text_pos = "left_align"
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 200

-- buffer line
lvim.builtin.bufferline.highlights.buffer_selected = {
  bold = true,
  fg = "#ffd43b"
}



-- tree sitter
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "json",
  "lua",
  "python",
  "yaml",
}

-- lsp
lvim.lsp.installer.setup.ensure_installed = {
  "clangd",
  "pyright",
}
lvim.lsp.installer.setup.automatic_installation = false

-- disable diagnostics which is super annoying in my case
vim.diagnostic.config({ virtual_text = false })

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "clangd" })
require("lvim.lsp.manager").setup("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
        autoImportCompletions = true
      }
    }
  },
})

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "pylsp"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- require "lsp_signature".on_attach()
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- -- set linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   -- { command = "flake8", filetypes = { "python" } },
--   -- {
--   --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--   --   command = "shellcheck",
--   --   ---@usage arguments to pass to the formatter
--   --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--   --   extra_args = { "--severity", "warning" },
--   -- },
--   {
--     command = "cpplint",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "c", "cpp" },
--   },
-- }

lvim.lsp.null_ls.setup.on_init = function(new_client, _)
  new_client.offset_encoding = "utf-16"
end


-- Plugins
-- Additional Plugins
lvim.plugins = {
  {
    "mbbill/undotree",
    config = function()
    end
  },
  {
    "MTDL9/vim-log-highlighting"
  },
  {
    -- only works on https://github.com/universal-ctags/ctags
    "liuchengxu/vista.vim",
    config = function()
      vim.cmd([[
        let g:vista_sidebar_position = 'vertical topleft'
        let g:vista_default_executive = 'nvim_lsp'
        ]])
    end
  },
  {
    'ibhagwan/fzf-lua',
    config = function()
      require 'fzf-lua'.setup {
        "fzf-native",
        grep = {
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
          rg_glob = true,
        },
        winopts = {
          preview = {
            -- default     = 'bat',           -- override the default previewer?
            -- default uses the 'builtin' previewer
            border       = 'border',    -- border|noborder, applies only to
            -- native fzf previewers (bat/cat/git/etc)
            wrap         = 'wrap',      -- wrap|nowrap
            hidden       = 'nohidden',  -- hidden|nohidden
            vertical     = 'down:45%',  -- up|down:size
            horizontal   = 'right:40%', -- right|left:size
            layout       = 'vertical',  -- horizontal|vertical|flex
            flip_columns = 120,         -- #cols to switch to horizontal on flex
            -- Only used with the builtin previewer:
            title        = true,        -- preview border title (file/buf)?
            title_align  = "left",      -- left|center|right, title alignment
            scrollbar    = 'float',     -- `false` or string:'float|border'
            -- float:  in-window floating border
            -- border: in-border chars (see below)
            scrolloff    = '-2',        -- float scrollbar offset from right
            -- applies only when scrollbar = 'float'
            scrollchars  = { '█', '' }, -- scrollbar chars ({ <full>, <empty> }
            -- applies only when scrollbar = 'border'
            delay        = 100,         -- delay(ms) displaying the preview
            -- prevents lag on fast scrolling
            winopts      = {
              -- builtin previewer window options
              number         = true,
              relativenumber = false,
              cursorline     = true,
              cursorlineopt  = 'both',
              cursorcolumn   = false,
              signcolumn     = 'no',
              list           = false,
              foldenable     = false,
              foldmethod     = 'manual',
            },
          },
          on_create = function()
            vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
            vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
          end,
        }
      }
    end
  },
  {
    "Shatur/neovim-session-manager"
  },
  {
    "ldelossa/litee.nvim",
    config = function()
      require("litee.lib").setup({})
    end
  },
  {
    -- calltree
    "ldelossa/litee-calltree.nvim",
    config = function()
      require("litee.calltree").setup({
        resolve_symbols = true,
        jump_mode = "invoking",
        hide_cursor = true,
        map_resize_keys = true,
        no_hls = false,
        on_open = "panel",
        disable_keymaps = false,
        keymaps = {
          expand = "zo",
          collapse = "zc",
          collapse_all = "zM",
          jump = "<CR>",
          jump_split = "s",
          jump_vsplit = "v",
          jump_tab = "t",
          hover = "i",
          details = "d",
          close = "X",
          close_panel_pop_out = "<Esc>",
          help = "?",
          hide = "H",
          switch = "S",
          focus = "f"
        },
      })
    end
  },
  {
    "ggandor/leap.nvim",
    commit = "27489b8698f23a83ebdec07688860fd19ff4d28b"
  },
  { -- resize window
    "simeji/winresizer",
    config = function()
      vim.cmd([[
        let g:winresizer_vert_resize=9
      ]])
    end
  },
  { -- vim clip on server
    "wincent/vim-clipper",
    config = function()
      vim.cmd([[
        let g:ClipperAddress="127.0.0.1"
        let g:ClipperPort=8377
        let g:ClipperAuto=1
        call clipper#set_invocation('netcat -c 127.0.0.1 8377')
      ]])
    end
  },
  { -- theme
    "morhetz/gruvbox"
  },
  {
    "RRethy/nvim-base16"
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  { -- auto save
    "pocco81/auto-save.nvim"
  },
  {
    "Civitasv/cmake-tools.nvim",
    config = function()
      require("cmake-tools").setup {
        cmake_command = "cmake",                                                     -- this is used to specify cmake command path
        cmake_regenerate_on_save = true,                                             -- auto generate when save CMakeLists.txt
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1", "-GNinja" }, -- this will be passed when invoke `CMakeGenerate`
        cmake_build_options = { "-j8" },                                             -- this will be passed when invoke `CMakeBuild`
        cmake_build_directory = "./build",                                           -- this is used to specify generate directory for cmake
        cmake_build_directory_prefix = "cmake_build_",                               -- when cmake_build_directory is set to "", this option will be activated
        cmake_soft_link_compile_commands = false,                                    -- this will automatically make a soft link from compile commands file to project root dir
        cmake_compile_commands_from_lsp = false,                                     -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
        cmake_kits_path = nil,                                                       -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
        cmake_variants_message = {
          short = { show = true },                                                   -- whether to show short message
          long = { show = true, max_length = 40 }                                    -- whether to show long message
        },
        cmake_dap_configuration = {                                                  -- debug settings for cmake
          name = "cpp",
          type = "codelldb",
          request = "launch",
          stopOnEntry = false,
          runInTerminal = true,
          console = "integratedTerminal",
        },
        cmake_always_use_terminal = false, -- if true, use terminal for generate, build, clean, install, run, etc, except for debug, else only use terminal for run, use quickfix for others
        cmake_quickfix_opts = {            -- quickfix settings for cmake, quickfix will be used when `cmake_always_use_terminal` is false
          show = "always",                 -- "always", "only_on_error"
          position = "belowright",         -- "bottom", "top"
          size = 10,
        },
        cmake_terminal_opts = {           -- terminal settings for cmake, terminal will be used for run when `cmake_always_use_terminal` is false or true, will be used for all tasks except for debug when `cmake_always_use_terminal` is true
          name = "Main Terminal",
          prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
          split_direction = "horizontal", -- "horizontal", "vertical"
          split_size = 11,

          -- Window handling
          single_terminal_per_instance = true,  -- Single viewport, multiple windows
          single_terminal_per_tab = true,       -- Single viewport per tab
          keep_terminal_static_location = true, -- Static location of the viewport if avialable

          -- Running Tasks
          start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
          start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
          focus_on_main_terminal = false,      -- Focus on cmake terminal when cmake task is launched. Only used if cmake_always_use_terminal is true.
          focus_on_launch_terminal = false,    -- Focus on cmake launch terminal when executable target in launched.
        }
      }
    end
  },
  {
    "p00f/clangd_extensions.nvim",
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      local provider = "clangd"
      local clangd_flags = {
        -- 在后台自动分析文件（基于complie_commands)
        "--compile-commands-dir=build",
        "--background-index",
        "--completion-style=detailed",
        -- 同时开启的任务数量
        "--all-scopes-completion=true",
        "--recovery-ast",
        "--suggest-missing-includes",
        -- 告诉clangd用那个clang进行编译，路径参考which clang++的路径
        "--query-driver=/usr/locla/bin/clang++,/usr/bin/g++",
        "--clang-tidy",
        -- 全局补全（会自动补充头文件）
        "--all-scopes-completion",
        "--cross-file-rename",
        -- 更详细的补全内容
        "--completion-style=detailed",
        "--function-arg-placeholders=false",
        -- 补充头文件的形式
        "--header-insertion=never",
        -- pch优化的位置
        "--pch-storage=memory",
        "--offset-encoding=utf-16",
        "-j=4",
      }

      local custom_on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
      end


      local custom_on_init = function(client, bufnr)
        require("lvim.lsp").common_on_init(client, bufnr)
        require("clangd_extensions.config").setup {}
        require("clangd_extensions.ast").init()
        vim.cmd [[
                command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
                command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
                command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
                command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
                command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
                ]]
      end

      local opts = {
        cmd = { provider, unpack(clangd_flags) },
        on_attach = custom_on_attach,
        on_init = custom_on_init,
      }

      require("lvim.lsp.manager").setup("clangd", opts)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "c81382328ad47c154261d1528d7c921acad5eae5",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true,
          },
          move = {
            enable = true,
            set_jumps = false, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]]"] = "@function.outer",
              -- ["]["] = "@function.outer",
            },
            goto_next_end = {
              ["]["] = "@function.outer",
              -- ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[["] = "@function.outer",
              -- ["[]"] = "@function.outer",
            },
            goto_previous_end = {
              ["[]"] = "@function.outer",
              -- ["[]"] = "@class.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
              ["<leader>pf"] = "@function.outer",
              ["<leader>pF"] = "@class.outer",
            },
          },
        },
      }
    end
  },

  -- {
  --   "hrsh7th/cmp-nvim-lsp-signature-help",
  -- },
  {
    "sakhnik/nvim-gdb",
    build = "./install.sh",
    config = function()
      -- set gdb window vertically
      vim.cmd([[
         let w:nvimgdb_termwin_command = "rightbelow vnew"
         let w:nvimgdb_codewin_command = "vnew"
        ]])
    end
  }
  -- {
  --   "vim-scripts/LargeFile",
  --   config = function ()
  --     vim.cmd([[
  --     let g:LargeFile=3
  --     ]])
  --   end
  -- }
}


vim.cmd([[
  let g:undotree_WindowLayout = 2
]])


--- dap config
-- load non-standard json file
-- require('dap.ext.vscode').json_decode = require 'json5'.parse
-- require('dap.ext.vscode').load_launchjs()
-- require("dap.dap-lldb")
-- require("dap.dap-cppdbg")

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--


-- 大文件读取优化
vim.cmd([[
augroup LargeFile
        let g:large_file = 3145728 " 3MB

        " Set options:
        "   eventignore+=FileType (no syntax highlighting etc
        "   assumes FileType always on)
        "   noswapfile (save copy of file)
        "   bufhidden=unload (save memory when other file is viewed)
        "   buftype=nowritefile (is read-only)
        "   undolevels=-1 (no undo possible)
        au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                        \ set eventignore+=FileType |
                        \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 filetype=off lazyredraw eventignore=all nohidden syntax=off
                \ else |
                        \ set eventignore-=FileType |
                \ endif
augroup END
]])


-- edit file:linenumber directly
function edit_file_with_linenumber(args)
  local file, line = string.match(args, "(.-):(%d+)$")
  if file and vim.fn.filereadable(file) == 1 then
    vim.cmd("e " .. file .. "|" .. line)
  else
    vim.cmd("e " .. args)
  end
end

vim.cmd([[
:command! -nargs=1 E lua edit_file_with_linenumber(<f-args>)
]])
