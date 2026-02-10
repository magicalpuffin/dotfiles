local options = {
  adapters = {
    acp = {
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            api_key = os.getenv "CLAUDE_CODE_OAUTH_TOKEN",
          },
        })
      end,
    },
  },
  interactions = {
    chat = {
      adapter = "claude_code",
    },
  },
  rules = {
    default = {
      description = "Collection of common files for all projects",
      files = {
        ".clinerules",
        ".cursorrules",
        ".goosehints",
        ".rules",
        ".windsurfrules",
        ".github/copilot-instructions.md",
        "AGENT.md",
        "AGENTS.md",
        { path = "CLAUDE.md", parser = "claude" },
        { path = "CLAUDE.local.md", parser = "claude" },
        { path = "~/.claude/CLAUDE.md", parser = "claude" },
      },
      is_preset = true,
    },
    opts = {
      chat = {
        autoload = "default", -- The rule groups to load
        enabled = true,
      },
    },
  },
  -- NOTE: The log_level is in `opts.opts`
  opts = {
    log_level = "DEBUG",
  },
}

require("codecompanion").setup(options)
