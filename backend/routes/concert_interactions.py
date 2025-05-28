from flask import Blueprint, request, jsonify
from db import get_connection
from auth_utils import token_required

interaction_bp = Blueprint("interaction", __name__, url_prefix="/api/concerts")


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


# 📃 GET /api/concerts/<id>/comments - Listar comentários
@interaction_bp.route("/<int:concert_id>/comments", methods=["GET"])
def get_comments(concert_id):
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute(
            """
            SELECT u.name, c.content, c.created_at
            FROM comments c
            JOIN users u ON c.user_id = u.id
            WHERE concert_id = %s
            ORDER BY c.created_at DESC
        """,
            (concert_id,),
        )
        results = cur.fetchall()
        cur.close()
        conn.close()

        comments = [
            {"user": row[0], "content": row[1], "timestamp": row[2]} for row in results
        ]

        return jsonify(comments), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

    # 🔢 GET /api/users/favorites - lista favoritos do user


@interaction_bp.route("/users/favorites", methods=["GET"])
@token_required
def list_favorites(user):
    user_id = get_user_id(user)
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        """
      SELECT c.id, c.title, c.artist, c.release_date, c.url
      FROM favorites f
      JOIN concerts c ON f.concert_id = c.id
      WHERE f.user_id = %s
    """,
        (user_id,),
    )
    favs = [
        dict(zip(("id", "title", "artist", "release_date", "url"), row))
        for row in cur.fetchall()
    ]
    cur.close()
    conn.close()
    return jsonify(favs), 200


# 🔢 GET /api/users/likes - lista likes do user
@interaction_bp.route("/users/likes", methods=["GET"])
@token_required
def list_likes(user):
    user_id = get_user_id(user)
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        """
      SELECT c.id, c.title, c.artist, c.release_date, c.url, c.image_url
      FROM likes l
      JOIN concerts c ON l.concert_id = c.id
      WHERE l.user_id = %s
    """,
        (user_id,),
    )
    likes = [
        dict(zip(("id", "title", "artist", "release_date", "url", "image_url"), row))
        for row in cur.fetchall()
    ]
    cur.close()
    conn.close()
    return jsonify(likes), 200


# 🗂️ GET /api/concerts/<id>/reports - (admin only) listar reports
@interaction_bp.route("/<int:concert_id>/reports", methods=["GET"])
@token_required
def list_reports(user, concert_id):
    # user[3] é o campo 'usertype'
    if user[3] != 0:
        return jsonify({"error": "Acesso negado: só admin"}), 403

    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        """
      SELECT r.id, u.name, r.issue_type, r.description, r.created_at
      FROM reports r
      LEFT JOIN users u ON r.user_id = u.id
      WHERE r.concert_id=%s
      ORDER BY r.created_at DESC
    """,
        (concert_id,),
    )
    rows = cur.fetchall()
    cur.close()
    conn.close()

    reports = [
        {
            "id": r[0],
            "user": r[1],
            "issue_type": r[2],
            "description": r[3],
            "created_at": r[4],
        }
        for r in rows
    ]

    return jsonify(reports), 200


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
        cur.execute(
            "SELECT 1 FROM likes WHERE user_id = %s AND concert_id = %s",
            (user_id, concert_id),
        )
        exists = cur.fetchone()

        if exists:
            cur.execute(
                "DELETE FROM likes WHERE user_id = %s AND concert_id = %s",
                (user_id, concert_id),
            )
            message = "Like removido"
        else:
            cur.execute(
                "INSERT INTO likes (user_id, concert_id) VALUES (%s, %s)",
                (user_id, concert_id),
            )
            message = "Like adicionado"

        conn.commit()
        cur.close()
        conn.close()

        return jsonify({"message": message}), 200

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
        cur.execute(
            """
            INSERT INTO comments (user_id, concert_id, content)
            VALUES (%s, %s, %s)
        """,
            (user_id, concert_id, content),
        )
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Comentário adicionado"}), 201

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ➕ POST /api/concerts/<id>/favorite - toggle favorito
@interaction_bp.route("/<int:concert_id>/favorite", methods=["POST"])
@token_required
def toggle_favorite(user, concert_id):
    user_id = get_user_id(user)
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        "SELECT 1 FROM favorites WHERE user_id=%s AND concert_id=%s",
        (user_id, concert_id),
    )
    if cur.fetchone():
        cur.execute(
            "DELETE FROM favorites WHERE user_id=%s AND concert_id=%s",
            (user_id, concert_id),
        )
        message = "Removido dos favoritos"
    else:
        cur.execute(
            "INSERT INTO favorites (user_id, concert_id) VALUES (%s,%s)",
            (user_id, concert_id),
        )
        message = "Adicionado aos favoritos"
    conn.commit()
    cur.close()
    conn.close()
    return jsonify({"message": message}), 200


# 🚩 POST /api/concerts/<id>/report - enviar reporte
@interaction_bp.route("/<int:concert_id>/report", methods=["POST"])
@token_required
def report_issue(user, concert_id):
    user_id = get_user_id(user)
    data = request.get_json()
    issue = data.get("issue_type")
    desc = data.get("description", "").strip()
    if not issue:
        return jsonify({"error": "Tipo de issue é obrigatório"}), 400

    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        """
      INSERT INTO reports (user_id, concert_id, issue_type, description)
      VALUES (%s,%s,%s,%s)
    """,
        (user_id, concert_id, issue, desc),
    )
    conn.commit()
    cur.close()
    conn.close()
    return jsonify({"message": "Report enviado. Obrigado pelo feedback!"}), 201


# Função utilitária para extrair o ID do utilizador
def get_user_id(user_tuple):
    return user_tuple[0]  # id do utilizador
