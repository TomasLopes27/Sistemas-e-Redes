from flask import Flask
from routes.auth_routes import auth_bp
from routes.concert_routes import concert_bp
from routes.concert_interactions import interaction_bp
from routes.admin_users import admin_bp
from routes.user_routes import user_bp
from flask_cors import CORS
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
app.config["SECRET_KEY"] = os.getenv("SECRET_KEY")

CORS(
    app,
    supports_credentials=True,
    origins=["http://localhost:10000", "https://sistemas-e-redes-front.onrender.com"],
)

app.register_blueprint(auth_bp)
app.register_blueprint(concert_bp)
app.register_blueprint(interaction_bp)
app.register_blueprint(user_bp)
app.register_blueprint(admin_bp)

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=True)
