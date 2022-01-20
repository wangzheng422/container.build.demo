FROM registry.redhat.io/rhel8/support-tools

RUN dnf install -y net-tools iproute

COPY set_ip.sh /set_ip.sh
RUN chmod +x /set_ip.sh

