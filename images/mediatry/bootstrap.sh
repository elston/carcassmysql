#!/bin/bash

# ...
mkdir -p /$PROJECT/.env
source /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv $PROJECT
pip install -r /$PROJECT/requirements.$EXTREQ

# ...
mkdir -p /$PROJECT/.logs
echo '' > /$PROJECT/.logs/django.log