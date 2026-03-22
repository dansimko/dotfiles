export CONTAINER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"

alias podman="podman-remote"
# Shell completion
_comp_load -D -- podman-remote
complete -p podman-remote &>/dev/null && eval "$(complete -p podman-remote | sed 's/\<podman-remote\>$/podman/')"
