# Automated WordPress Setup using Vagrant

## Prerequisites
- Install **Vagrant** and **VirtualBox** on your system.

## Steps

### 1. Create `Vagrantfile`
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "private_network", type: "dhcp"

  config.vm.provision "shell", inline: <<-SHELL
    # Update system and install dependencies
    sudo apt update
    sudo apt install -y apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip

    # Ensure MySQL service is running
    sudo systemctl start mysql
    sudo systemctl enable mysql

    # Setup MySQL Database and User
    sudo mysql -u root -e "CREATE DATABASE wordpress;"
    sudo mysql -u root -e "CREATE USER wordpress@localhost IDENTIFIED BY 'your-password';"
    sudo mysql -u root -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;"
    sudo mysql -u root -e "FLUSH PRIVILEGES;"

    # Install WordPress
    sudo mkdir -p /srv/www
    sudo chown www-data: /srv/www
    curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

    # Configure Apache Virtual Host
    sudo bash -c 'cat > /etc/apache2/sites-available/wordpress.conf <<EOF
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
EOF'

    # Enable WordPress site and configure Apache
    sudo a2ensite wordpress
    sudo a2enmod rewrite
    sudo a2dissite 000-default
    sudo systemctl reload apache2

    # Configure WordPress database connection
    sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
    sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
    sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
    sudo -u www-data sed -i 's/password_here/your-password/' /srv/www/wordpress/wp-config.php

    # Secure WordPress by generating unique salts
    curl -s https://api.wordpress.org/secret-key/1.1/salt/ | sudo tee -a /srv/www/wordpress/wp-config.php

    # Adjust file permissions for WordPress
    sudo chown -R www-data:www-data /srv/www/wordpress
    sudo chmod -R 755 /srv/www/wordpress

    # Restart Apache to apply changes
    sudo systemctl restart apache2
  SHELL
end
```

### 2. Run Vagrant
```bash
vagrant up
```

### 3. Access WordPress
Open `http://localhost/` in a browser to complete the setup.

### 4. Final Cleanup (Optional)
If you no longer need the setup, remove the VM:
```bash
vagrant destroy
```