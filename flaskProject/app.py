from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:postgres@localhost:5432/tanks'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class Model(db.Model):
    __tablename__ = 'models'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), unique=True, nullable=False)

    def __repr__(self):
        return f'Tank Model: {self.name}'


db.create_all()


@app.route('/')
def index():
    tank_model = Model.query.first()
    if tank_model is not None:
        return f'Tank Model Name: {tank_model.name}'
    else:
        return 'There does not exist tank models launched yet'


if __name__ == '__main__':
    app.run()
