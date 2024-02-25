# Deploy Airflow Server with Terraform, Ansible

## Description

This code  deploys VM in Digital Ocean provider, and setups Airflow Server with generating keys and config. It takes ~5-7 min to deploy Airflow Server.


## Requrements:
  - Terraform >=1.0.4
  - Ansible core >= 2.0
  - Poetry


# How to
### Using GitActions
1. **Deploy flow:**
```
  choose:
    - branch
    - environment
    - size of droplet
    - region
    - etc
```

2. **Destroy flow:**
```
  choose:
    - branch
    - environment
    - type 'confirm'
```

3. **Ansible flow:**
```
  choose:
    - branch
    - environment
    - type Ansible tags if it's needed, e.g. docker
    - check checkbox for applying changes, uncheck to run in dry-run
    - type 'confirm'

List of tags:
  - update_system > Updating OS
  - install_docker > Install docker software
  - airflow_deps > insatll airflow dependencies, create users, template DAGs, seeding db
  - render_compose > render compose file
  - deploy_stack > rund docker compose
```

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
   terraform plan
  ```
1. Apply configuration
  ```
 terraform apply
  ```

## Terraform Variables

region:
- usa=nyc1 (New York)
- eu=fra1 (Frankfurt)
- ln=lon1 (London)

image:
- ubuntu=ubuntu-22-10-x64
- rocky=rockylinux-9-x64

## GitHub Actions Secrets:
  - AIRFLOW_WWW_PASS: airflow user pass **[replaced by inputs]**
  - AIRFLOW_WWW_USER: airflow user pass **[replaced by inputs]**
  - CONN_TYPE: connetction type for db postgres/mysql **[replaced by inputs]**
  - DB_NAME: database name **[replaced by inputs]**
  - DB_PASS: database pass **[replaced by inputs]**
  - DB_USER: database username **[replaced by inputs]**
  - DOCKER_PASSWORD: docker password/token for pull/push containers
  - DOCKER_USERNAME: docker username
  - DO_S3_ID: digital ocena S3 bucket access key
  - DO_S3_KEY: digital ocena S3 bucket secret key
  - DO_TOKEN: digital ocean account token
  - WORK_DB_HOST: external db hostname, if you need to connect airflow to the external DB
  - WORK_DB_USER: external db user
  - WORK_DB_PASS: external db pass
  - WORK_DB_PORT: external db port
  - WORK_DB_SCHEMA: external db schema name






## License
GNU GPL v3
