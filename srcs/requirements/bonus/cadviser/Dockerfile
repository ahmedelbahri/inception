FROM debian:bullseye

RUN apt update \
	&& apt install curl -y

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o /usr/bin/cadvisor

RUN chmod +x /usr/bin/cadvisor

CMD [ "/usr/bin/cadvisor", "-logtostderr" ]
