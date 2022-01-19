FROM quay.io/baicell/nr5g:latest as NR5G

FROM docker.io/centos:centos7

RUN yum -y install epel-release 
RUN yum -y update 
RUN yum -y install net-tools pciutils lksctp-tools iptraf-ng htop vim tcpdump wget bzip2 lrzsz dhcp gcc-c++ libcgroup libedit tuned openssl grub2-tools numa* tuna libhugetlbfs
RUN yum clean all

COPY --from=NR5G /nr5g_19.10.03.bz2 /home
RUN cd /home && tar xf nr5g_19.10.03.bz2 

COPY patch/ipp.wzh.cfg /home/bin/nr5g_img/files/lib/ipp/ipp.wzh.cfg
COPY patch/mkl.wzh.cfg /home/bin/nr5g_img/files/lib/mkl/mkl.wzh.cfg
COPY patch/install_lib.sh /home/bin/nr5g_img/scripts/install_lib.sh
RUN chmod +x /home/bin/nr5g_img/scripts/install_lib.sh

RUN cd /home/bin/nr5g_img/ && bash install.sh

RUN yum -y clean all && \
  /bin/rm -f /home/nr5g_19.10.03.bz2
