FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y -q install \
	libmicrohttpd-dev libssl-dev cmake build-essential
RUN apt-get update && apt-get -y -q install \
	git
RUN git clone https://github.com/fireice-uk/xmr-stak-cpu
RUN cd xmr-stak-cpu && \
	cmake . && \
	make install
ADD config.txt /xmr-stak-cpu/bin/config.txt
ADD config.txt /config.txt
RUN chmod +x /xmr-stak-cpu

ENTRYPOINT ["/xmr-stak-cpu/bin/xmr-stak-cpu"]
