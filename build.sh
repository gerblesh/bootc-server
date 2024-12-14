#!/bin/bash

dnf install -y cockpit cockpit-storaged cockpit-podman cockpit-navigator cockpit-networkmanager cockpit-files cockpit-composer
systemctl enable podman.socket
systemctl enable podman-auto-update.timer
systemctl enable cockpit
dnf clean all
bootc container lint
