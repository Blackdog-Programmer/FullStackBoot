from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@localhost:5432/tesla'

db = SQLAlchemy(app)


class CarModel(db.Model):
    __tablename__ = 'car_models'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)


db.create_all()


@app.route('/')
def index():
    tesla_model = CarModel.query.first()
    return tesla_model.name


if __name__ == '__main__':
    app.run()
