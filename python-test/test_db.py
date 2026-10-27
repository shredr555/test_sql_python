from datetime import datetime

def test_connection_is_open(conn):
    assert not conn.closed

def test_select_now(conn):
    with conn.cursor() as cur:
        cur.execute("SELECT now()")
        row = cur.fetchone()

    assert row is not None, "Nothing :("
    assert isinstance(row[0], datetime), "IT'S WORKING!!!!"