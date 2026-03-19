# IaC - Infraestrutura como Código

Projeto que provisiona uma instância EC2 na AWS com **Terraform** e configura o ambiente com **Ansible**.

---

## Pré-requisitos

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.2.0
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
- AWS CLI configurado (`aws configure`)
- Chave SSH `terraform-wsl` criada na AWS e disponível localmente

---

## Terraform

### Inicializar o projeto
```bash
terraform init
```

### Visualizar o plano de execução
```bash
terraform plan
```

### Aplicar a infraestrutura
```bash
terraform apply
```

### Aplicar sem confirmação manual
```bash
terraform apply -auto-approve
```

### Destruir a infraestrutura
```bash
terraform destroy -auto-approve
```

### Ver os outputs (ex: IP da instância)
```bash
terraform output
```

---

## Ansible

> Antes de rodar, atualize o IP da instância no arquivo `hosts.yml`.

### Testar conexão com os hosts
```bash
ansible -i hosts.yml terraform-ansible -m ping --private-key terraform-wsl.pem -u ubuntu
```

### Rodar o playbook
```bash
ansible-playbook -i hosts.yml playbook.yml --private-key terraform-wsl.pem -u ubuntu
```

### Rodar com verbose (debug)
```bash
ansible-playbook -i hosts.yml playbook.yml --private-key terraform-wsl.pem -u ubuntu -v
```

---

## Fluxo completo

```bash
# 1. Provisionar a infraestrutura
terraform init
terraform apply -auto-approve

# 2. Copiar o IP gerado para o hosts.yml
# Editar hosts.yml com o IP da instância criada

# 3. Configurar o servidor com Ansible
ansible-playbook -i hosts.yml playbook.yml --private-key terraform-wsl.pem -u ubuntu
```
