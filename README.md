# Claude Code with DeepSeek API - 1M Context Window

Run Claude Code at full capability - file I/O, terminal commands, MCP tools, subagents - powered by **DeepSeek V4 Pro** via the Anthropic-compatible endpoint. No Anthropic API key required.

**Platforms:** Windows · macOS · Linux

## Why Use This? -- Cost Comparison

Claude Code subscriptions give you a **fixed token budget with double limits** (5-hour rolling window + weekly cap). DeepSeek API gives you **pure pay-as-you-go** -- no windows, no caps. Same Claude Code features, same terminal, same MCP tools.

### Claude Code Plans vs. This Setup

```
                        CLAUDE CODE PLANS                    THIS SETUP (DeepSeek API)
                  ───────────────────────────────     ──────────────────────────────────
                        Pro       Max 5x    Max 20x        V4-Pro             V4-Flash
                  ───────────────────────────────     ──────────────────────────────────
Monthly cost        $20         $100       $200           $20                $20
                                                          (pay-as-you-go)    (pay-as-you-go)

Est. monthly      ~1.3M        ~5M        ~9M            ~20M tokens        ~63M tokens
token budget      tokens      tokens     tokens          (15M in +          (47M in +
(Opus 4.6,        Opus        Opus       Opus            5M out)            16M out)
community         4.6         4.6        4.6
estimates)

Context window     1M          1M         1M              1M                 1M

5h window cap?     ✓           ✓          ✓               --                  --
Weekly cap?        ✓           ✓          ✓               --                  --
Peak throttling?   throttled   throttled  throttled       --                  --

Token/$ value      1x          ~0.5x      ~0.45x          ~15x               ~50x
(vs Claude Pro)

Lockout risk        Weds-Thu   Thu-Fri    Fri-Sat         None               None
(heavy week)
```

> Token estimates are based on community measurements (Feb 2026, ~3.6K API snapshots). Anthropic does **not** publish exact token limits -- they express caps in opaque "hours." The ratios above are conservative.

### How Claude Code's Double Limit Works

Anthropic applies **two simultaneous caps** -- hitting either one blocks usage:

| Limit                     | Reset                                                |
| ------------------------- | ---------------------------------------------------- |
| **5-hour rolling window** | Resets 5 hours after your first prompt in the window |
| **Weekly quota**          | Resets every 7 days                                  |

**The relationship (measured across 3,664 API snapshots, ~95% Opus usage):**

|                           | Max 5x ($100)   | Max 20x ($200)   |
| ------------------------- | --------------- | ---------------- |
| 1 full 5h window consumes | ~8-9% of weekly | ~15% of weekly   |
| Full windows per week     | ~12             | ~7               |

Max 20x gives you **4x the 5-hour burst** of Max 5x, but only **~2.1x the weekly budget**. You go faster, not longer -- which is why each window burns a bigger chunk of the week (15% vs 8-9%). The name "20x" refers to burst capacity relative to the Pro plan, not weekly sustained throughput.

### What $20 Gets You

|                            | $20/Month Token Budget               |
| -------------------------- | ------------------------------------ |
| **Claude Code Pro**        | ~1.3M tokens (Opus 4.6, then locked) |
| **This Setup -- V4-Pro**   | ~20M tokens (15x more)               |
| **This Setup -- V4-Flash** | ~63M tokens (50x more)               |

No lockouts, no weekly reset to wait for, 1M context window. Same Claude Code interface.

## Model Performance -- DeepSeek V4-Pro Max vs Frontier Models

Benchmark data from [DeepSeek V4 Pro (HuggingFace)](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro). **Bold** = best in row. `--` = not reported. DS-V4-Pro is the model used in this setup (Max is the API tier with thinking enabled).

