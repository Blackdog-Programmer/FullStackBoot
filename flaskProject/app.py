from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@localhost:5432/tesla'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class Model(db.Model):
    __tablename__ = 'models'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)

    def __repr__(self):
        return f'Tesla Model Name: {self.name}'


db.create_all()


@app.route('/')
def index():
    tesla_models = Model.query.all()
    if len(tesla_models) != 0:
        for model in tesla_models:
            return repr(model)
    else:
        return 'There are not tesla models launched yet'


if __name__ == '__main__':
    app.run()
