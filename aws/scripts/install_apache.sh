#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
cat > /var/www/html/index.html <<EOF
    Hola, Esto significa que el servidor se levanto usando Terraform, 
    admas que se obtuvo los datos de la bd mysql:

    host : ${db_address}
    port: ${db_port}

EOF

sudo service httpd start