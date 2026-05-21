Fichiers de configuration pour Nginx

Pour Créer un certificat et autoriser depuis l'extérieur :
openssl pkcs12 -export -in certificat.crt -inkey leeprivee.key -out certificat_converti.pfx

Et prendre la conf : https://github.com/darkw0lf/nginx/blob/master/site_ssl.conf
