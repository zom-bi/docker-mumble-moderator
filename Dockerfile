FROM debian:stretch
MAINTAINER none

RUN \
    apt-get update \
    && apt-get install --yes python git python-pip libssl-dev libbz2-dev \
		&& apt-get clean \
		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
        && pip install zeroc-ice

ADD bin/start.sh /tmp/start.sh
RUN chmod 755 /tmp/start.sh
VOLUME ["/data"]

RUN git clone https://github.com/mumble-voip/mumo.git

WORKDIR /mumo
CMD ["/tmp/start.sh"]
