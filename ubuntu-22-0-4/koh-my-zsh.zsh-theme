# My custom theme:
#   - single line
#   - quite simple by default: user@host:$PWD
#   - green for local shell as non root
#   - red for ssh shell as non root
#   - magenta for root sessions
#   - prefix with remote address for ssh shells
#   - prefix to detect docker containers or chroot
#   - git plugin to display current branch and status

# HACK: Add new commmand, colorlist will show you the colors and numbers' list.
# TODO: You'd better change the MAIN_COLOR based on the computer.
ZSH_THEME_KOH_MY_ZSH_MAIN_COLOR=45
ZSH_THEME_KOH_MY_ZSH_DIR_COLOR=215
ZSH_THEME_GIT_PREFIX_SUFFIX_COLOR=59
ZSH_THEME_GIT_STATUS_COLOR=203

# git plugin 
ZSH_THEME_GIT_PROMPT_PREFIX="%{%B%F{$ZSH_THEME_GIT_PREFIX_SUFFIX_COLOR}%}git:(%f%{%F{$ZSH_THEME_GIT_STATUS_COLOR}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%B%F{$ZSH_THEME_GIT_PREFIX_SUFFIX_COLOR}%}) %f%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"
function zsh_koh_my_zsh_gitstatus {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	GIT_STATUS=$(git_prompt_status)
	if [[ -n $GIT_STATUS ]]; then
		GIT_STATUS=" $GIT_STATUS"
	fi
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# by default, use green for user@host and no prefix
local ZSH_KOH_MY_ZSH_COLOR=$ZSH_THEME_KOH_MY_ZSH_MAIN_COLOR
local ZSH_KOH_MY_ZSH_PREFIX=""
if [[ -n "$SSH_CONNECTION" ]]; then
	# display the source address if connected via ssh
	ZSH_KOH_MY_ZSH_PREFIX="%{$fg_bold[yellow]%}REMOTE%{$reset_color%} "
	# use red color to highlight a remote connection
	ZSH_KOH_MY_ZSH_COLOR=$ZSH_THEME_KOH_MY_ZSH_MAIN_COLOR
elif [[ -r /etc/debian_chroot ]]; then 
	# prefix prompt in case of chroot
	ZSH_KOH_MY_ZSH_PREFIX="%{$fg[yellow]%}[chroot:$(cat /etc/debian_chroot)]%{$reset_color%} "
elif [[ -r /.dockerenv ]]; then
	# also prefix prompt inside a docker container
	ZSH_KOH_MY_ZSH_PREFIX="%{$fg[yellow]%}[docker]%{$reset_color%} "
fi
if [[ $UID = 0 ]]; then
	# always use magenta for root sessions, even in ssh
	ZSH_KOH_MY_ZSH_COLOR="magenta"
fi
PROMPT='${ZSH_KOH_MY_ZSH_PREFIX}%{%B%F{$ZSH_KOH_MY_ZSH_COLOR}%}%n@%m%f%{$reset_color%}:%{%B%F{$ZSH_THEME_KOH_MY_ZSH_DIR_COLOR}%}%1~%f%{$reset_color%b%} $(zsh_koh_my_zsh_gitstatus)
%(!.#.$) '
RPROMPT="%(?..%{$fg[red]%}%?%{$reset_color%})"
