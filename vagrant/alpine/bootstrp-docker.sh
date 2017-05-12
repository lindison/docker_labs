
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
cd /root
git clone https://github.com/lindison/docker_labs.git
cat >> /etc/hosts <<EOL

192.168.50.51 node-0
192.168.50.52 node-1
192.168.50.53 node-2

EOL
sleep 4
cat >> /tmp/images.txt <<EOL
nginx:1.11-alpine
lindison/hello-world:k8s
EOL

for i in $(cat /tmp/images.txt); do docker pull $i; done
