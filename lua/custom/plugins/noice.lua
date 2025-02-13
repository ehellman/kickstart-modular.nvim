return {
  ---@module 'noice'
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  },
  cmdline = {
    -- enabled = true, -- enables the Noice cmdline UI
    view = 'cmdline_popup', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {
      enter = true, -- automatically enter the cmdline when it opens
      format = 'details', -- format for the cmdline. See section on formatting
      -- border = 'rounded', -- border style for the cmdline
      -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }, -- border characters for the cmdline
      -- win_options = { winblend = 10, winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder' },
    }, -- global options for the cmdline. See section on views
    ---@type table<string, CmdlineFormat>
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      -- cmdline = { pattern = '^:', icon = ' : ', lang = 'vim' },
      -- search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
      -- search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
      -- filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
      -- lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
      -- help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
      -- input = { view = 'cmdline_input', icon = '󰥻 ' }, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
  },
  -- You can add any custom commands below that will be available with `:Noice command`
  -- ---@type table<string, NoiceCommand>
  -- commands = {
  --   history = {
  --     -- options for the message history that you get with `:Noice`
  --     view = 'split',
  --     opts = { enter = true, format = 'details' },
  --     filter = {
  --       any = {
  --         { event = 'notify' },
  --         { error = true },
  --         { warning = true },
  --         { event = 'msg_show', kind = { '' } },
  --         { event = 'lsp', kind = 'message' },
  --       },
  --     },
  --   },
  --   -- :Noice last
  --   last = {
  --     view = 'popup',
  --     opts = { enter = true, format = 'details' },
  --     filter = {
  --       any = {
  --         { event = 'notify' },
  --         { error = true },
  --         { warning = true },
  --         { event = 'msg_show', kind = { '' } },
  --         { event = 'lsp', kind = 'message' },
  --       },
  --     },
  --     filter_opts = { count = 1 },
  --   },
  --   -- :Noice errors
  --   errors = {
  --     -- options for the message history that you get with `:Noice`
  --     view = 'popup',
  --     opts = { enter = true, format = 'details' },
  --     filter = { error = true },
  --     filter_opts = { reverse = true },
  --   },
  --   all = {
  --     -- options for the message history that you get with `:Noice`
  --     view = 'split',
  --     opts = { enter = true, format = 'details' },
  --     filter = {},
  --   },
  -- },
  -- lsp = {
  --   progress = {
  --     enabled = true,
  --     -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
  --     -- See the section on formatting for more details on how to customize.
  --     --- @type NoiceFormat|string
  --     format = 'lsp_progress',
  --     --- @type NoiceFormat|string
  --     format_done = 'lsp_progress_done',
  --     throttle = 1000 / 30, -- frequency to update lsp progress message
  --     view = 'mini',
  --   },
  --   override = {
  --     -- override the default lsp markdown formatter with Noice
  --     ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
  --     -- override the lsp markdown formatter with Noice
  --     ['vim.lsp.util.stylize_markdown'] = false,
  --     -- override cmp documentation with Noice (needs the other options to work)
  --     ['cmp.entry.get_documentation'] = false,
  --   },
  --   hover = {
  --     enabled = true,
  --     silent = false, -- set to true to not show a message if hover is not available
  --     view = nil, -- when nil, use defaults from documentation
  --     ---@type NoiceViewOptions
  --     opts = {}, -- merged with defaults from documentation
  --   },
  --   signature = {
  --     enabled = true,
  --     auto_open = {
  --       enabled = true,
  --       trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
  --       luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
  --       throttle = 50, -- Debounce lsp signature help request by 50ms
  --     },
  --     view = nil, -- when nil, use defaults from documentation
  --     ---@type NoiceViewOptions
  --     opts = {}, -- merged with defaults from documentation
  --   },
  --   message = {
  --     -- Messages shown by lsp servers
  --     enabled = true,
  --     view = 'notify',
  --     opts = {},
  --   },
  --   -- defaults for hover and signature help
  --   documentation = {
  --     view = 'hover',
  --     ---@type NoiceViewOptions
  --     opts = {
  --       lang = 'markdown',
  --       replace = true,
  --       render = 'plain',
  --       format = { '{message}' },
  --       win_options = { concealcursor = 'n', conceallevel = 3 },
  --     },
  --   },
  -- },
  -- markdown = {
  --   hover = {
  --     ['|(%S-)|'] = vim.cmd.help, -- vim help links
  --     ['%[.-%]%((%S-)%)'] = require('noice.util').open, -- markdown links
  --   },
  --   highlights = {
  --     ['|%S-|'] = '@text.reference',
  --     ['@%S+'] = '@parameter',
  --     ['^%s*(Parameters:)'] = '@text.title',
  --     ['^%s*(Return:)'] = '@text.title',
  --     ['^%s*(See also:)'] = '@text.title',
  --     ['{%S-}'] = '@parameter',
  --   },
  -- },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  ------@type NoiceConfigViews
  ---views = {}, ---@see section on views
  ---@type NoiceRouteConfig[]
  routes = {
    {
      view = 'notify',
      filter = { event = 'msg_showmode' },
    },
  }, --- @see section on routes
  ------@type table<string, NoiceFilter>
  ---status = {}, --- @see section on statusline components
  ------@type NoiceFormatOptions
  ---format = {}, --- @see section on formatting
  -- stylua: ignore
  keys = {
    { "<leader>sn", "", desc = "+noice"},
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  },
  config = function(_, opts)
    opts.routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    }
    -- HACK: noice shows messages from before it was enabled,
    -- but this is not ideal when Lazy is installing plugins,
    -- so clear the messages in this case.
    if vim.o.filetype == 'lazy' then
      vim.cmd([[messages clear]])
    end
    require('noice').setup(opts)
  end,
}
