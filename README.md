# Artifactorial File Server

This is Artifactorial File server for lava test result file.

Lava dispatcher can upload result file while testing on DUT.

(memo)
--------
This is repository what I modified for test.
You can install as below.
https://github.com/ivoire/Artifactorial


1. Running Artifactorial Server
--------

Dockerfile includes creating superuser(id: admin, pw: admin).
To change superuser account, modify Dockerfile.

- Using Dockerfile
1) Build server docker image
$ ./build_docker.sh

2) Run Server Docker image
$ ./run_docker.sh

- Using script
Run start-artifact.sh to start running artifactorial server.

2. Create directory
--------

You can create directory using superuser account on server web interface.

3. Requirement
--------

- Network
Before transfering result file to server, DUT have to connected network first.

- Tockens
You can create tokens using superuser account on server web interface.

4. Test
--------

- curl command
example)
$ curl -F 'path=@test.txt' -F 'token=feef5495026b1e9de708b557855b8079' http://{artifactorial_ip_address}:9090/artifacts/test

- Test job file
You can submit and test below job file.
https://github.com/seojineer/lava
