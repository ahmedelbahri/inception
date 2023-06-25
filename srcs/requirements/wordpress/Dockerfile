FROM debian:bullseye

RUN apt update \
	&& apt install php7.4-fpm php-mysql curl -y

COPY ./tools/script.sh /

RUN chmod +x script.sh

CMD [ "sh", "script.sh" ]
