apt-get remove docker docker-engine

apt-get install -y \
     zsh git-core wget \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce
docker run hello-world


cat >> /etc/hosts <<EOL

192.168.50.51 node-1
192.168.50.52 node-2
192.168.50.53 node-3

EOL
sleep 4
cat >> /tmp/images.txt <<EOL
nginx:1.11-alpine
lindison/hello-world:k8s
EOL

for i in $(cat /tmp/images.txt); do docker pull $i; done
