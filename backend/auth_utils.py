from functools import wraps
from flask import request, jsonify
from db import get_connection
import jwt
from flask import current_app

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = None

        # Verifica o header Authorization
        if "Authorization" in request.headers:
            token = request.headers["Authorization"].split(" ")[1]  # "Bearer <token>"

        if not token:
            return jsonify({"error": "Token não fornecido"}), 401

        try:
            data = jwt.decode(token, current_app.config["SECRET_KEY"], algorithms=["HS256"])
            user_id = data["user_id"]

            # Vai buscar o utilizador à BD
            conn = get_connection()
            cur = conn.cursor()
            cur.execute("SELECT name, email FROM users WHERE id = %s", (user_id,))
            user = cur.fetchone()
            cur.close()
            conn.close()

            if not user:
                return jsonify({"error": "Utilizador não encontrado"}), 404

        except jwt.ExpiredSignatureError:
            return jsonify({"error": "Token expirado"}), 401
        except jwt.InvalidTokenError:
            return jsonify({"error": "Token inválido"}), 401
        except Exception as e:
            return jsonify({"error": str(e)}), 500

        return f(user, *args, **kwargs)

    return decorated