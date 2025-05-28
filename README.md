# TinyConcerts

TinyConcerts é uma plataforma web onde os utilizadores podem explorar e interagir com concertos no estilo Tiny Desk. A aplicação suporta login, registo, likes, favoritos, comentários e painel de administração.

---

## 🚀 Tecnologias Utilizadas

* **Frontend**: Angular 17
* **Backend**: Flask
* **Base de Dados**: PostgreSQL
* **Deploy**: Render
* **Autenticação**: JWT

---

## 🛆 Funcionalidades

* Registo e Login com autenticação JWT
* Role-Based Access Control (Admin e Utilizador)
* Listar e detalhes de concertos
* Likes, favoritos e comentários por utilizador
* Painel de administração para gerir concertos
* Segurança com hashing de palavras-passe (bcrypt)
* Comunicação segura via HTTPS (no Render)

---

## 🛠️ Instalação Local

### 1. Clonar o repositório

```bash
git clone https://github.com/teu-utilizador/tinyconcerts.git
cd tinyconcerts
```

### 2. Instalar dependências

**Backend:**

```bash
cd backend
pip install -r requirements.txt
```

**Frontend:**

```bash
cd frontend
npm install
```

### 3. Correr localmente

**Backend:**

```bash
python run.py
```

**Frontend:**

```bash
# Build antes de correr com Express
ng build
npm start
```


## 🌐 Deploy no Render

**Backend:**

* Serviço web com `run.py` como entry point
* Variável de ambiente `DATABASE_URL` configurada

**Frontend:**

* `ng build --configuration production`
* `npm start` 

---

## 🧪 Segurança

* Hashing de passwords com bcrypt
* Tokens JWT para autenticação
* CORS controlado no backend
* RBAC para controlo de permissões

---

## 👩‍💼 Autores

Tomás Oliveira

Miguel Ferreira

