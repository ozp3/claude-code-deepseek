#!/usr/bin/env bash
# ==============================================================
#  Claude Code + DeepSeek API  —  1M Context Window
#  Linux / macOS Shell Launcher
#
#  Usage:
#    ./deepseek.sh
#    or place in PATH and run: deepseek
#
#  Prerequisite: export DEEPSEEK_API_KEY="sk-your-key"
# ==============================================================

export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
export ANTHROPIC_AUTH_TOKEN="$DEEPSEEK_API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash"
export CLAUDE_CODE_SUBAGENT_MODEL="deepseek-v4-flash"
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="1"
export DISABLE_GROWTHBOOK="1"

claude "$@"
