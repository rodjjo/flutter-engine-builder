# flutter-engine-builder
Automate flutter engine build on ubuntu like distro.


## Docker Setup


Install Docker
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
```

build the docker image
```bash
make docker-image
```

start the container
```bash
make start
```

clone the flutter engine
```bash
make clone-engine
```

build the engine
```bash
make build-engine
```

copy the compiled engine
```bash
make copy-binaries
```

stop the container
```bash
make stop
```


## Flutter tool

use myflutter.py to use the compiled engine
```bash
python myflutter.py doctor
mkdir projects
cd projects
../myflutter.py create -t plugin --platforms=linux testapp
cd testapp/example
../../../myflutter.py run -d linux
```
