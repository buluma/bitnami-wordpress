FROM bitnami/wordpress
LABEL maintainer "Michael Buluma"

## Change user to perform privileged actions
USER 0
## Install 'vim'
RUN install_packages vim
## Revert to the original non-root user
USER 1001

# Ports are managed by the base image
EXPOSE 8080 8443
