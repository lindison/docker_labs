
cat >> /etc/apk/repositories <<EOL
http://dl-cdn.alpinelinux.org/alpine/edge/community
EOL

apk update
apk add docker
apk add git
apk add curl
apk add tree
apk add py-pip
pip install docker-compose
rc-update add docker boot
service docker start
