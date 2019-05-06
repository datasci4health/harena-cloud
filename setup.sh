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
sudo docker-compose up -d
cd ..


git clone https://github.com/datasci4health/harena-manager
cd  harena-manager
sudo docker-compose up -d
cd ..


git clone https://github.com/datasci4health/case-notebook
cd  case-notebook
sudo docker-compose up -d
cd ..


git clone https://github.com/datasci4health/harena-logger
cd  harena-logger
sudo docker-compose up -d
cd ..


cd ..

