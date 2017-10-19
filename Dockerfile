FROM openjdk:8
MAINTAINER Rey Bumalay <reyjexter@gmail.com>

RUN update-alternatives --config java
RUN update-alternatives --config javac
RUN update-ca-certificates -f

EXPOSE 9000 8888

COPY . /var/app/current
WORKDIR /var/app/current

CMD ["./sbt", "run", "-Dsbt.ivy.home=/ivy2"]
