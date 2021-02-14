# Fetching records from PostgreSQL DB Table
import psycopg2

conn = psycopg2.connect(database="sandbox", user="blackdog")
cur  = conn.cursor()

cur.execute('SELECT * FROM table2;')
datas = cur.fetchall()

for id, completed in datas:
    print(f'id: {id}\tcompleted: {completed}')

cur.close()
conn.close()