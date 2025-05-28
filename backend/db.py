from urllib.parse import urlparse
import os, psycopg2

def get_connection():
    db_url = "postgresql://teste:84jSa6V52dMnfuPrGe6gXLyh0IMKV9UH@dpg-d0nlkgmmcj7s73e4uilg-a.oregon-postgres.render.com/tinyconcerts_a1jr"
    if not db_url:
        raise Exception("DATABASE_URL não definida")

    result = urlparse(db_url)

    return psycopg2.connect(
        dbname=result.path[1:],
        user=result.username,
        password=result.password,
        host=result.hostname,
        port=result.port
    )