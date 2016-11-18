FROM kscape/docker-oracle-java:latest

ENV SBT_VERSION 0.13.13

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb

COPY home/sbt/0.13/plugins/plugins.sbt /root/.sbt/0.13/plugins/plugins.sbt
COPY home/sbt/0.13/global.sbt /root/.sbt/0.13/global.sbt

RUN sbt update
