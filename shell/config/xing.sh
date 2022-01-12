echo "info: Install kubectl krew plugin manager"
echo "info: for kubectx, kubens"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# install oly
export PATH="$HOME/.oly/bin:$PATH"

echo "info: Install oly and then complete oly installation! Run:"
echo
echo ". <(oly setup completion bash)"
