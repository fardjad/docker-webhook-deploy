FROM node:6.3.1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq \
    git \
    locales \
    bash \
    openssh-client

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

COPY ssh_config /etc/ssh/ssh_config

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY app/package.json /usr/src/app/
RUN npm install
COPY app /usr/src/app
RUN chmod +x /usr/src/app/clone.sh

CMD [ "npm", "start" ]
