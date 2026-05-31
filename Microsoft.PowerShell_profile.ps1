# ==============================================================
#  PowerShell Profile  —  Global "deepseek" Command
#  Paste this into your PowerShell profile to make "deepseek"
#  available from ANY directory.
#
#  Profile path:
#    C:\Users\<YourUser>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#
#  If the file doesn't exist, create it:
#    New-Item -Path $PROFILE.CurrentUserCurrentHost -Force
# ==============================================================

function deepseek {
    $env:ANTHROPIC_BASE_URL = "https://api.deepseek.com/anthropic"
    $env:ANTHROPIC_AUTH_TOKEN = $env:DEEPSEEK_API_KEY
    $env:ANTHROPIC_MODEL = "deepseek-v4-pro[1m]"
    $env:ANTHROPIC_DEFAULT_OPUS_MODEL = "deepseek-v4-pro[1m]"
    $env:ANTHROPIC_DEFAULT_SONNET_MODEL = "deepseek-v4-pro"
    $env:ANTHROPIC_DEFAULT_HAIKU_MODEL = "deepseek-v4-flash"
    $env:CLAUDE_CODE_SUBAGENT_MODEL = "deepseek-v4-flash"
    $env:CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = "1"
    $env:DISABLE_GROWTHBOOK = "1"

    claude $args
}
