FROM quay.io/fedora/fedora-bootc:41


COPY etc /etc
COPY usr /usr

RUN <<EOF
    dnf install -y                                    \
    cockpit                                           \
    cockpit-storaged                                  \
    cockpit-podman                                    \
    cockpit-navigator                                 \
    cockpit-networkmanager                            \
    cockpit-files                                     \
    cockpit-composer
    systemctl enable podman.socket
    systemctl enable podman-auto-update.timer
    systemctl enable cockpit
    # timedatectl set-timezone 'America/Los_Angeles'
    dnf clean all
    bootc container lint
EOF
