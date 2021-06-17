# Fetch docker image from local or distant source
FROM alpine:3.12

# 
LABEL maintainer Camille MURA <camille.mura100t@gmail.com>

#
WORKDIR '/tmp/test01'

# Install redis via apk (alpine package tool)
RUN apk add --update redis

# Install bash via apk
RUN apk add bash

# 
COPY . .

# Startup cmd
CMD ["redis-server"]
