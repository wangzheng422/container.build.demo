[![ci](https://github.com/wangzheng422/container.build.demo/actions/workflows/main.yml/badge.svg)](https://github.com/wangzheng422/container.build.demo/actions/workflows/main.yml)

# container build demo

## large file

```bash
cd centos7

podman build -t quay.io/baicell/nr5g:latest -f nr5g.Dockerfile .

podman push quay.io/baicell/nr5g:latest

```