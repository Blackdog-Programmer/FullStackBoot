from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:postgres@localhost:5432/tesla'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class Model(db.Model):
    __tablename__ = 'models'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), unique=True, nullable=False)

    def __repr__(self):
        return f'Tesla Model Name: {self.name}'


db.create_all()


@app.route('/')
def index():
    tesla_model = Model.query.first()
    if tesla_model is not None:
        return f'Tesla Model: {tesla_model.name}'
    else:
        return 'There are not tesla models launched yet'


if __name__ == '__main__':
    app.run()
