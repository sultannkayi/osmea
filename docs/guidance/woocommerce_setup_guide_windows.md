
# 🛠 WooCommerce Development Environment Setup Guide (Windows + Docker)

This guide helps you set up a local WooCommerce development environment using **Docker** on Windows. It includes Docker setup, WordPress + WooCommerce containers, and API configuration using `config.json`.

---

## ✅ 1. Environment Checks and Setup

### 🐳 Install Docker Desktop for Windows

1. Download Docker Desktop: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
2. Run the installer and follow the instructions.
3. Enable **WSL 2** integration during installation.
4. Restart your computer if needed.
5. Open Docker Desktop and make sure it is **running**.

---

### ⏳ Verify Docker is Running

Open **PowerShell** and run:

```powershell
docker --version
docker info
```

If no errors are returned, Docker is working.

---

## 🏗️ 2. WordPress + WooCommerce via Docker Compose

### 📦 Create Project Folder

```powershell
mkdir woopress
cd woopress
```

---

### 📝 Create `docker-compose.yml`

Create a file named `docker-compose.yml` with the following content:

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

```powershell
docker compose up -d
```

---

## 🔌 3. Install Plugins Using WP-CLI

### 🧰 Install WP-CLI in WordPress Container

```powershell
docker exec -it woopress-wordpress-1 curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
docker exec -it woopress-wordpress-1 chmod +x wp-cli.phar
docker exec -it woopress-wordpress-1 mv wp-cli.phar /usr/local/bin/wp
```

---

### 📦 Install Required Plugins (WooCommerce + Basic Auth)

```powershell
docker exec -it woopress-wordpress-1 wp plugin install woocommerce --activate
docker exec -it woopress-wordpress-1 wp plugin install https://github.com/WP-API/Basic-Auth/archive/refs/heads/master.zip --activate
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
- Complete the installation wizard.
- Plugins will be pre-installed and ready to use.
- Your API clients can now authenticate using `config.json`.

