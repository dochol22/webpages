# Nginx - Pats site webpages
FROM nginx:latest
RUN yum install -y lsof curl
COPY html/index.html /usr/share/nginx/html
