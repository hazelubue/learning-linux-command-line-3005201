getNumber() {
    local PROMPT_TEXT="$1"
    local USER_INPUT=""
    local VALID=false

    while [ "$VALID" = false ]; do
        # Send prompt to stderr so it doesn't pollute the return value
        echo "$PROMPT_TEXT" >&2
        read USER_INPUT

        # Regex Breakdown:
        # ^[0-9]+(\.[0-9]+)?$
        # ^[0-9]+       : Starts with one or more digits
        # (\.[0-9]+)?   : Optionally followed by a dot and more digits
        # $             : End of string
        if [[ $USER_INPUT =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
            VALID=true
            echo "$USER_INPUT"
        else
            echo "ERROR: '$USER_INPUT' is not a valid number." >&2
        fi
    done
}
