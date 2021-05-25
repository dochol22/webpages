# Nginx - Pats site webpages
FROM nginx:1.18.0
COPY html/index.html /usr/share/nginx/html
