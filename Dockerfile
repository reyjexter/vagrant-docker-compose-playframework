FROM openjdk:8
MAINTAINER Rey Bumalay <reyjexter@gmail.com>

RUN update-alternatives --config java
RUN update-alternatives --config javac
RUN update-ca-certificates -f

ADD . /var/app/current
WORKDIR /var/app/current

EXPOSE 9000 8888
RUN ./sbt run
