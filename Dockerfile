FROM ubuntu:16.04

# Ignore debconf: Warning
ENV DEBCONF_NOWARNINGS yes

# Ignore query
ENV DEBIAN_FRONTEND noninteractive

# Update & Upgrade
RUN apt-get update && apt-get -y dist-upgrade

# git install
RUN apt-get install -y git

# pyenv requirements
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev

# pyenv install
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# pyenv set PATH
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

# pyenv-virtualenv install
RUN git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

# Set Python Environment
#RUN pyenv install 3.6.6
#RUN pyenv virtualenv 3.6.6 prc
RUN pyenv install 2.7.12
RUN pyenv virtualenv 2.7.12 prc

ENV prc_path $PYENV_ROOT/versions/prc
ENV prc_pip $prc_path/bin/pip
ENV prc_python $prc_path/bin/python
#ENV prc_dj $prc_path/lib/python3.6/site-packages/django/bin/django-admin.py
ENV prc_dj $prc_path/lib/python2.7/site-packages/django/bin/django-admin.py

# Django Start Project
WORKDIR /srv/project
RUN $prc_pip install django
# make new project
RUN $prc_python $prc_dj startproject myproject

# artifactorial server file
COPY ./Artifactorial /srv/project/myproject/Artifactorial
COPY ./Artifactorial/*.py /srv/project/myproject/
COPY ./settings.py /srv/project/myproject/myproject/
COPY ./urls.py /srv/project/myproject/myproject/
COPY ./start.sh /srv/project/myproject

EXPOSE 8000 5432 9998 80 9090

# Set Runserver Command
WORKDIR /srv/project/myproject
CMD ./start.sh
