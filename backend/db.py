import psycopg2
import os

def get_connection():
    return psycopg2.connect(
        host="localhost",
        database="tinyconcerts",
        user="postgres",
        password="SUA_PASSWORD"
    )
