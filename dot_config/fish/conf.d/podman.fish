if type -q podman
    set -gx DOCKER_HOST "unix://$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')"
    set -gx TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
    set -gx TESTCONTAINERS_RYUK_DISABLED true
end
