#!/bin/bash

virtualenv venv \
&& source venv/bin/activate \
&& python myproject/manage.py runserver 0.0.0.0:8080
