#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Hello World from <h2> $(hostname -f)</h2></h1>" | sudo tee /var/www/html/index.html
sudo mkdir -p /var/www/html/app1
sudo tee /var/www/html/app1/index.html << 'EOF'
<!DOCTYPE html>
<html>
<body style="background-color:rgb(250, 210, 210);">
<h1>Welcome Terraform with AWS - APP-1</h1>
<p>Terraform Demo</p>
<p>Application Version: V1</p>
</body>
</html>
EOF
# From official AWS Document to get instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
sudo curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/ -o /var/www/html/app1/metadata.html