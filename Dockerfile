ARG ARCHREPO
FROM ${ARCHREPO}/openjdk:9-slim

ARG QEMU_ARCH
COPY qemu-${QEMU_ARCH}-static /usr/bin/

RUN apt-get update && apt-get install -y wget

ARG YOUTRACK_VERSION=2018.1.41051
RUN wget http://download-cf.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar -O youtrack.jar
EXPOSE 80 
CMD ["java", "-Xms1g", "-XX:MaxMetaspaceSize=250m", "-Djava.awt.headless=true", "-jar", "youtrack.jar", "80"]