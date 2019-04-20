sudo apt install htop vim sshfs apache2 php wget docker-compose git 
sudo a2enmod proxy_http
sudo rm /var/www/html/index.html 
sudo cp ./configs/apache2/index.html /var/www/index.html 
sudo systemctl restart apache2

mkdir repositories  
cd    repositories 

git clone https://github.com/datasci4health/case-notebook
cd  case-notebook
sudo docker-compose up -d
cd ..

git clone https://github.com/datasci4health/harena-logger
cd  harena-logger
sudo docker-compose up -d
cd ..


cd ..

