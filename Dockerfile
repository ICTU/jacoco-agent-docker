FROM alpine:latest

ENV md5 60b0e69fb9fcdd9b8fcc6656b625c469
ENV jacoco_version 0.8.2

RUN apk update && apk add curl && apk add unzip && \
    curl -f https://repo1.maven.org/maven2/org/jacoco/jacoco/$jacoco_version/jacoco-$jacoco_version.zip -o jacoco.zip && \
    sum=$(cat jacoco.zip | md5sum | cut -d ' ' -f 1) && \
    echo $sum && \
    if [ ! $sum == $md5 ]; then exit 1; fi && \
    mkdir /jacoco && \
    unzip jacoco.zip -d /jacoco && \
    rm jacoco.zip

VOLUME "/jacoco"

CMD /bin/sh -c "trap ':' TERM INT; sleep 3600 & wait"
