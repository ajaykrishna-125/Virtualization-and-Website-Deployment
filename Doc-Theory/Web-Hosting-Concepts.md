# Web Hosting Concepts

## 🌐 What is Web Hosting?
Web hosting is a service that allows individuals and organizations to publish websites on the internet. A web server stores website files and serves them to users when they visit a domain name.

## 🏢 Types of Web Hosting

### 1️⃣ Shared Hosting
- Multiple websites share the same server resources (CPU, RAM, bandwidth).
- Cost-effective but limited performance.
- Suitable for small personal websites or blogs.

### 2️⃣ Virtual Private Server (VPS)
- A single physical server is divided into multiple virtual instances.
- Provides dedicated resources, better performance, and control.
- Suitable for medium-sized businesses or growing websites.

### 3️⃣ Dedicated Hosting
- A single server is dedicated to one user or business.
- High performance, full control, and maximum security.
- Suitable for large enterprises and high-traffic websites.

### 4️⃣ Cloud Hosting
- Websites are hosted across multiple virtual servers.
- Provides scalability, reliability, and pay-as-you-use pricing.
- Suitable for startups, e-commerce, and rapidly growing businesses.

---

## 🔥 Apache vs Nginx - Choosing a Web Server

| Feature       | Apache HTTP Server | Nginx |
|--------------|-------------------|-------|
| Process Model | Process-driven (each request spawns a process) | Event-driven (efficient request handling) |
| Performance  | Slower under high load | High performance under heavy traffic |
| .htaccess Support | Yes (allows per-directory config) | No (centralized config) |
| Best For     | Dynamic applications | Static content & high-concurrency |

- **Apache** is best for applications requiring `.htaccess` (like WordPress).
- **Nginx** is better for handling high traffic with low memory usage.

---

## 🛠️ LAMP Stack - The Foundation of Web Hosting

LAMP is a popular open-source software stack for hosting websites.

### 🏗️ Components:
1. **Linux** - The operating system (Ubuntu, CentOS).
2. **Apache** - The web server that serves website files.
3. **MySQL** - The database for storing dynamic website data.
4. **PHP** - The scripting language for processing backend logic.

### 🔧 How LAMP Works
1. **User requests a webpage** → Sent to **Apache**.
2. **Apache processes request** → Passes to **PHP**.
3. **PHP interacts with MySQL** → Fetches or modifies data.
4. **Apache serves processed output** → User sees the webpage.

---

## 📌 Web Hosting in This Project

### 🏗️ **Mini-Finance Website Deployment (Apache + CentOS)**
- Apache serves a **static website** using HTML and CSS.
- `httpd` is used for handling HTTP requests.
- Website files are placed inside `/var/www/html/`.
- Firewall rules are updated to allow HTTP traffic.
- Vagrant automates Apache installation and site setup.

### 🌍 **WordPress Deployment (Apache + LAMP on Ubuntu)**
- Apache runs a **dynamic website** using PHP and MySQL.
- WordPress files are placed inside `/srv/www/wordpress/`.
- Database is configured in `wp-config.php`.
- Apache’s virtual host file is modified to point to WordPress.
- Vagrant automates the LAMP stack setup and WordPress installation.

---

## 🔒 Security Considerations in Web Hosting

- **Use HTTPS (SSL/TLS)** to encrypt website traffic.
- **Firewall Rules** to restrict unauthorized access.
- **Disable Unnecessary Modules** to reduce attack surface.
- **Regular Updates** for Apache, MySQL, PHP to patch vulnerabilities.
- **Permissions & Ownership** (`chown`, `chmod`) for securing files.

---

## 📜 Conclusion

Understanding web hosting is crucial for deploying scalable and secure applications. This project demonstrates:
- Setting up **static** and **dynamic** websites using Apache.
- Managing **virtual hosts, firewall rules, and permissions**.
- Automating deployments using **Vagrant and scripting**.

With these concepts, we can confidently deploy and manage websites on different hosting environments!

