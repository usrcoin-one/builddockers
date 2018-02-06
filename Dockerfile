FROM ubuntu:16.04


RUN echo deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu xenial main >> /etc/apt/sources.list.d/docker.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D46F45428842CE5E
RUN apt-get update
RUN apt-get -y install ccache git libboost-system1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0 libboost-thread1.58.0 libboost-chrono1.58.0   libssl1.0.0 libevent-pthreads-2.0-5 libevent-2.0-5 build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev    bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev   libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev   protobuf-compiler libqrencode-dev python-pip

RUN apt-get install -y  build-essential  automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ \
      cmake libboost-all-dev miniupnpc libunbound-dev graphviz doxygen libunwind8-dev pkg-config libssl-dev \
      libcurl4-openssl-dev libgtest-dev libreadline-dev libminiupnpc-dev libzmq3-dev libmicrohttpd-dev libssl-dev \
      libhwloc-dev libuv1-dev libseccomp-dev libcap-dev qtdeclarative5-dev qml-module-qtquick-controls qttools5-dev-tools \
     software-properties-common python-software-properties ocl-icd-opencl-dev
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y libboost-all-dev

RUN pip install construct==2.5.2 scrypt

#RUN apt-get install -y nvidia-cuda-dev
WORKDIR /tmp/db-4.8.30
COPY db-4.8.30 /tmp/
RUN (cd /tmp/db-4.8.30/build_unix/;../dist/configure --prefix=/usr/local --enable-cxx) && \
    make;make install && \
    rm -rf /tmp/db-4.8.30

COPY bin/* /usr/local/bin/
RUN pip install --upgrade pip
