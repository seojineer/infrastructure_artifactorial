# Artifactorial
Artifactorial file server for lava test result file

(memo)
Install as below for local arrifactorial server.

https://github.com/ivoire/Artifactorial

- Using script
Run start-artifact.sh to start running artifactorial server.

- Using Dockerfile
$ sudo docker image build -t artifact .
$ sudo docker container run --name artifact -p 80:8000 artifact

