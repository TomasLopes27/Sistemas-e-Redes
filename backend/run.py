from flask import Flask
from routes.auth_routes import auth_bp
from routes.concert_routes import concert_bp
from routes.concert_interactions import interaction_bp
from routes.admin_users import admin_bp
from routes.user_routes import user_bp
import os




app = Flask(__name__)
app.register_blueprint(auth_bp)
app.register_blueprint(concert_bp)
app.register_blueprint(interaction_bp)
app.register_blueprint(user_bp)
app.register_blueprint(admin_bp)
app.config["SECRET_KEY"] = "asdfe"


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))  # <- usa a porta que o Render fornece
    app.run(host='0.0.0.0', port=port)        # <- obrigatoriamente 0.0.0.0
