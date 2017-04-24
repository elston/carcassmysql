import os

from .base import *

DEBUG = True

# 
STATICFILES_DIRS = [
    os.path.join(BASE_DIR,'static/'),
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', 
        'NAME': 'mediatry',
        'USER': 'mark',
        'PASSWORD': 'zuckerberg',
        'HOST': 'storage',
        'PORT': '3306',
    }
}

TEMPLATES[0]['OPTIONS']['debug'] = DEBUG