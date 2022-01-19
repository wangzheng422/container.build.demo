ARG REGISTRY='quay.io'

FROM ${REGISTRY}/baicell/base:centos7-latest

# COPY nr5g_19.10.03.bz2 /home
# COPY BaiBBU_XSS_1.6.23.IMG /home
# COPY ImageUpgrade /home

# ARG URL_NR5G='http://192.168.7.11:8080/vbbu/nr5g_19.10.03.bz2'
ARG URL_UPGRADE_IMG='http://192.168.7.11:8080/vbbu/BaiBBU_XSS_1.6.23.IMG'
ARG URL_UPGRADE_SCRIPT='http://192.168.7.11:8080/vbbu/ImageUpgrade'

# RUN curl -fsSL -o /home/nr5g_19.10.03.bz2 ${URL_NR5G}
RUN curl -fsSL -o /home/BaiBBU_XSS_1.6.23.IMG ${URL_UPGRADE_IMG}
RUN curl -fsSL -o /home/ImageUpgrade ${URL_UPGRADE_SCRIPT}

RUN cd /home && chmod +x ImageUpgrade && /bin/cp -f ImageUpgrade /bin/ImageUpgrade && \
  bash ImageUpgrade BaiBBU_XSS_1.6.23.IMG --no-preserve 

RUN yum -y clean all && \
  /bin/rm -f /home/nr5g_19.10.03.bz2 && \
  /bin/rm -f /home/ImageUpgrade && \
  /bin/rm -f /home/BaiBBU_XSS_1.6.23.IMG

