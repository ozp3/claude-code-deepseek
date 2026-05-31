@echo off
REM ==============================================================
REM  Claude Code + DeepSeek API  —  1M Context Window
REM  Model: DeepSeek V4 Pro (deepseek-v4-pro)
REM  Endpoint: Anthropic-compatible (/anthropic)
REM ==============================================================

set ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
set ANTHROPIC_AUTH_TOKEN=%DEEPSEEK_API_KEY%
set ANTHROPIC_MODEL=deepseek-v4-pro[1m]
set ANTHROPIC_DEFAULT_OPUS_MODEL=deepseek-v4-pro[1m]
set ANTHROPIC_DEFAULT_SONNET_MODEL=deepseek-v4-pro
set ANTHROPIC_DEFAULT_HAIKU_MODEL=deepseek-v4-flash
set CLAUDE_CODE_SUBAGENT_MODEL=deepseek-v4-flash
set CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
set DISABLE_GROWTHBOOK=1

claude %*
