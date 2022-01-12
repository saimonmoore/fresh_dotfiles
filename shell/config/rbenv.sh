command -v ~/.rbenv/bin/rbenv && export PATH=~/.rbenv/bin:$PATH
command -v ~/.rbenv/bin/rbenv && ~/.rbenv/bin/rbenv init || /usr/local/bin/rbenv init
eval "$(rbenv init -)"
