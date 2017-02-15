FROM node:latest
LABEL version="1.0.0"
MAINTAINER Cenac Catalin <catalin@cenac.ro>
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
RUN npm install -g exp
ENTRYPOINT ["/tini", "--"]
EXPOSE 19001
WORKDIR /root/app
