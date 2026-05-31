# Claude Code with DeepSeek API — 1M Context Window

Run Claude Code at full capability — file I/O, terminal commands, MCP tools, subagents — powered by **DeepSeek V4 Pro** via the Anthropic-compatible endpoint. No Anthropic API key required.

**Platforms:** Windows · macOS · Linux

## Why Use This?

| | Anthropic Claude | This Setup (DeepSeek) |
|---|---|---|
| **Cost** | $20/mo (Pro) or API pay-as-you-go | DeepSeek API usage only (~$0.44/1M input tokens, promotional pricing) |
| **Context window** | 200K | **1M** (via `[1m]` suffix) |
| **Model** | Claude Opus / Sonnet / Haiku | DeepSeek V4 Pro / V4 Flash |
| **Claude Code features** | All | All (thinking, tool use, subagents, MCP) |

## Prerequisites

- **Node.js** ≥ 18 — [nodejs.org](https://nodejs.org)
- **Claude Code** `v2.1.154` installed globally:
  ```bash
  npm install -g @anthropic-ai/claude-code@2.1.154
  ```
- **DeepSeek API key** — [platform.deepseek.com/api_keys](https://platform.deepseek.com/api_keys)

---

## Step 1: Set Your DeepSeek API Key Globally

### Windows

**GUI (persistent):**

1. Open Start, type `environment` → **Edit the system environment variables**
2. Click **Environment Variables…** → under **User variables**, click **New…**
3. Variable name: `DEEPSEEK_API_KEY`
4. Variable value: `sk-your-deepseek-api-key`
5. Click **OK** and restart your terminal

**PowerShell (one-liner):**

```powershell
[Environment]::SetEnvironmentVariable("DEEPSEEK_API_KEY", "sk-your-key-here", "User")
```

### macOS / Linux

Add the following to your shell profile (`~/.bashrc`, `~/.zshrc`, or `~/.bash_profile`):

```bash
export DEEPSEEK_API_KEY="sk-your-deepseek-api-key"
```

Then reload:

```bash
source ~/.zshrc    # or ~/.bashrc / ~/.bash_profile
```

---

## Step 2: Choose Your Launch Method

Two options per platform — pick whichever fits your workflow.

### Windows

#### Method A — Batch File (`.bat`)

Place `deepseek.bat` in a directory on your `PATH` (e.g. `C:\Users\%USERNAME%\bin\`) and invoke it from any terminal:

```batch
deepseek
```

#### Method B — PowerShell Global Command (Recommended)

Add the `deepseek` function to your PowerShell profile:

```powershell
# Open your profile (creates it if missing)
notepad $PROFILE.CurrentUserCurrentHost
```

Paste the contents of `Microsoft.PowerShell_profile.ps1` into the file, save, and open a fresh PowerShell window:

```powershell
deepseek
```

> PowerShell sources this profile automatically on startup. The `deepseek` function sets the required environment variables and launches Claude Code.

### macOS / Linux

#### Method A — Shell Script

Make `deepseek.sh` executable and place it on your `PATH`:

```bash
chmod +x deepseek.sh
sudo mv deepseek.sh /usr/local/bin/deepseek
```

Then run from any directory:

```bash
deepseek
```

#### Method B — Shell Function (Recommended)

Paste the contents of `shell-profile.sh` into your shell profile (`~/.bashrc`, `~/.zshrc`, or `~/.bash_profile`):

```bash
# Add to ~/.zshrc (or ~/.bashrc)
cat shell-profile.sh >> ~/.zshrc
source ~/.zshrc
```

Then run from any directory:

```bash
deepseek
```

> The shell function sets environment variables in the current session and launches Claude Code. It's lighter than a script — no extra process, no `PATH` setup needed.

---

## The `[1m]` Suffix — Unlocking the Full 1M Context Window

**Critical.** Claude Code defaults to **200K** context window for any third-party model it doesn't recognize. Appending `[1m]` to the model name signals that the model supports a 1-million-token context window:

```
deepseek-v4-pro        → 200K (default)
deepseek-v4-pro[1m]    → 1M   ✅
```

The `[1m]` suffix is **stripped before the API request is sent** — DeepSeek's servers never see it; they receive `deepseek-v4-pro`. It is a client-side hint processed exclusively by Claude Code's `getContextWindowForModel()`.

---

## Environment Variables Reference

| Variable | Value | Purpose |
|---|---|---|
| `ANTHROPIC_BASE_URL` | `https://api.deepseek.com/anthropic` | DeepSeek's Anthropic-compatible endpoint |
| `ANTHROPIC_AUTH_TOKEN` | `$DEEPSEEK_API_KEY` | Your API key (read from global env var) |
| `ANTHROPIC_MODEL` | `deepseek-v4-pro[1m]` | Primary model — `[1m]` enables 1M context |
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
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶   15.2k/1m tokens (1.5%)
```

If the top bar shows **1m** (1 million), you're good to go.

---

## Troubleshooting

| Issue | Platform | Solution |
|---|---|---|
| **Context shows 200K instead of 1M** | All | Verify the `[1m]` suffix is present in `ANTHROPIC_MODEL` |
| **API authentication error** | All | Confirm `DEEPSEEK_API_KEY` is set |
| | Windows | `echo $env:DEEPSEEK_API_KEY` (PowerShell) or `echo %DEEPSEEK_API_KEY%` (CMD) |
| | macOS/Linux | `echo $DEEPSEEK_API_KEY` |
| **`claude` command not found** | All | Reinstall: `npm install -g @anthropic-ai/claude-code@2.1.154` |
| **`deepseek` not recognized** | Windows (PS) | `notepad $PROFILE.CurrentUserCurrentHost` — verify the function is in your profile |
| | Windows (CMD) | Ensure `deepseek.bat` is in a directory on your `PATH` |
| | macOS/Linux | Run `type deepseek` to check if the function or script is loaded |
| **Permission denied (script)** | macOS/Linux | `chmod +x deepseek.sh` |
| **Thinking mode not working** | All | DeepSeek V4 Pro natively supports thinking — no extra configuration needed |

---

## Files

| File | Platform | Purpose |
|---|---|---|
| `deepseek.bat` | Windows | Batch launcher for CMD |
| `Microsoft.PowerShell_profile.ps1` | Windows | PowerShell function — paste into your profile |
| `deepseek.sh` | macOS / Linux | Shell script — make executable, place on `PATH` |
| `shell-profile.sh` | macOS / Linux | Shell function — paste into `.bashrc` / `.zshrc` |
| `README.md` | All | This document |

---

## License

MIT — use freely, modify, distribute.
