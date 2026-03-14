# MechCraft Infra DB Terraform

Repositorio dedicado ao provisionamento do banco gerenciado PostgreSQL.

## Recursos provisionados

- Azure Database for PostgreSQL Flexible Server
- Database `mechcraft`
- Configuracao de timezone em UTC

## Tecnologias

- Terraform
- Azure PostgreSQL Flexible Server
- GitHub Actions

## Estrutura

- `terraform/`: codigo Terraform
- `.github/workflows/terraform.yml`: validacao e deploy
- `docs/ARCHITECTURE.md`: diagrama do repositorio

## Arquitetura

- [Diagrama da infraestrutura de banco](docs/ARCHITECTURE.md)

## Execucao local

```powershell
cd terraform
terraform init
terraform plan -var-file="terraform.tfvars"
```

Use [`terraform/terraform.tfvars.example`](terraform/terraform.tfvars.example) como base.

## CI/CD

- PR em `homolog` e `main`: `fmt`, `init -backend=false` e `validate`
- Push em `homolog`: `plan` + `apply`
- Push em `main`: `plan` + `apply`

## Ordem de provisionamento

Este repositorio usa o Resource Group compartilhado `mechcraft-rg`. Portanto, o fluxo recomendado e:

1. Executar primeiro o repositorio `mechcraft-infra-k8s`
2. Executar depois o repositorio `mechcraft-infra-db`

Secrets esperados:

- `AZURE_CREDENTIALS`
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_TENANT_ID`
- `POSTGRES_ADMIN_PASSWORD`

## Swagger / Postman

Nao se aplica a este repositorio. O contrato da API que usa este banco fica no repositorio `mechcraft-app-k8s`.
