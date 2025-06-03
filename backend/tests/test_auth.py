import os
import pytest
from flask import Flask
from routes.auth_routes import auth_bp
from unittest.mock import patch, MagicMock
import bcrypt

@pytest.fixture
def client():
    app = Flask(__name__)
    app.config["SECRET_KEY"] = os.getenv("TEST_SECRET_KEY", "default_secret")
    app.register_blueprint(auth_bp)
    with app.test_client() as client:
        yield client

def test_register_user(client, mocker):
    # Mock da base de dados
    mock_conn = mocker.patch("routes.auth_routes.get_connection")
    mock_cursor = mocker.MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchone.return_value = None  # Não há usuário com esse email

    response = client.post("/api/register", json={
        "name": "Teste",
        "email": "teste@teste.com",
        "password": "123456"
    })

    assert response.status_code == 201
    assert b"Utilizador registado com sucesso" in response.data


def test_login_user(client):
    # Mock da base de dados
    with patch("routes.auth_routes.get_connection") as mock_conn:
        mock_cursor = MagicMock()
        mock_conn.return_value.cursor.return_value = mock_cursor

        # Simula um utilizador com id 1, password hash e usertype 1
        hashed_password = bcrypt.hashpw("123456".encode(), bcrypt.gensalt()).decode()
        mock_cursor.fetchone.return_value = (1, hashed_password, 1)

        # Envia o pedido de login
        response = client.post("/api/login", json={
            "email": "teste@teste.com",
            "password": "123456"
        })

        assert response.status_code == 200
        data = response.get_json()
        assert "token" in data