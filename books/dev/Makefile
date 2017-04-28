all:
	@echo "Hello $(LOGNAME), nothing to do by default"


# ========= pull ==============
pull:
	@echo "---> pull mysql:5.7"
	@docker pull mysql:5.7
	@echo "---> pull python:3.6-slim"
	@docker pull python:3.6-slim
	@echo "---> pull nginx:1.11.13-alpine"	
	@docker pull nginx:1.11.13-alpine



# =========== build ================

build_storage:
	@docker-compose \
		-p carcassmysql \
		-f build.yml \
		build storage


build:
	@docker-compose \
		-p carcassmysql \
		-f build.yml \
		build

rebuild:
	@docker-compose \
		-p carcassmysql \
		-f build.yml \
		build --force-rm mediatry



# ========= bootstrap ==============

# bootstrap_storage:
# 	@../../images/storage/bootstrap.sh	

bootstrap_storage:
	@docker-compose \
		-p carcassmysql \
		-f bootstrap.yml \
		run -d storage

bootstrap_mediatry:
	@docker-compose \
		-p carcassmysql \
		-f bootstrap.yml \
		run --rm mediatry /usr/local/bin/bootstrap.sh

bootstrap:
	@echo "---> bootstrap storage"
	@make bootstrap_storage
	@echo "---> bootstrap mediatry"	
	@make bootstrap_mediatry



# =========== db =======================
db:
	@docker-compose \
		-p carcassmysql \
		-f db.yml \
		up -d --no-build --no-recreate

# ==========  migrate =================

migrate_mediatry:
	@docker-compose \
		-p carcassmysql \
		-f migrate.yml \
		run --rm mediatry /usr/local/bin/migrate.sh
	@make down		


# =========== shell ======================

shell_mediatry:
	@docker-compose \
		-p carcassmysql \
		-f migrate.yml \
		run --rm mediatry /bin/bash


# =========== runserv ======================
runserv_mediatry:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		run --rm mediatry /usr/local/bin/runserv.sh


# =========== logs =====================

log_storage:
	@docker logs -f carcassmysql_storage_1

log_mediatry:
	@docker logs -f carcassmysql_mediatry_1	


# ============ misc ======================

up:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		up -d --no-build --no-recreate

down:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		down	

restart:
	@make down
	@make up
	@make ps	

ps:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		ps

clear:
	@../../scripts/clear_untagged.sh

