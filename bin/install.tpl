cat <<EOF
#!/bin/sh -e

repo=/opt/superdesk-deploy

apt-get update
apt-get -y install git

git clone --depth 1 https://github.com/naspeh-sf/deploy.git \$repo

cd \$repo; ./fire i -e $endpoint --services --prepopulate

echo "*********************************************************************************"
echo "Installation complete!"
echo "- Open in a bowser the address: http://\$(curl -s http://whatismyip.akamai.com/)/"
echo "- To login use default credentials:"
echo "    Login: admin"
echo "    Password: admin"
echo "*********************************************************************************"
EOF