FROM debian:bullseye

RUN apt-get update \
	&& apt-get install redis-server php-redis -y

RUN echo "bind 0.0.0.0" >> /etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server", "--protected-mode", "no" ]