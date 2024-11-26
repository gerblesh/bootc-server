FROM quay.io/fedora/fedora-bootc:41


COPY etc /etc
COPY usr /usr

RUN dnf install -y                                \
    cockpit                                       \
    cockpit-storaged                              \
    cockpit-podman                                \
    cockpit-navigator                             \
    cockpit-networkmanager                        \
    cockpit-files                                 \
    cockpit-composer                           && \
    systemctl enable podman.socket             && \
    systemctl enable podman-auto-update.timer  && \
    dnf clean all
