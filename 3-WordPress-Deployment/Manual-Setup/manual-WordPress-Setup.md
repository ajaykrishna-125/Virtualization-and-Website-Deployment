# Manual WordPress Setup on Ubuntu

## Prerequisites
- Ubuntu Server (VM created using Vagrant).
- Internet connection.

## Steps

### 1. Install Dependencies
```bash
sudo apt update
sudo apt install apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip
```

### 2. Install WordPress
We will use the release from WordPress.org rather than the APT package in the Ubuntu Archive, as it is the preferred method.
```bash
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
```

### 3. Configure Apache
Create `/etc/apache2/sites-available/wordpress.conf`:
```
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>

    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
```

Enable the WordPress site and configure Apache:
```bash
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default
sudo service apache2 reload
```

### 4. Configure MySQL Database
Start the MySQL service:
```bash
sudo service mysql start
```

Log into MySQL and create the database:
```bash
sudo mysql -u root -p
```
Run the following MySQL commands:
```sql
CREATE DATABASE wordpress;
CREATE USER wordpress@localhost IDENTIFIED BY 'your-password';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;
FLUSH PRIVILEGES;
EXIT;
```

### 5. Configure WordPress
Copy the sample configuration file:
```bash
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
```

Update the database credentials in `wp-config.php`:
```bash
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/your-password/' /srv/www/wordpress/wp-config.php
```

Secure the WordPress installation by generating unique keys:
```bash
curl -s https://api.wordpress.org/secret-key/1.1/salt/
```
Replace the keys in `wp-config.php` manually or use the following command:
```bash
sudo -u www-data nano /srv/www/wordpress/wp-config.php
```
Remove the placeholder keys and paste the generated values.

### 6. Complete WordPress Setup
Open `http://localhost/` in a browser. You will be prompted to:
- Set the site title
- Create an admin username and password
- Provide an email address
- Decide whether to allow search engines to index the site

After completing these steps, you can log in to your WordPress site at `http://localhost/wp-login.php`.

### 7. Final Cleanup (Optional)
If you no longer need the setup, you can remove the VM:
```bash
vagrant destroy
```