#!/bin/bash

gpt_command() {
    # check if last command failed and no more arguments
    if [ $? -ne 0 ] && [ $# -eq 0 ]; then
        # invoke thefuck first, if it can't work, use chatgpt
        echo "[*] Invoke thefuck first"
        fuck
        
        # if failed
        if [ $? -ne 0 ]; then
            # check if use chatgpt, with yellow color
            echo -e -n "\033[0;33m[*] thefuck failed, use LLM? [Y/n]\033[0m"
 
            # get feedback
            read -r feedback

            if [ "$feedback" = "Y" ] || [ "$feedback" = "y" ] || [ "$feedback" = "" ]; then
                # Read last command from history
                local last_command=$(fc -ln -1)
    
                # exec the command and store the output
                local command_result=$(eval "$last_command" 2>&1)
    
                sgpt -s --role "Shell Command Corrector" "Wrong command:\`\`\`$last_command\`\`\`\n\nResult of wrong command:\`\`\`$command_result\`\`\`"
            fi
        fi
    else
        local command="${*}"
        sgpt -s "$command"
    fi
}

# alias to use the function
alias '?=gpt_command'