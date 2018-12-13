#!/bin/bash

~/.pyenv/versions/prc/bin/python manage.py migrate

# create admin 
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'seoji@nexell.co.kr', 'admin')" | ~/.pyenv/versions/prc/bin/python manage.py shell

# run artifactorial server
~/.pyenv/versions/prc/bin/python manage.py runserver 0.0.0.0:9090
