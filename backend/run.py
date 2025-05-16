from flask import Flask
from routes.auth_routes import auth_bp
from routes.concert_routes import concert_bp
from routes.concert_interactions import interaction_bp



app = Flask(__name__)
app.register_blueprint(auth_bp)
app.register_blueprint(concert_bp)
app.register_blueprint(interaction_bp)
app.config["SECRET_KEY"] = "asdfe"


if __name__ == "__main__":
    app.run(debug=True)
