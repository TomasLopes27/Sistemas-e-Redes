from flask import Blueprint, request, jsonify
from db import get_connection
import jwt
import datetime
from flask import current_app
import bcrypt
from auth_utils import token_required


auth_bp = Blueprint("auth", __name__, url_prefix="/api")


@auth_bp.route("/register", methods=["POST"])
def register():
    data = request.get_json()
    name = data["name"]
    email = data["email"]
    password = data["password"]

    hashed_pw = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()#gera o hash da pasword

    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("""
            INSERT INTO users (name, email, password, usertype)
            VALUES (%s, %s, %s, %s)
        """, (name, email, hashed_pw, 1))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Utilizador registado!"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    

@auth_bp.route("/login", methods=["POST"])
def login():
    data = request.get_json()
    email = data["email"]
    password = data["password"]

    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT id, password FROM users WHERE email = %s", (email,))
        user = cur.fetchone()
        cur.close()
        conn.close()

        if user and bcrypt.checkpw(password.encode(), user[1].encode()):
            token = jwt.encode({
                "user_id": user[0],
                "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)
            }, current_app.config["SECRET_KEY"], algorithm="HS256")

            return jsonify({"token": token}), 200
        else:
            return jsonify({"error": "Credenciais inválidas"}), 401

    except Exception as e:
        return jsonify({"error": str(e)}), 500


@auth_bp.route("/profile", methods=["GET"])
@token_required
def profile(user):
    return jsonify({
        "name": user[0],
        "email": user[1]
    }), 200
