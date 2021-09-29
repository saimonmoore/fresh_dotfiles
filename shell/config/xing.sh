# install kubectl krew plugin manager
# for kubectx, kubens
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# install oly
export PATH="$HOME/.oly/bin:$PATH"

. <(oly setup completion bash)
