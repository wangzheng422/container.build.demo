ARG REGISTRY='quay.io'

FROM ${REGISTRY}/baicell/fgpa-driver:v1.0.18--4.18.0-305.19.1 AS fgpa-driver

FROM docker.io/busybox

USER root
COPY --from=fgpa-driver /BaiBBU_DXSS_1.0.18--4.18.0-305.19.1.PKG /BaiBBU_DXSS_1.0.18--4.18.0-305.19.1.PKG
COPY --from=fgpa-driver /BaiBBU_DXSS_1.0.16--4.18.0-305.19.1.PKG /BaiBBU_DXSS_1.0.16--4.18.0-305.19.1.PKG

COPY ocp4.install.sh /ocp4.install.sh
RUN chmod +x /ocp4.install.sh

WORKDIR /
