
# 🛠 WooCommerce Development Environment Setup Guide (MacOS + Docker)

This guide helps you set up a local WooCommerce development environment using **Docker** on macOS. It checks for required tools, installs them if missing, and spins up a full WordPress + WooCommerce site automatically.

---

## ✅ 1. Environment Checks and Setup

### 🔍 Homebrew Check & Install (Mac only)

```bash
if ! command -v brew &> /dev/null
then
    echo "🍺 Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is already installed."
fi
```

---

### 🐳 Docker Check & Install

```bash
if ! command -v docker &> /dev/null
then
    echo "🐳 Docker not found. Installing Docker Desktop..."
    brew install --cask docker
    echo "🚀 Starting Docker Desktop..."
    open --background -a Docker
else
    echo "✅ Docker is already installed."
    open --background -a Docker
fi
```

---

### ⏳ Wait Until Docker is Ready

```bash
echo "🕒 Waiting for Docker to be ready..."
while ! docker info &> /dev/null; do
  sleep 2
done
echo "🐳 Docker is running!"
```

---

## 🏗️ 2. WordPress + WooCommerce via Docker Compose

### 📦 Create Project Folder

```bash
mkdir woopress && cd woopress
```

---

### 📝 Create `docker-compose.yml`

```yaml
version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    ports:
      - "8000:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: root
      WORDPRESS_DB_NAME: wp_db
    volumes:
      - ./wp-data:/var/www/html

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_DATABASE: wp_db
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

---

### ▶️ Start Docker Containers

```bash
docker compose up -d
```

---

## 🔌 3. Install Plugins Using WP-CLI

### 🧰 Install WP-CLI in WordPress Container

```bash
docker exec -it woopress-wordpress-1 bash -c "curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp"
```

---

### 📦 Install Required Plugins (Example: WooCommerce + Basic Auth)

```bash
docker exec -it woopress-wordpress-1 bash -c "
  wp plugin install woocommerce --activate &&
  wp plugin install https://github.com/WP-API/Basic-Auth/archive/refs/heads/master.zip --activate
"
```

---

## 🧩 4. Define `config.json` for API Access

To streamline API usage (in Postman, frontend apps, etc.), create a `config.json` file in your project.

### 🗂️ `config.json` Structure

```json
{
  "woocommerce": {
    "storeUrl": "http://localhost:8000",
    "username": "admin",
    "password": "application-password-or-user-password",
    "apiVersion": "v3"
  }
}
```

### 📌 Field Descriptions

| Field        | Description |
|--------------|-------------|
| `storeUrl`   | WordPress root URL (e.g., `http://localhost:8000`) |
| `username`   | WordPress user with API access (e.g., `admin`) |
| `password`   | Application password or regular user password (used with Basic Auth plugin) |
| `apiVersion` | WooCommerce REST API version to use (commonly `v3`) |

---

### 🔐 Example API Client Usage (JavaScript)

```js
const config = require('./config.json');
const base64Auth = Buffer.from(`${config.woocommerce.username}:${config.woocommerce.password}`).toString('base64');

fetch(`${config.woocommerce.storeUrl}/wp-json/wc/${config.woocommerce.apiVersion}/products`, {
  headers: {
    'Authorization': `Basic ${base64Auth}`
  }
});
```

> ⚠️ **Security Tip:** Do not commit `config.json` to public repos. Use `.gitignore` or environment variables in production environments.

---

## ✅ Setup Complete

- Visit WordPress: [http://localhost:8000](http://localhost:8000)
- Follow the installation wizard.
- WooCommerce and required plugins are pre-installed.
- Your API clients can now authenticate using `config.json`.


