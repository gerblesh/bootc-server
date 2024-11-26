
build-iso:
    #!/bin/bash
    sudo podman run \
        --rm \
        -it \
        --privileged \
        --pull=newer \
        --security-opt label=type:unconfined_t \
        -v $(pwd)/config.toml:/config.toml:ro \
        -v $(pwd)/output:/output \
        -v /var/lib/containers/storage:/var/lib/containers/storage \
        quay.io/centos-bootc/bootc-image-builder:latest \
        --type iso \
        --local \
        ghcr.io/gerblesh/bootc-server:latest

