# appsmith-deploy

This repo contains the code to deploy appsmith to a Linux instance via different methods. Primarily to be used for on-premise deployments at customer locations.

## Install Ansible

For Mac OSX:
```
brew install ansible
```

Installation via Pip
```
pip3 install ansible
```

### Run the command

The file `selfhosted.yml` controls the configuration of self-hosted servers. In order to execute it against a particular server run the command:

```
ansible-playbook --private-key ~/.ssh/appsmith.pem -v -e "{target: 1.2.3.4}" -i 1.2.3.4, selfhosted.yml
```

Replace `1.2.3.4` with the valid server's IP. The assumption is that these are all Ubuntu 18.04 servers hosted in AWS. 