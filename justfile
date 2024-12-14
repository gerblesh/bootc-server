export IMAGE_REF:="ghcr.io/gerblesh/bootc-server:latest"

_default:
    #!/bin/bash
    /usr/bin/just --list --list-heading $'Available commands:\n' --list-prefix $' - '

build-container:
    podman build . bootc-server


build-iso:
    #!/bin/bash
    sudo podman pull ${IMAGE_REF}
    sudo podman run                                                \
        --rm                                                       \
        -it                                                        \
        --privileged                                               \
        --pull=newer                                               \
        --security-opt label=type:unconfined_t                     \
        -v $(pwd)/config.toml:/config.toml:ro                      \
        -v $(pwd)/output:/output                                   \
        -v /var/lib/containers/storage:/var/lib/containers/storage \
        quay.io/centos-bootc/bootc-image-builder:latest            \
        --type iso                                                 \
        --local                                                    \
        ${IMAGE_REF}
