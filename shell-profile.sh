# ==============================================================
#  Shell Profile  —  Global "deepseek" Command
#  Paste into ~/.bashrc, ~/.zshrc, or ~/.bash_profile
#
#  After adding, reload with:
#    source ~/.bashrc   # or source ~/.zshrc
#
#  Then run from any directory:
#    deepseek
#
#  Prerequisite: export DEEPSEEK_API_KEY="sk-your-key"
#    (add this to your shell profile as well for persistence)
# ==============================================================

deepseek() {
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
}
