FROM node:8.1-alpine

ARG user=${user:-docker}


##
RUN apk add --update --no-cache sudo bash \
&&  npm install -g forever express angularjs mocha typescript typings \
&&  typings install dt~node --global \

&&  export uid=1000 gid=1000 \
&&  mkdir -p /home/${user} \
&&  echo "${user}:x:${uid}:${gid}:${user},,,:/home/${user}:/bin/bash" >> /etc/passwd \
&&  echo "${user}:x:${uid}:" >> /etc/group \
&&  echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} \
&&  chmod 0440 /etc/sudoers.d/${user} \
&&  chown ${uid}:${gid} -R /home/${user}
##



##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##

COPY starter.sh /usr/bin/starter.sh
CMD starter.sh

