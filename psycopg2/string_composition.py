import psycopg2

# Connect to database
conn = psycopg2.connect("dbname=sandbox user=blackdog")

# Open cursor
cur = conn.cursor()

# Drop table if exists
cur.execute("DROP TABLE IF EXISTS table2;")

# Create table
cur.execute('''
    CREATE TABLE table2 (
        id        INTEGER  PRIMARY KEY,
        completed BOOLEAN NOT NULL DEFAULT False
    );
''')

# Insert using 'Tuple'
cur.execute('INSERT INTO table2(id, completed) VALUES (%s, %s);', (1, True))

# Insert using 'Dictionary'
cur.execute('INSERT INTO table2(id, completed) VALUES (%(id)s, %(completed)s);', {'id':2, 'completed': False})

# Vriable format
query = 'INSERT INTO table2(id, completed) VALUES (%(id)s, %(completed)s);'
data = {'id':3, 'completed': True}
cur.execute(query, data)

# Commit Transaction
conn.commit()

# Close connection
cur.close()
conn.close()