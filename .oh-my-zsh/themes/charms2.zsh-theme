# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n %{$reset_color%}'
    local user_symbol='#'
else
    # local user_host= '%{$terminfo[bold]$fg[white]%}%n %{$reset_color%}'
    # local user_symbol= '%{$fg[white]%}λ%{$reset_color%}'
    local user_host='%{$terminfo[bold]%}%n '
    local user_symbol='λ'
fi

local current_dir='%{$terminfo[bold]$fg[cyan]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

NEWLINE=$'\n'
# PROMPT='${user_host}${current_dir}${git_branch}${venv_prompt}%B${NEWLINE}${user_symbol}%b '
PROMPT="${user_host}${current_dir}${git_branch}${venv_prompt}${NEWLINE}%B${user_symbol}%b "

RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
