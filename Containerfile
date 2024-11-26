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
    dnf clean all                              && \
    systemctl enable podman.socket             && \
    systemctl enable podman-auto-update.timer  && \
    systemctl enable netavark-firewalld-reload

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh                  && \
    ostree container commit
