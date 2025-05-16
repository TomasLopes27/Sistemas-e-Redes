from flask import Blueprint, request, jsonify
from db import get_connection
from auth_utils import token_required

concert_bp = Blueprint("concert", __name__, url_prefix="/api/concerts")


# 🔍 GET /api/concerts - listar todos
@concert_bp.route("/", methods=["GET"])
def list_concerts():
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT id, title, artist, genre, release_date, url FROM concerts")
        concerts = cur.fetchall()
        cur.close()
        conn.close()

        concerts_list = [
            {
                "id": c[0],
                "title": c[1],
                "artist": c[2],
                "genre": c[3],
                "release_date": c[4],
                "url": c[5]
            } for c in concerts
        ]
        return jsonify(concerts_list), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ➕ POST /api/concerts - criar (admin only)
@concert_bp.route("/", methods=["POST"])
@token_required
def create_concert(user):
    if not user or user[0] != "admin":  # ajusta para o teu caso (0 para admin)
        return jsonify({"error": "Acesso negado"}), 403

    data = request.get_json()
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("""
            INSERT INTO concerts (title, url, artist, genre, release_date)
            VALUES (%s, %s, %s, %s, %s)
        """, (data["title"], data["url"], data["artist"], data["genre"], data["release_date"]))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Concerto criado com sucesso"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# 🆔 GET /api/concerts/<id> - detalhe
@concert_bp.route("/<int:concert_id>", methods=["GET"])
def get_concert(concert_id):
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT id, title, artist, genre, release_date, url FROM concerts WHERE id = %s", (concert_id,))
        c = cur.fetchone()
        cur.close()
        conn.close()

        if not c:
            return jsonify({"error": "Concerto não encontrado"}), 404

        return jsonify({
            "id": c[0],
            "title": c[1],
            "artist": c[2],
            "genre": c[3],
            "release_date": c[4],
            "url": c[5]
        }), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ✏️ PUT /api/concerts/<id> - editar (admin only)
@concert_bp.route("/<int:concert_id>", methods=["PUT"])
@token_required
def update_concert(user, concert_id):
    if not user or user[0] != "admin":
        return jsonify({"error": "Acesso negado"}), 403

    data = request.get_json()
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("""
            UPDATE concerts
            SET title = %s, url = %s, artist = %s, genre = %s, release_date = %s
            WHERE id = %s
        """, (data["title"], data["url"], data["artist"], data["genre"], data["release_date"], concert_id))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Concerto atualizado"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ❌ DELETE /api/concerts/<id> - apagar (admin only)
@concert_bp.route("/<int:concert_id>", methods=["DELETE"])
@token_required
def delete_concert(user, concert_id):
    if not user or user[0] != "admin":
        return jsonify({"error": "Acesso negado"}), 403

    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("DELETE FROM concerts WHERE id = %s", (concert_id,))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Concerto apagado"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
