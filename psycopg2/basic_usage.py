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
cur.execute("""
    INSERT INTO model(model_name) 
    VALUES('Model X');
    INSERT INTO model(model_name) 
    VALUES('Model Y');    
""")

# Commit Transaction
conn.commit()

# End Session
cur.close()
conn.close()