if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
    update_current_git_vars.plugin.zsh
    unset __EXECUTED_GIT_COMMAND
fi
