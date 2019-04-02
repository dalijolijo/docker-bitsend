FROM ubuntu:16.04
LABEL maintainer="LIMXTEC developer"

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp
COPY ./CHECKSUM /tmp

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common wget ca-certificates tar && \
    apt-get install -qq --no-install-recommends libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-thread-dev libminiupnpc10 libevent-dev libdb++-dev && \
    add-apt-repository -y ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y libdb4.8-dev libdb4.8++-dev && \
    rm -rf /var/lib/apt/lists/*

RUN VERSION=`cat /tmp/VERSION` && \
    wget https://github.com/LIMXTEC/BitSend/releases/download/0.14.2.0.0/linux.Ubuntu.16.04.LTS-static-libstdc.tar.gz -O /tmp/prebuilt.tar.gz && \
    echo "$(cat /tmp/CHECKSUM)  /tmp/prebuilt.tar.gz" | sha256sum -c && \
    tar xzf /tmp/prebuilt.tar.gz -C /tmp/ && \
    mv /tmp/bitsendd /usr/local/bin && \
    chmod a+x /usr/local/bin/* && \
    apt-get -y autoremove && \
    apt-get purge -y software-properties-common wget ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data"]
ENV HOME /data
ENV DATA /data
WORKDIR /data

EXPOSE 8886 8800

ENTRYPOINT ["init"]
