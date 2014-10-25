# la table des couleurs
	fg_black=%{$'\e[0;30m'%}
	fg_red=%{$'\e[0;31m'%}
	fg_green=%{$'\e[0;32m'%}
	fg_brown=%{$'\e[0;33m'%}
	fg_blue=%{$'\e[0;34m'%}
	fg_purple=%{$'\e[0;35m'%}
	fg_cyan=%{$'\e[0;36m'%}
	fg_white=%{$'\e[0;37m'%}

	fg_gray=%{$'\e[1;30m'%}
	fg_lred=%{$'\e[1;31m'%}
	fg_lgreen=%{$'\e[1;32m'%}
	fg_yellow=%{$'\e[1;33m'%}
	fg_lblue=%{$'\e[1;34m'%}
	fg_pink=%{$'\e[1;35m'%}
	fg_lcyan=%{$'\e[1;36m'%}

#Text Background Colors
	bg_red=%{$'\e[0;41m'%}
	bg_green=%{$'\e[0;42m'%}
	bg_brown=%{$'\e[0;43m'%}
	bg_blue=%{$'\e[0;44m'%}
	bg_purple=%{$'\e[0;45m'%}
	bg_cyan=%{$'\e[0;46m'%}
	bg_gray=%{$'\e[0;47m'%}

#Attributes
	at_normal=%{$'\e[0m'%}
	at_bold=%{$'\e[1m'%}
	at_italics=%{$'\e[3m'%}
	at_underl=%{$'\e[4m'%}
	at_blink=%{$'\e[5m'%}
	at_outline=%{$'\e[6m'%}
	at_reverse=%{$'\e[7m'%}
	at_nondisp=%{$'\e[8m'%}
	at_strike=%{$'\e[9m'%}
	at_boldoff=%{$'\e[22m'%}
	at_italicsoff=%{$'\e[23m'%}
	at_underloff=%{$'\e[24m'%}
	at_blinkoff=%{$'\e[25m'%}
	at_reverseoff=%{$'\e[27m'%}
	at_strikeoff=%{$'\e[29m'%}

#colors designation
#a     black
#b     red
#c     green
#d     brown
#e     blue
#f     magenta
#g     cyan
#h     light grey
#A     bold black, usually shows up as dark grey
#B     bold red
#C     bold green
#D     bold brown, usually shows up as yellow
#E     bold blue
#F     bold magenta
#G     bold cyan
#H     bold light grey; looks like bright white
#x     default foreground or background


#order
#1.   directory
#2.   symbolic link
#3.   socket
#4.   pipe
#5.   executable
#6.   block special
#7.   character special
#8.   executable with setuid bit set
#9.   executable with setgid bit set
#10.  directory writable to others, with sticky bit
#11.  directory writable to others, without sticky bit

LSCOLORS="Exxxxxxxxxxxxxxxxxxxxx"
export LSCOLORS

# load colors
autoload -U colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# Autoload zsh functions.
fpath=(~/.oh-my-zsh/custom/plugins $fpath)
autoload -U ~/.oh-my-zsh/custom/plugins/*(:t)

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars.plugin.zsh'
precmd_functions+='precmd_update_git_vars.plugin.zsh'
chpwd_functions+='chpwd_update_git_vars.plugin.zsh'

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% VIM ]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

#export KEYTIMEOUT=1

PROMPT="${fg_brown}${fg_green}%n${fg_red}@${fg_purple}%m${fg_white}[${fg_lblue}%~${fg_white}]\$(prompt_git_info.plugin.zsh)
${fg_brown}${fg_white}[${fg_cyan}%T${fg_white}]:"

#zle -N zle-line-init
#zle -N zle-keymap-select

