FROM node:9.4.0

RUN echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" > /etc/apt/sources.list.d/unstable.list &&\
    apt-get update &&\
    apt-get install --assume-yes -t unstable gcc-5 libgmp3-dev g++-5 &&\
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5 &&\
    cc --version

RUN mkdir -p /opt/node-open-mining-portal

COPY package.json /opt/node-open-mining-portal/
COPY package-lock.json /opt/node-open-mining-portal/

WORKDIR /opt/node-open-mining-portal

RUN npm install && echo 4

COPY . /opt/node-open-mining-portal/

RUN rm -rf /opt/node-open-mining-portal/pool_configs
RUN ln -s /opt/config/config.json /opt/node-open-mining-portal/config.json
RUN ln -s /opt/config/pool_configs /opt/node-open-mining-portal/

VOLUME ["/opt/config"]

EXPOSE 80
EXPOSE 3333

CMD node init.js
