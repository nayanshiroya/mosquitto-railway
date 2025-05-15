FROM eclipse-mosquitto:2.0

COPY ./config /mosquitto/config

EXPOSE 1883
EXPOSE 8883