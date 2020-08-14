# GNXOR ZSH THEME
# Based on the great ys theme (http://ysmood.org/wp/2013/03/my-ys-terminal-theme/)

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
GNXOR_PROMPT_PREFIX1="%{$fg[white]%}%{$fg[cyan]%}\uE0A0%{$reset_color%} "
GNXOR_PROMPT_PREFIX2="%{$fg[cyan]%}"
GNXOR_PROMPT_SUFFIX="%{$reset_color%}"
GNXOR_PROMPT_DIRTY=" %{$fg[red]%}✖︎"
GNXOR_PROMPT_CLEAN=" %{$fg[green]%}●"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${GNXOR_PROMPT_PREFIX1}${GNXOR_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$GNXOR_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$GNXOR_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$GNXOR_PROMPT_CLEAN"

# HG info
local hg_info='$(gnxor_hg_prompt_info)'
gnxor_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${GNXOR_PROMPT_PREFIX1}hg${GNXOR_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$GNXOR_PROMPT_DIRTY"
		else
			echo -n "$GNXOR_PROMPT_CLEAN"
		fi
		echo -n "$GNXOR_PROMPT_SUFFIX"
	fi
}

# virtualenv info
local venv_info='$(virtualenv_info)'
virtualenv_info() {
	if [ $VIRTUAL_ENV ]; then
		echo "%{${fg_bold[white]}%}(env: %{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{${fg_bold[white]}%})%{${reset_color}%}"
	fi
}

# Prompt format: 
# (venv: ...)
# # USER at MACHINE in DIRECTORY
# →                                 BRANCH STATE [TIME]
PROMPT="${venv_info}
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) $reset_color%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${hg_info}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
RPROMPT="${git_info} %{$fg[white]%}[%*]"

if [[ "$USER" == "root" ]]; then
PROMPT="${venv_info}
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) $reset_color%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${hg_info}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
RPROMPT="${git_info} %{$fg[white]%}[%*]"
fi
