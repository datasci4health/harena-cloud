sudo apt install htop vim sshfs apache2 php wget docker-compose git 
sudo a2enmod proxy_http
sudo rm /var/www/html/index.html 
sudo cp ./configs/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo cp ./configs/apache2/index.html /var/www/index.html 
sudo apache2ctl configtest
sudo systemctl restart apache2

sudo apt install -y python-certbot-apache
sudo certbot --apache -d harena.ds4h.org
sudo certbot renew --dry-run


sudo docker-compose pull
sudo docker-compose up -d

sudo rm repositories -r
mkdir   repositories  
cd      repositories 

git clone https://github.com/datasci4health/harena-space
cd  harena-space
sudo docker-compose pull
sudo docker-compose -f docker-compose.yml -f ../../resources/docker/harena-space/docker-compose.yaml  up -d --build
cd ..


git clone https://github.com/datasci4health/harena-manager
cd  harena-manager
sudo docker-compose pull
sudo docker-compose up -d --build
sleep 20
sudo docker-compose exec harena-manager adonis migration:run --force 
sudo docker-compose exec harena-manager adonis seed          --force
cd ..


git clone https://github.com/datasci4health/harena-logger
cd  harena-logger
sudo docker-compose pull
sudo docker-compose up -d --build
cd .. 


cd ..

sudo systemctl restart apache2
sudo docker ps -a
