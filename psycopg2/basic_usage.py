import psycopg2

# establish database connection
conn = psycopg2.connect(database="sandbox", user="blackdog")

# open a cursor to perfrom database operations
cur = conn.cursor()

# drop table if exists
cur.execute("DROP TABLE IF EXISTS employee;")

# create database table
cur.execute("""
  CREATE TABLE employee
  (
      id serial PRIMARY KEY,
      firstname VARCHAR NOT NULL,
      lastname  VARCHAR NOT NULL,
      position  VARCHAR NOT NULL
  );
""")

# insert data
cur.execute("INSERT INTO employee(firstname, lastname, position) VALUES('SANG CHUL', 'SONG', 'Software Engineer');")

# commit
conn.commit()

# end connnection
cur.close()
conn.close()