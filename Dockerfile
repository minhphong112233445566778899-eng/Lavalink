FROM eclipse-temurin:17-jre-jammy

RUN groupadd -g 322 lavalink && \
    useradd -r -u 322 -g lavalink lavalink

WORKDIR /opt/Lavalink

ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.0.8/Lavalink.jar Lavalink.jar

COPY LavalinkServer/application.yml application.yml

RUN chown -R lavalink:lavalink /opt/Lavalink

USER lavalink

ENTRYPOINT ["java", "-jar", "Lavalink.jar"]
