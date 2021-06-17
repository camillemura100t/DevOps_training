# 1. Préciser l'image de base (OS)

FROM alpine:3.12

# 2. Install redis

RUN apk add --update redis

# 3. Install bash

RUN apk add bash

# 4. Startup cmd

CMD ["redis-server"]