import psycopg2
from psycopg2.extras import RealDictCursor


class TeslaModel:
    def __init__(self, model_id, model_name):
        self.model_id = model_id
        self.model_name = model_name

    def __repr__(self):
        return f'Tesla, Inc - Model ID: {self.model_id}, Model Name: {self.model_name}'


if __name__ == "__main__":
    # Establish database connection
    conn = psycopg2.connect(dbname='tesla', user='postgres', password='postgres', host='localhost', port=5432)
    cur = conn.cursor(cursor_factory=RealDictCursor)

    # Execute Query
    cur.execute('SELECT model_id, model_name FROM model;')
    for model_info in cur.fetchall():
        model = TeslaModel(model_id=model_info['model_id'], model_name=model_info['model_name'])
        print(model)

    # End Session
    cur.close()
    conn.close()

