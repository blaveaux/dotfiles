export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# TODO: figure out _why_ this was appended to .zshrc. Likely related to bash_completion
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/blaveaux/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/blaveaux/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/blaveaux/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/blaveaux/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/blaveaux/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/blaveaux/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