| Benchmark                   | Opus-4.6 Max | GPT-5.4 xHigh | Gemini-3.1-Pro High | K2.6 Thinking | GLM-5.1 Thinking | DS-V4-Pro Max |
| --------------------------- | ------------ | ------------- | ------------------- | ------------- | ---------------- | ------------- |
| **Knowledge & Reasoning**   |              |               |                     |               |                  |               |
| MMLU-Pro (EM)               | 89.1         | 87.5          | **91.0**            | 87.1          | 86.0             | 87.5          |
| SimpleQA-Verified (Pass@1)  | 46.2         | 45.3          | **75.6**            | 36.9          | 38.1             | 57.9          |
| Chinese-SimpleQA (Pass@1)   | 76.4         | 76.8          | **85.9**            | 75.9          | 75.0             | 84.4          |
| GPQA Diamond (Pass@1)       | 91.3         | 93.0          | **94.3**            | 90.5          | 86.2             | 90.1          |
| HLE (Pass@1)                | 40.0         | 39.8          | **44.4**            | 36.4          | 34.7             | 37.7          |
| LiveCodeBench (Pass@1)      | 88.8         | --            | 91.7                | 89.6          | --               | **93.5**      |
| Codeforces (Rating)         | --           | 3168          | 3052                | --            | --               | **3206**      |
| HMMT 2026 Feb (Pass@1)      | 96.2         | **97.7**      | 94.7                | 92.7          | 89.4             | 95.2          |
| IMOAnswerBench (Pass@1)     | 75.3         | **91.4**      | 81.0                | 86.0          | 83.8             | 89.8          |
| Apex (Pass@1)               | 34.5         | 54.1          | **60.9**            | 24.0          | 11.5             | 38.3          |
| Apex Shortlist (Pass@1)     | 85.9         | 78.1          | 89.1                | 75.5          | 72.4             | **90.2**      |
| **Long Context**            |              |               |                     |               |                  |               |
| MRCR 1M (MMR)               | **92.9**     | --            | 76.3                | --            | --               | 83.5          |
| CorpusQA 1M (ACC)           | **71.7**     | --            | 53.8                | --            | --               | 62.0          |
| **Agentic**                 |              |               |                     |               |                  |               |
| Terminal Bench 2.0 (Acc)    | 65.4         | **75.1**      | 68.5                | 66.7          | 63.5             | 67.9          |
| SWE Verified (Resolved)     | **80.8**     | --            | 80.6                | 80.2          | --               | 80.6          |
| SWE Pro (Resolved)          | 57.3         | 57.7          | 54.2                | **58.6**      | 58.4             | 55.4          |
| SWE Multilingual (Resolved) | **77.5**     | --            | --                  | 76.7          | 73.3             | 76.2          |
| BrowseComp (Pass@1)         | 83.7         | 82.7          | **85.9**            | 83.2          | 79.3             | 83.4          |
| HLE w/ tools (Pass@1)       | 53.1         | 52.0          | 51.6                | **54.0**      | 50.4             | 48.2          |
| GDPval-AA (Elo)             | 1619         | **1674**      | 1314                | 1482          | 1535             | 1554          |
| MCPAtlas Public (Pass@1)    | **73.8**     | 67.2          | 69.2                | 66.6          | 71.8             | 73.6          |
| Toolathlon (Pass@1)         | 47.2         | **54.6**      | 48.8                | 50.0          | 40.7             | 51.8          |

Key takeaways: DS-V4-Pro leads on coding benchmarks (LiveCodeBench 93.5, Codeforces 3206, Apex Shortlist 90.2). Competitive on SWE and agentic tasks. Gemini-3.1-Pro High dominates knowledge/reasoning. Claude Opus-4.6 Max leads long-context retrieval and SWE Verified.

## Prerequisites

