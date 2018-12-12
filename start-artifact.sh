#!/bin/bash

virtualenv venv \
&& source venv/bin/activate \
&& pip install -r ./myproject/requirements.txt \
&& python myproject/manage.py runserver 0.0.0.0:8080
