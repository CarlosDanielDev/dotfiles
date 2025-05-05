local M = {}

function M.create_rule(config)
  assert(config.keys, "config.keys is required")
  local keys = config.keys
  local threshold = config.threshold or 10
  local message = config.message or "Hold it Cowboy!!"
  local level = config.level or vim.log.levels.WARN
  local icon = config.icon or "🤠"
  local timeout = config.timeout or 2000
  local mode = config.mode or "n"

  local notification_id = nil
  local ok = true

  for _, key in ipairs(keys) do
    local count = 0
    local timer = assert(vim.uv.new_timer())
    local map = key

    vim.keymap.set(mode, key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= threshold then
        ok, notification_id = pcall(vim.notify, message, level, {
          icon = icon,
          replace = notification_id,
          keep = function()
            return count >= threshold
          end,
        })
        if not ok then
          notification_id = nil
          return map
        end
      else
        count = count + 1
        timer:start(timeout, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

function M.cowboy()
  M.create_rule({
    keys = { "h", "j", "k", "l", "+", "-" },
    message = "Hold it Cowboy!!",
    icon = "🤠",
    threshold = 10,
    timeout = 2000,
    level = vim.log.levels.WARN,
  })
  M.create_rule({
    mode = "i",
    keys = { "<Up>", "<Down>", "<Left>", "<Right>" },
    message = "Use `Ctrl+[hjkl]` in insert mode!",
    icon = "🎯",
    threshold = 3,
  })
  M.create_rule({
    keys = { "<Up>", "<Down>", "<Left>", "<Right>" },
    message = "HJKL disciple! Use proper vim motions!",
    icon = "🔄",
    threshold = 3,
    timeout = 1000,
  })
  M.create_rule({
    mode = "v",
    keys = { "h", "j", "k", "l" },
    message = "Use text objects instead!",
    icon = "👀",
    threshold = 8,
  })
  M.create_rule({
    mode = "c",
    keys = { "<Up>", "<Down>" },
    message = "Try command history completion (q:) instead!",
    icon = "⌨️",
    threshold = 3,
  })
  M.create_rule({
    keys = { ":Git ", ":Gpush", ":Gpull" },
    message = "Maybe try a proper Git client?",
    icon = "🌪️",
    threshold = 4,
    timeout = 5000,
    mode = "c",
  })
  M.create_rule({
    keys = { "v", "V", "<C-v>" },
    message = "Most operations don't need visual mode!",
    icon = "👀",
    threshold = 8,
    timeout = 3000,
  })
  M.create_rule({
    keys = { ":q<CR>", ":q!<CR>" },
    message = "ZZ/ZQ are quicker!",
    icon = "🚫",
    threshold = 3,
  })
  M.create_rule({
    keys = { "x", "X" },
    message = "Real vimmers use `d` motions!",
    icon = "🗑️",
    threshold = 5,
  })
  M.create_rule({
    keys = { "n", "N" },
    message = "Maybe try improving your search pattern?",
    icon = "🔎",
    threshold = 10,
    timeout = 1500,
  })
  M.create_rule({
    keys = { "<Esc>" },
    message = "Try `jk` or `Ctrl-[` instead!",
    icon = "🚪",
    threshold = 5,
    timeout = 2000,
  })
  M.create_rule({
    keys = { "<LeftMouse>", "<RightMouse>", "<ScrollWheelUp>", "<ScrollWheelDown>" },
    message = "You're better than this! Use keyboard!",
    icon = "🐭",
    threshold = 2,
  })
  M.create_rule({
    keys = { "<leader>w", ":w<CR>" },
    message = "Autosave is already handling this! Chill!",
    icon = "💾",
    threshold = 5,
    timeout = 5000,
  })
  M.create_rule({
    keys = { "i", "I", "a", "A", "o", "O" },
    message = "Insert mode is a privilege, not a right!",
    icon = "⏳",
    threshold = 8,
    timeout = 3000,
  })
end

return M