- **Node.js** ≥ 18 - [nodejs.org](https://nodejs.org)
- **Claude Code** `v2.1.159` installed globally:
  ```bash
  npm install -g @anthropic-ai/claude-code@2.1.159
  ```
- **DeepSeek API key** - [platform.deepseek.com/api_keys](https://platform.deepseek.com/api_keys)

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

Two options per platform - pick whichever fits your workflow.

### Windows

#### Method A - Batch File (`.bat`)

Place `deepseek.bat` in a directory on your `PATH` (e.g. `C:\Users\%USERNAME%\bin\`) and invoke it from any terminal:

```batch
deepseek
```

#### Method B - PowerShell Global Command (Recommended)

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

#### Method A - Shell Script

Make `deepseek.sh` executable and place it on your `PATH`:

```bash
chmod +x deepseek.sh
sudo mv deepseek.sh /usr/local/bin/deepseek
```

Then run from any directory:

```bash
deepseek
```

#### Method B - Shell Function (Recommended)

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

> The shell function sets environment variables in the current session and launches Claude Code. It's lighter than a script - no extra process, no `PATH` setup needed.

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

| Variable                                   | Value                                | Purpose                                           |
| ------------------------------------------ | ------------------------------------ | ------------------------------------------------- |
| `ANTHROPIC_BASE_URL`                       | `https://api.deepseek.com/anthropic` | DeepSeek's Anthropic-compatible endpoint          |
| `ANTHROPIC_AUTH_TOKEN`                     | `$DEEPSEEK_API_KEY`                  | Your API key (read from global env var)           |
| `ANTHROPIC_MODEL`                          | `deepseek-v4-pro[1m]`                | Primary model - `[1m]` enables 1M context         |
| `ANTHROPIC_DEFAULT_OPUS_MODEL`             | `deepseek-v4-pro[1m]`                | Model used for Opus-tier requests                 |
| `ANTHROPIC_DEFAULT_SONNET_MODEL`           | `deepseek-v4-pro`                    | Model used for Sonnet-tier requests               |
| `ANTHROPIC_DEFAULT_HAIKU_MODEL`            | `deepseek-v4-flash`                  | Model used for Haiku-tier requests                |
| `CLAUDE_CODE_SUBAGENT_MODEL`               | `deepseek-v4-flash`                  | Faster/cheaper model for subagents                |
| `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` | `1`                                  | Disable telemetry and non-essential network calls |
| `DISABLE_GROWTHBOOK`                       | `1`                                  | Disable GrowthBook feature flags                  |

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

| Issue                                | Platform      | Solution                                                                           |
| ------------------------------------ | ------------- | ---------------------------------------------------------------------------------- |
| **Context shows 200K instead of 1M** | All           | Verify the `[1m]` suffix is present in `ANTHROPIC_MODEL`                           |
| **API authentication error**         | All           | Confirm `DEEPSEEK_API_KEY` is set                                                  |
|                                      | Windows       | `echo $env:DEEPSEEK_API_KEY` (PowerShell) or `echo %DEEPSEEK_API_KEY%` (CMD)       |
|                                      | macOS/Linux   | `echo $DEEPSEEK_API_KEY`                                                           |
| **`claude` command not found**       | All           | Reinstall: `npm install -g @anthropic-ai/claude-code@2.1.154`                      |
| **`deepseek` not recognized**        | Windows (PS)  | `notepad $PROFILE.CurrentUserCurrentHost` - verify the function is in your profile |
|                                      | Windows (CMD) | Ensure `deepseek.bat` is in a directory on your `PATH`                             |
|                                      | macOS/Linux   | Run `type deepseek` to check if the function or script is loaded                   |
| **Permission denied (script)**       | macOS/Linux   | `chmod +x deepseek.sh`                                                             |
| **Thinking mode not working**        | All           | DeepSeek V4 Pro natively supports thinking - no extra configuration needed         |

---

## Files

| File                               | Platform      | Purpose                                          |
| ---------------------------------- | ------------- | ------------------------------------------------ |
| `deepseek.bat`                     | Windows       | Batch launcher for CMD                           |
| `Microsoft.PowerShell_profile.ps1` | Windows       | PowerShell function - paste into your profile    |
| `deepseek.sh`                      | macOS / Linux | Shell script - make executable, place on `PATH`  |
| `shell-profile.sh`                 | macOS / Linux | Shell function - paste into `.bashrc` / `.zshrc` |
| `README.md`                        | All           | This document                                    |

---

## License

MIT - use freely, modify, distribute.
