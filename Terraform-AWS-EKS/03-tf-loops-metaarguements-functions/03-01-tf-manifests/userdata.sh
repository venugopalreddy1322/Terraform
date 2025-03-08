#!/bin/bash
sudo yum update -y
sudo yum install -y httpd jq
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Welcome to AWS..<h2>from $(hostname -f)</h2></h1>" > /var/www/html/index.html
sudo mkdir -p /var/www/html/app1
sudo tee /var/www/html/app1/index.html << 'EOF'
<!DOCKTYPE html>
<html>
<body style="background-color:rgb(255, 220, 220);">
<h1>Welcome to Terraform with AWS</h1>
<p>Terraform Demo</p>
<p>Application Version: V3</p>
</body>
</html>
EOF
# From official AWS Document to get instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
sudo curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
