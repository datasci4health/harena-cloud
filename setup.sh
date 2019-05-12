sudo apt install htop vim sshfs apache2 php wget docker-compose git 
sudo a2enmod proxy_http
sudo rm /var/www/html/index.html 
sudo cp ./configs/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo cp ./configs/apache2/index.html /var/www/index.html 
sudo systemctl restart apache2

sudo docker-compose up -d

sudo rm repositories -r
mkdir   repositories  
cd      repositories 



git clone https://github.com/datasci4health/harena-space
cd  harena-space
sudo docker-compose -f docker-compose.yml -f ../../resources/docker/harena-space/docker-compose.yaml  up -d --build
cd ..


git clone https://github.com/datasci4health/harena-manager
cd  harena-manager
sudo docker-compose up -d --build
sudo docker-compose down
sudo docker-compose run harena-manager adonis migration:run --force 
sudo docker-compose run harena-manager adonis seed          --force
sudo docker-compose down
sudo docker-compose up -d 
cd ..


git clone https://github.com/datasci4health/harena-logger
cd  harena-logger
sudo docker-compose up -d --build
cd .. 


cd ..

