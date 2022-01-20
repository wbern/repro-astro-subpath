FROM docker-remote.dc.teliacompany.net/nginx:stable-alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY dist/sub-path /var/www/htdocs/sub-path
COPY dist/sub-path.html /var/www/htdocs/sub-path.html

RUN touch /var/run/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx.pid && \
  chown -R nginx:nginx /var/cache/nginx

EXPOSE 8081

USER nginx