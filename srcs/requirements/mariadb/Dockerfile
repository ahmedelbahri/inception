FROM debian:bullseye

RUN apt update  -y\
	&& apt install -y mariadb-server

COPY ./tools/script.sh /

RUN chmod +x script.sh

CMD [ "sh", "script.sh" ]