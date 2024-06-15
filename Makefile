ifeq ($(OS),Windows_NT)
	SLEEP := timeout
else
	SLEEP := sleep
endif

start:
	docker compose -f docker-compose.yaml up --build -d
	$(SLEEP) 2

	docker compose -f docker-compose.yaml exec -w /core api python -m alembic upgrade head

	# docker compose -f docker-compose.yaml rm frontend -f

update-api:
	docker compose -f docker-compose.yaml cp ./back/api/src api:core
	docker compose -f docker-compose.yaml cp ./back/api/database api:core
	docker compose -f docker-compose.yaml cp ./back/api/migrations api:core
	docker compose -f docker-compose.yaml cp ./back/api/config.py api:core

	docker compose -f docker-compose.yaml exec -w /core api python -m alembic upgrade head

update-db:
	docker compose -f docker-compose.yaml exec -w /core api python -m alembic upgrade head

update-pkgs:
	docker compose -f docker-compose.yaml exec -w /core api pip install -r requirements.txt

new-migr:
	docker compose -f docker-compose.yaml cp ./back/api/database api:/core
	docker compose -f docker-compose.yaml exec -w /core api python -m alembic revision --autogenerate -m "$(name)"
	docker compose -f docker-compose.yaml exec -w /core api python -m alembic upgrade head
	docker compose -f docker-compose.yaml cp api:/core/migrations/versions ./back/api/migrations

gen-dump:
	docker compose -f docker-compose.yaml exec database sh -c 'pg_dump -h 127.0.0.1 --username=postgres -d postgres > dumps/$$(date +'%Y-%m-%d_%H-%M-%S').dump'