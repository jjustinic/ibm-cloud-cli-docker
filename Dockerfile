FROM alpine

ARG USER=ibmcloud

ENV HOME=/home/$USER
ENV IBMCLOUD_VERSION_CHECK=false

COPY entrypoint.sh /opt/entrypoint.sh

RUN addgroup -g 1000 -S $USER \
 && adduser -u 1000 -S $USER -G $USER \
 && apk --no-cache add curl \
 && curl -fsSL https://clis.cloud.ibm.com/install/linux | sh

USER $USER
WORKDIR $HOME

RUN ibmcloud plugin install cloud-functions \
 && ibmcloud plugin install cloud-object-storage \
 && ibmcloud plugin install container-registry \
 && ibmcloud plugin install container-service

ENTRYPOINT ["/opt/entrypoint.sh"]
