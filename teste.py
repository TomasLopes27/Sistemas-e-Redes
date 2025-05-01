import psycopg2

try:
    conn = psycopg2.connect(
        host="localhost",
        database="tinyconcerts",
        user="postgres",
        password="saramago2" 
    )
    

    cur = conn.cursor()
    cur.execute("""SELECT table_schema, table_name 
               FROM information_schema.tables
               WHERE table_schema NOT IN ('information_schema', 'pg_catalog')""")

    tables = cur.fetchall()

    print("📋 Tabelas na base de dados:")
    for table in tables:
        print("-", table)

    cur.close()
    conn.close()

except Exception as e:
    print("❌ Erro na ligação:", e)
