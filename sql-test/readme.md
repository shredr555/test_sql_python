# SQL-задачи

Для выполнения задач использовалась СУБД PostgreSQL 18, запущенная в Docker.

## Инструкция по установке

```
    docker pull postgres:18

    docker run -d \
        --name [имя контейнера] \
        -e POSTGRES_USER=[имя пользователя] \
        -e POSTGRES_PASSWORD=[пароль] \
        -e POSTGRES_DB=[название бд] \
        -p 5432:5432 \
        postgres:18

    docker exec -i [имя контейнера] psql -U [имя пользователя] -d [название бд] < init.sql

    docker exec -i [имя контейнера] psql -U [имя пользователя] -d [название бд] < data.sql
```

Для открытия интерактивной консоли PostgreSQL выполните:

```
    docker exec -it [имя контейнера] psql -U [имя пользователя] -d [название бд]
```