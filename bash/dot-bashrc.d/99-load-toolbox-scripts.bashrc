# Helper to source all scripts in a directory
source_scripts() {
    if [ -d "$1" ]; then
        for rc in "$1"/*; do
            if [ -f "$rc" ]; then
                . "$rc"
            fi
        done
    fi
}

# Check if we are inside a container
if [ -f /run/.containerenv ]; then
    # Extract the name field from the container env file
    container_name=$(grep -oP '^name="\K[^"]+' /run/.containerenv)
    toolbx_scripts_path="$HOME/.bashrc.d/toolbx/"

    source_scripts "$toolbx_scripts_path"
    source_scripts "$toolbx_scripts_path/$container_name"
fi
