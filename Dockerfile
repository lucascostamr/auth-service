FROM maven:3.9.6-eclipse-temurin-22-alpine
WORKDIR /app
COPY . /app
RUN \
    apk upgrade &&\
    apk add --no-cache inotify-tools npm git
CMD [ "sh", "-c","\
    npm ci &&\
    source ./.inotify/file-event.sh &\
    mvn clean install &&\
    sh\
"]