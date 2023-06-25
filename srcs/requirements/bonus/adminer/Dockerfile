FROM debian:bullseye

RUN apt update \
	&& apt install -y php php-mysql wget

COPY ./tools/script.sh /

RUN chmod +x ./script.sh

CMD [ "sh", "./script.sh" ]
