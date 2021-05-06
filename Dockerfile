# Nginx - Pats site webpages
FROM nginx:latest
COPY html/index.html /usr/share/nginx/html
