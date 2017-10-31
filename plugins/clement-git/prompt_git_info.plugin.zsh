if [ -n "$GIT_BRANCH" ]; then
    local s="("
    s+="$GIT_BRANCH"
		if [ "$GIT_AHEAD" -ne 0 ]; then
        s+="↑"
		fi
		if [ "$GIT_BEHIND" -ne 0 ]; then
        s+="↓"
		fi
    if [ "$GIT_CHANGED" -ne 0 ]; then
        s+="⚡"
    fi
    s+=")"
    printf "%s%s" "%{${fg[yellow]}%}" $s
fi

