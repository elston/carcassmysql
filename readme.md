Carcass
========================

A skeleton for django web application .


Technology
----------------
- Docker
- Python 3.4
- Django 1.11
- MySql 5.7
- Nginx
- Gunicorn
- Supervisor
- Virtualenv


Getting Started with Docker and Docker Compose for Local Development
--------------------------------------------------------------------

### Install Docker

https://docs.docker.com/installation/

### Install Docker Compose

http://docs.docker.com/compose/install/

### Install the app's project

In the project ./book/dev/ (where the `Makefile` file is located), run:

```
make build
```

then

```
make bootstrap
```

then

```
make db
```

then test db

```
mysql -h 127.0.0.1 -P 3306 -u mark -p mediatry
```

if all OK, down db

```
make down
```

then migrate db

```
make migrate
```

### To run any command inside the Django Docker container, simply prepend :

```
make shell
```

### Start the Docker containers

```
make up
```

This will start the containers in the background.

When you need finish all containers:

```
make down
```

### View the logs

```
make log
```

### Rebuild Docker containers

```
make rebuild
```

### Clear untagged Docker containers

```
make clear
```

### To view runing Docker containers

```
make ps
```
