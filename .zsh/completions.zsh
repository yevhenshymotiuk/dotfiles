fpath=("$HOME/.zsh/completions" $fpath)

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump* ]]; then
	compinit
else
	compinit -C
fi


for completion in "$HOME"/.zsh/completions/*.zsh; do
	source "$completion"
done
