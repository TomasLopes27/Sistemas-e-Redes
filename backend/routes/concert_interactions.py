from flask import Blueprint, request, jsonify
from db import get_connection
from auth_utils import token_required

interaction_bp = Blueprint("interaction", __name__, url_prefix="/api/concerts")


# ➕ POST /api/concerts/<id>/like - Like/Unlike (toggle)
@interaction_bp.route("/<int:concert_id>/like", methods=["POST"])
@token_required
def toggle_like(user, concert_id):
    user_id = get_user_id(user)
    print(user_id)

    try:
        conn = get_connection()
        cur = conn.cursor()

        # Verifica se já existe like
        cur.execute("SELECT 1 FROM likes WHERE user_id = %s AND concert_id = %s", (user_id, concert_id))
        exists = cur.fetchone()

        if exists:
            cur.execute("DELETE FROM likes WHERE user_id = %s AND concert_id = %s", (user_id, concert_id))
            message = "Like removido"
        else:
            cur.execute("INSERT INTO likes (user_id, concert_id) VALUES (%s, %s)", (user_id, concert_id))
            message = "Like adicionado"

        conn.commit()
        cur.close()
        conn.close()

        return jsonify({"message": message}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# 🔢 GET /api/concerts/<id>/likes - Número de likes
@interaction_bp.route("/<int:concert_id>/likes", methods=["GET"])
def get_likes(concert_id):
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT COUNT(*) FROM likes WHERE concert_id = %s", (concert_id,))
        count = cur.fetchone()[0]
        cur.close()
        conn.close()

        return jsonify({"likes": count}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# 💬 POST /api/concerts/<id>/comment - Adicionar comentário
@interaction_bp.route("/<int:concert_id>/comment", methods=["POST"])
@token_required
def add_comment(user, concert_id):
    user_id = get_user_id(user)
    data = request.get_json()
    content = data.get("content", "").strip()

    if not content:
        return jsonify({"error": "Comentário vazio"}), 400

    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("""
            INSERT INTO comments (user_id, concert_id, content)
            VALUES (%s, %s, %s)
        """, (user_id, concert_id, content))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Comentário adicionado"}), 201

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# 📃 GET /api/concerts/<id>/comments - Listar comentários
@interaction_bp.route("/<int:concert_id>/comments", methods=["GET"])
def get_comments(concert_id):
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("""
            SELECT u.name, c.content, c.created_at
            FROM comments c
            JOIN users u ON c.user_id = u.id
            WHERE concert_id = %s
            ORDER BY c.created_at DESC
        """, (concert_id,))
        results = cur.fetchall()
        cur.close()
        conn.close()

        comments = [{
            "user": row[0],
            "content": row[1],
            "timestamp": row[2]
        } for row in results]

        return jsonify(comments), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# Função utilitária para extrair o ID do utilizador
def get_user_id(user_tuple):
    return user_tuple[0]  # id do utilizador
