import os
import psycopg
import pytest

DB_CONFIG = {
    "host": os.getenv("PGHOST", "localhost"),
    "port": int(os.getenv("PGPORT", "5432")),
    "dbname": os.getenv("PGDATABASE", "testdb"),
    "user": os.getenv("PGUSER", "user"),
    "password": os.getenv("PGPASSWORD", "pass"),
    "connect_timeout": 5
}

@pytest.fixture
def conn():
    with psycopg.connect(**DB_CONFIG) as connection:
        yield connection