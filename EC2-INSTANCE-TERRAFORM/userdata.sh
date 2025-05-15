#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Welcome to AWS..<h2>from $(hostname -f)</h2></h1>" > /var/www/html/index.html
sudo mkdir -p /var/www/html/app1
sudo tee /var/www/html/app1/index.html << 'EOF'
<!DOCKTYPE html>
<html>
<body style="background-color:rgb(251, 210, 210);">
<h1>Welcome to Terraform with AWS</h1>
<p>Terraform Demo</p>
<p>Application Version: V2</p>
</body>
</html>
EOF
# From official AWS Document to get instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
sudo curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document | sudo tee /var/www/html/app1/metadata.html

# for output
/* on the browser: <ec2-publicip> or <ec2-publicip>/app1/  or <ec2-publicip>/app1/metadata.html