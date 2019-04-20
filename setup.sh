sudo apt install htop vim sshfs apache2 php wget docker-compose git 
git clone https://github.com/datasci4health/case-notebook
git clone https://github.com/datasci4health/harena-logger
#sudo a2enmod proxy
sudo a2enmod proxy_http
#sudo a2enmod proxy_balancer
#sudo a2enmod lbmethod_byrequests
sudo systemctl restart apache2
sudo rm    /var/www/html/index.html 
sudo touch /var/www/html/index.html 
