# Laboratorio Ansible en GCP con Terraform

Entorno de prácticas con una VPC custom y una subred en `us-central1`, reglas de firewall para SSH y máquinas virtuales Linux (**Debian**, **Ubuntu**, **Rocky Linux** y **RHEL**) gestionadas desde un nodo de control con Ansible.

## 1. Generar clave SSH en el nodo maestro

```bash
ssh-keygen -t ed25519 -f ~/.ssh/ansible_gcp_lab -C "ansible-master-gcp"

```

## 2. Desplegar la infraestructura con Terraform

```bash
terraform init
terraform apply -var="project_id=my-project-id"

```

## 3. Verificar conectividad con Ansible

```bash
ansible linux -i inventory.ini -m ping

```

## 4. Limpiar recursos

```bash
terraform destroy -var="project_id=my-project-id"

```