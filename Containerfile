FROM quay.io/fedora/fedora-bootc:41


COPY etc /etc
COPY usr /usr

COPY build.sh /tmp/build.sh

RUN chmod +x /tmp/build.sh && /tmp/build.sh && rm -rf /tmp/build.sh
