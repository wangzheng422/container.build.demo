FROM registry.access.redhat.com/ubi8

RUN dnf install -y net-tools iproute

COPY set_ip.sh /set_ip.sh
RUN chmod +x /set_ip.sh

