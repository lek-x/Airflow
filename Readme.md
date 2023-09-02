# Deploy Airflow Server with Terraform, Ansible

## Description

This code  deploys VM in Digital Ocean provider, and setups Airflow Server with generating keys and config. It takes ~5 min to deploy Airflow Server.


## Requrements:
  - Terraform >=1.0.4
  - Ansible core >= 2.0
  - Poetry


# How to
### Using make




1. Create env
```
make env
```

2. Init  terraform modules
```
make init
```

3. Plan infrasrtucture

```
make plan
```

4. Deploy infrastructure without any confirmations
```
make apply
```

5. Export private ssh key (name my_ssh.key)
```
make key
```

6. Destroy infrastructure. Without any confirmations
```
make destroy
```

### Using terraform
1. Clone repo
2. Add your Digital Ocean token to **terraform.tfvars.example**, amd rename it to **terraform.tfvars**
3. Init terraform providers
  ```
 terraform init
  ```
1. Plan your infrastructure
  ```
   terraform plan -var region=eu -var image=rocky
  ```
1. Apply configuration
  ```
 terraform apply -var region=eu -var image=rocky
  ```
1. Ansible playbook runs automatically,  **wg_peer.conf** file will be saved in current directory. Use this file in your wiregurag client.


## Variables

region: usa=nyc1 (New York), eu=fra1 (Frankfurt), ln=lon1 (London)
image: ubuntu=ubuntu-22-10-x64, rocky=rockylinux-9-x64




## License
GNU GPL v3
