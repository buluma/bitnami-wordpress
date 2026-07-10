FROM bitnami/wordpress
LABEL maintainer "Michael Buluma"

## Change user to perform privileged actions
USER 0
## Install 'vim'
RUN install_packages vim
## Revert to the original non-root user
USER 1001

## Modify 'worker_connections' on NGINX config file to '512'
RUN sed -i 's/worker_connections [0-9]\+/worker_connections 512/' /opt/bitnami/nginx/conf/nginx.conf

## Modify the ports used by NGINX by default
# It is also possible to change these environment variables at runtime
ENV NGINX_HTTP_PORT_NUMBER=8181
ENV NGINX_HTTPS_PORT_NUMBER=8143
EXPOSE 8181 8143
