FROM nginx:1.25

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC

WORKDIR /app

RUN apt-get update -y \
  && apt-get install -y supervisor

COPY ./nginx.conf /config/nginx.conf
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./lrs2-linux lrs
COPY ./.env .

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
