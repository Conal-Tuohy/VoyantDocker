# syntax=docker/dockerfile:1
# base image provides a Java runtime
FROM eclipse-temurin:11
# the voyant web app came configured to listen on this port and we haven't changed it
EXPOSE 8888/tcp
# Install wget and unzip
RUN apt-get update && apt-get install --yes wget unzip && rm -rf /var/lib/apt/lists/*
# Download and unzip VoyantServer
RUN wget --no-verbose https://github.com/voyanttools/VoyantServer/releases/download/2.6.10/VoyantServer2_6_10.zip && unzip -q VoyantServer2_6_10.zip && mv VoyantServer2_6_10 VoyantServer
# override a configuration file to increase timeout values
COPY --link config.properties /VoyantServer/_app/WEB-INF/classes/org/voyanttools/trombone/limits/config.properties
# Launch the app
CMD cd VoyantServer && java -jar -Dorg.voyanttools.server.memory=2048 VoyantServer.jar headless=true