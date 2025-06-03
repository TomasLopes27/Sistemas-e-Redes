import pytest
from flask import Flask
from routes.auth_routes import auth_bp


@pytest.fixture
def client():
    app = Flask(__name__)
    app.config["SECRET_KEY"] = "test_secret"
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
