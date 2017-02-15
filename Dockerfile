FROM node:latest
LABEL version="1.0.0"
MAINTAINER Cenac Catalin <catalin@cenac.ro>
#RUN apk update && apk upgrade && \
#    apk add --no-cache bash git python curl make gcc g++ python linux-headers binutils-gold gnupg libstdc++ && \
#    npm install -g exp && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
#    npm cache clear && \
#    apk del python make gcc g++ python linux-headers binutils-gold gnupg ${DEL_PKGS} && \
#  rm -rf ${RM_DIRS} /node-${VERSION}* /usr/share/man /tmp/* /var/cache/apk/* \
#    /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
#    /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts
# Add Tini
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
RUN npm install -g exp
ENTRYPOINT ["/tini", "--"]
EXPOSE 19001
WORKDIR /root/app
