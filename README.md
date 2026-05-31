# Claude Code with DeepSeek API - 1M Context Window

Run Claude Code at full capability - file I/O, terminal commands, MCP tools, subagents - powered by **DeepSeek V4 Pro** via the Anthropic-compatible endpoint. No Anthropic API key required.

## Why Use This?

| | Anthropic Claude | This Setup (DeepSeek) |
|---|---|---|
| **Cost** | $20/mo (Pro) or API pay-as-you-go | DeepSeek API usage only (~$0.44/1M input tokens, promotional pricing) |
| **Context window** | 200K | **1M** (via `[1m]` suffix) |
| **Model** | Claude Opus / Sonnet / Haiku | DeepSeek V4 Pro / V4 Flash |
| **Claude Code features** | All | All (thinking, tool use, subagents, MCP) |

## Prerequisites

- **Node.js** ≥ 18 - [nodejs.org](https://nodejs.org)
- **Claude Code** installed globally:
  ```powershell
  npm install -g @anthropic-ai/claude-code
  ```
- **DeepSeek API key** - [platform.deepseek.com/api_keys](https://platform.deepseek.com/api_keys)

---

## Step 1: Set Your DeepSeek API Key Globally

### Windows - System Environment Variable (persistent)

1. Open the Start menu, type `environment` → **Edit the system environment variables**
2. Click **Environment Variables…** → under **User variables**, click **New…**
3. Variable name: `DEEPSEEK_API_KEY`
4. Variable value: `sk-your-deepseek-api-key`
5. Click **OK** and restart your terminal

### Or via PowerShell (one-liner):

```powershell
[Environment]::SetEnvironmentVariable("DEEPSEEK_API_KEY", "sk-your-key-here", "User")
```

---

## Step 2: Choose Your Launch Method

Two options - pick whichever fits your workflow. Both work identically.

### Method A - Batch File (`.bat`)

Place `deepseek.bat` in a directory on your `PATH` (e.g. `C:\Users\%USERNAME%\bin\`) and invoke it from any terminal:

```batch
deepseek
```

You can also double-click the file or call it by its full path.

### Method B - PowerShell Global Command (Recommended)

Add the `deepseek` function to your PowerShell profile to make it available from any directory:

```powershell
# Open your profile (creates it if missing)
notepad $PROFILE.CurrentUserCurrentHost
```

Paste the contents of `Microsoft.PowerShell_profile.ps1` into the file, save, and open a fresh PowerShell window:

```powershell
deepseek
```

> **How it works:** PowerShell sources this profile automatically on startup. The `deepseek` function sets the required environment variables and launches Claude Code.

---

## The `[1m]` Suffix - Unlocking the Full 1M Context Window

**Critical.** Claude Code defaults to **200K** context window for any third-party model it doesn't recognize. Appending `[1m]` to the model name signals that the model supports a 1-million-token context window:

```
deepseek-v4-pro        → 200K (default)
deepseek-v4-pro[1m]    → 1M   ✅
```

The `[1m]` suffix is **stripped before the API request is sent** - DeepSeek's servers never see it; they receive `deepseek-v4-pro`. It is a client-side hint processed exclusively by Claude Code's `getContextWindowForModel()`.

---

## Environment Variables Reference

| Variable | Value | Purpose |
|---|---|---|
| `ANTHROPIC_BASE_URL` | `https://api.deepseek.com/anthropic` | DeepSeek's Anthropic-compatible endpoint |
| `ANTHROPIC_AUTH_TOKEN` | `%DEEPSEEK_API_KEY%` | Your API key (read from global env var) |
| `ANTHROPIC_MODEL` | `deepseek-v4-pro[1m]` | Primary model - `[1m]` enables 1M context |
| `ANTHROPIC_DEFAULT_OPUS_MODEL` | `deepseek-v4-pro[1m]` | Model used for Opus-tier requests |
| `ANTHROPIC_DEFAULT_SONNET_MODEL` | `deepseek-v4-pro` | Model used for Sonnet-tier requests |
| `ANTHROPIC_DEFAULT_HAIKU_MODEL` | `deepseek-v4-flash` | Model used for Haiku-tier requests |
| `CLAUDE_CODE_SUBAGENT_MODEL` | `deepseek-v4-flash` | Faster/cheaper model for subagents |
| `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` | `1` | Disable telemetry and non-essential network calls |
| `DISABLE_GROWTHBOOK` | `1` | Disable GrowthBook feature flags |

---

## Verification

Once Claude Code starts, run `/context`. You should see:

```
Context Usage
⛁ ⛁ ⛁ ⛁ ⛁ ⛁ ⛁ ⛁ ⛁ ⛁   deepseek-v4-pro
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶   15.2k/1000k tokens (1.5%)
```

If the top bar shows **1000k** (1 million), you're good to go.

---

## Troubleshooting

| Issue | Solution |
|---|---|
| **Context shows 200K instead of 1M** | Verify the `[1m]` suffix is present in `ANTHROPIC_MODEL` |
| **API authentication error** | Confirm `DEEPSEEK_API_KEY` is set: `echo $env:DEEPSEEK_API_KEY` |
| **`claude` command not found** | Reinstall: `npm install -g @anthropic-ai/claude-code` |
| **`deepseek` not recognized in PowerShell** | Check your profile file exists and contains the function: `notepad $PROFILE.CurrentUserCurrentHost` |
| **Thinking mode not working** | DeepSeek V4 Pro natively supports thinking - no extra configuration needed |

---

## Files

| File | Purpose |
|---|---|
| `deepseek.bat` | Batch launcher for CMD |
| `Microsoft.PowerShell_profile.ps1` | PowerShell function - paste into your profile |
| `README.md` | This document |

---

## License

MIT - use freely, modify, distribute.
