postgres:
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=2311 -d postgres
# the arugment is used in /bin/sh like "createdb", "dropdb", "psql"
createdb:
	docker exec -it postgres16 createdb --username=root --owner=root simple_bank
dropdb:
	docker exec -it postgres16 dropdb simple_bank
migrateup:
	migrate -path db/migration -database "postgresql://root:2311@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:2311@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate


.PHONY: postgres createdb dropdb migrateup migratedown
