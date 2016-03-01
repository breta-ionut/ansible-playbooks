sudo rm -rf /setup-tmp
sudo cp -r /setup /setup-tmp
cd /setup-tmp
sudo chmod -x hosts
sudo ansible-playbook setup.yml