from functools import wraps
from flask import request, jsonify
from db import get_connection
import jwt
from flask import current_app

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = None

        if "Authorization" in request.headers:
            parts = request.headers["Authorization"].split(" ")
            print("DEBUG — Authorization header parts:", parts)
            if len(parts) == 2 and parts[0] == "Bearer":
                token = parts[1]
            else:
                print("DEBUG — Cabeçalho Authorization não está no formato 'Bearer <token>'")

        if not token:
            return jsonify({"error": "Token não fornecido"}), 401

        try:
            data = jwt.decode(token, current_app.config["SECRET_KEY"], algorithms=["HS256"])
            user_id = data["user_id"]

            conn = get_connection()
            cur = conn.cursor()
            cur.execute("SELECT id, name, email, usertype FROM users WHERE id = %s", (user_id,))
            user = cur.fetchone()
            cur.close()
            conn.close()

            if not user:
                return jsonify({"error": "Utilizador não encontrado"}), 404

        except jwt.ExpiredSignatureError:
            return jsonify({"error": "Token expirado"}), 401
        except jwt.InvalidTokenError as e:
            print("DEBUG — InvalidTokenError:", e)
            return jsonify({"error": "Token inválido"}), 401
        except Exception as e:
            return jsonify({"error": str(e)}), 500

        return f(user, *args, **kwargs)

    return decorated

