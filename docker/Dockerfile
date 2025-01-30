FROM jolielang/jolie:edge-alpine
RUN apk update
RUN apk add --no-cache git
RUN git clone https://github.com/jolie/jocker.git
WORKDIR /jocker
CMD jolie --trace --responseTimeout 30000 dockerAPI.ol
