FROM pottava/nodejs:6.3

RUN apk add --update --no-cache sudo bash && \
  npm install -g forever && \
  export uid=1000 gid=1000 && \
  mkdir -p /home/docker && \
  echo "docker:x:${uid}:${gid}:docker,,,:/home/docker:/bin/bash" >> /etc/passwd && \
  echo "docker:x:${uid}:" >> /etc/group && \
  echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker && \
  chmod 0440 /etc/sudoers.d/docker && \
  chown ${uid}:${gid} -R /home/docker && \
  cd /home/docker

ENV HOME=/home/docker USER=docker
USER docker
WORKDIR /home/docker/$PRJ/nodejs/application
CMD node $MODULE

