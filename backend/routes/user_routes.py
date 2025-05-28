from flask import Blueprint, request, jsonify
from auth_utils import token_required
from db import get_connection

user_bp = Blueprint("user", __name__, url_prefix="/api")


@user_bp.route("/profile", methods=["PUT"])
@token_required
def update_profile(user):
    data = request.get_json()
    name = data.get("name")
    email = data.get("email")

    if not name or not email:
        return jsonify({"error": "Nome e email são obrigatórios"}), 400

    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute(
            """
            UPDATE users SET name = %s, email = %s WHERE id = %s
        """,
            (name, email, user[0]),
        )  # user[0] = ID
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Perfil atualizado com sucesso"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
