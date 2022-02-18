if [[ "$OSTYPE" =~ ^linux ]]; then
  # export DOCKER_HOST=unix:///run/user/1001/docker.sock
  export DOCKER_HOST=unix:///run/docker.sock
fi

