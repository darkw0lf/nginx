server {
listen 443 ssl http2;
server_name secure.example.com;

ssl_certificate /etc/ssl/example.com.crt;
ssl_certificate_key /etc/ssl/example.com.key;

ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers HIGH:!aNULL:!MD5;

root /var/www/secure;
index index.html;

location / { try_files $uri $uri/ =404; }
}

# Redirection HTTP → HTTPS
server {
listen 80;
server_name secure.example.com;
return 301 https://$host$request_uri;
}
