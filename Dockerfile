FROM eclipse-mosquitto:2.0
COPY ./config /mosquitto/config
RUN chmod 600 /mosquitto/config/acl.txt
EXPOSE 1883
EXPOSE 8883
