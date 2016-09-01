FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
                     openvpn \
                     iptables

EXPOSE 1194

ADD ./scripts/start /start
RUN chmod +x /start

RUN mkdir /data
VOLUME ["/data"]
WORKDIR "/data"
CMD ["/start"]

