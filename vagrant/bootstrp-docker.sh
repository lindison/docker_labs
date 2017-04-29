
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

cat >> /etc/hosts <<EOL

192.168.50.51 node-1
192.168.50.52 node-2
192.168.50.53 node-3

EOL
