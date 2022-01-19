[![ci](https://github.com/wangzheng422/container.build.demo/actions/workflows/main.yml/badge.svg)](https://github.com/wangzheng422/container.build.demo/actions/workflows/main.yml)

# container build demo

## large file

```bash

buildah from --name onbuild-container scratch
buildah copy onbuild-container nr5g_19.10.03.bz2 /
buildah umount onbuild-container 
buildah commit --rm onbuild-container quay.io/baicell/nr5g:latest
buildah push quay.io/baicell/nr5g:latest

buildah from --name onbuild-container scratch
buildah copy onbuild-container BaiBBU_DXSS_1.0.18--4.18.0-305.19.1.PKG /
buildah copy onbuild-container BaiBBU_DXSS_1.0.16--4.18.0-305.19.1.PKG /
buildah umount onbuild-container 
buildah commit --rm onbuild-container quay.io/baicell/fgpa-driver:v1.0.18--4.18.0-305.19.1
buildah push quay.io/baicell/fgpa-driver:v1.0.18--4.18.0-305.19.1

```