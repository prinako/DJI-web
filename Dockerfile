FROM nginx:alpine

RUN apk update && apk add --no-cache openssl

COPY web /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY nginx/entrypoint.sh docker-entrypoint.d/entrypoint.sh
RUN chmod +x docker-entrypoint.d/entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["/docker-entrypoint.d/entrypoint.sh"]