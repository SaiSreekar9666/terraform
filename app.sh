apt update -y
apt install nginx -y
rm -r /var/www/html/* 
git clone https://github.com/SaiSreekar9666/ecomm.git /var/www/html/