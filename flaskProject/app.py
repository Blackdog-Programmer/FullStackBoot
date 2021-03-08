from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:postgres@localhost:5432/tank'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class Model(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), unique=True, nullable=False)

    colors = db.relationship('Color', backref='model', lazy=True)

    def __repr__(self):
        return f'Tank Model: {self.name}'


class Color(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)

    model_id = db.Column(db.Integer, db.ForeignKey('model.id'), nullable=False)


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
