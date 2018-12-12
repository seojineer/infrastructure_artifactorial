# 버전을 적으려면 # FROM python:2.7 이런식으로 적어준다. 
FROM python 
#FROM ubuntu:16.04

ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1

RUN apt-get update \ 
	&& apt-get install -y --no-install-recommends \ 
		postgresql-client \
	&& rm -rf /var/lib/apt/lists/* 

COPY ./requirements.txt ./

# django
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000 5432 9998

WORKDIR /myproject
CMD ["python", "manage.py", "runserver", "0.0.0.0:9998"]
