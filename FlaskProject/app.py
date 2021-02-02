from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
uri = 'postgresql+psycopg2://blackdog:#mu1561511@localhost:5432/sandbox'
app.config['SQLALCHEMY_DATABASE_URI'] = uri
db = SQLAlchemy(app)


class Person(db.Model):
    __tablename__ = 'persons'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)


db.create_all()


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    app.run()
