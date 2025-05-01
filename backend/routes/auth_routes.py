from flask import Blueprint, request, jsonify
import psycopg2
import bcrypt

auth_bp = Blueprint("auth", __name__)

@auth_bp.route("/api/register", methods=["POST"])
def register():
    data = request.get_json()
    name = data["name"]
    email = data["email"]
    password = data["password"]

    hashed_pw = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()

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
