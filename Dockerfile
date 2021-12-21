# base image
FROM pelias/baseimage

RUN apt-get update && apt-get install -y build-essential python jq lbzip2 parallel && rm -rf /var/lib/apt/lists/*

ENV WORKDIR /code/pelias/placeholder
WORKDIR ${WORKDIR}

COPY ./package.json ${WORK}
RUN npm install

ADD . ${WORKDIR}

ENV WOF_DIR '/data/whosonfirst/sqlite'
ENV PLACEHOLDER_DATA '/data/placeholder'

USER pelias

CMD [ "./cmd/server.sh" ]
