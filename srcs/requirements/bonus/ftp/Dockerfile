FROM debian:bullseye

RUN apt update \
	&& apt install -y vsftpd

COPY ./conf/vsftpd.conf /vsftpd.conf

COPY ./tools/script.sh /

RUN chmod +x ./script.sh

CMD [ "sh", "./script.sh" ]
