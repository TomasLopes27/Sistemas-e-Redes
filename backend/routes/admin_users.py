from flask import Blueprint, jsonify
from db import get_connection
from auth_utils import token_required

admin_bp = Blueprint("admin", __name__, url_prefix="/api/admin")


@admin_bp.route("/users", methods=["GET"])
@token_required
def list_users(user):
    # só admin (usertype == 0) pode aceder
    if user[3] != 0:
        return jsonify({"error": "Acesso negado"}), 403

    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT id, name, email, usertype FROM users")
    rows = cur.fetchall()
    cur.close()
    conn.close()

    users = [{"id": u[0], "name": u[1], "email": u[2], "usertype": u[3]} for u in rows]
    return jsonify(users), 200
