import psycopg2

# Establish database connection
conn = psycopg2.connect(dbname='tesla', user='postgres', password='postgres', host='localhost', port=5432)

# Open a cursor to perform database operations
cur = conn.cursor()

# Create database table
cur.execute("DROP TABLE IF EXISTS model;")
cur.execute("""
  CREATE TABLE model
  (
      model_id serial PRIMARY KEY,
      model_name VARCHAR NOT NULL
  );
""")

# Insert data
# Using Tuple Format
cur.execute('INSERT INTO model(model_name) VALUES(%s);', ('Model X'));
# Using Dictionary Format
cur.execute('INSERT INTO model(model_name) VALUES(%(mdoel_name)s);', {'model_name': 'Model Y'});

# Commit Transaction
conn.commit()

# Close DB Session
cur.close()
conn.close()
