Terraform utilizado para criar e gerenciar a infraestrutura da aws. 

Os recursos utilizados neste projeto são uma EC2, VPC e um bucket s3 cada um implementado pelo próprio módulo.


- O primeiro arquivo gerado foi terraform.tf através dele é possível realizar a configuração inicial do terraform onde é possível realizar
  instalação das versões que o usuário deseja e auxilia para manutenções futuras necessárias.
  - A versão utilizada é a 5.92 utilizando o serviço hashicorp/aws. Ambos estão descritos dentro do módulo principal chamado require_providers.


Projeto Terraform – Infraestrutura AWS com Módulos (EC2, VPC, S3)
 

Este projeto provisiona uma infraestrutura básica na AWS utilizando Terraform com arquitetura modular.
O objetivo é demonstrar boas práticas de IaC (Infrastructure as Code), incluindo separação de responsabilidades por módulos, versionamento, variáveis e outputs.

A infraestrutura contém:

Módulo VPC: Criação de VPC, subnets, internet gateway e rota pública.

Módulo EC2: Provisionamento de uma instância EC2 utilizando uma AMI parametrizada e grupo de segurança.

Módulo S3: Criação de um bucket S3 com configurações de versionamento e tags.


# Recursos Criados
- VPC

VPC com CIDR configurável

Subnet pública

Internet Gateway

Rota default para acesso à internet

- EC2

Instância EC2

Security Group com regras básicas (ex: SSH ou HTTP)

Definição de tipo de instância e AMI via variáveis

- S3

Bucket S3 com nome configurável

Versionamento ativado (opcional)

Tags aplicadas

🛠️ Pré-requisitos

Terraform ≥ 1.5

Conta AWS configurada

AWS CLI instalado

Credenciais exportadas ou configuradas no ~/.aws/credentials:

aws configure

# Como Usar o Projeto
- Inicializar o Terraform
terraform init

- Validar os arquivos
terraform validate

- Visualizar o plano de execução
terraform plan

- Aplicar a infraestrutura
terraform apply

- Remover a infraestrutura
terraform destroy

# Variáveis Principais

Variável	Tipo	Descrição	Exemplo
aws_region	string	Região AWS onde os recursos serão criados	"us-east-1"
instance_type	string	Tipo da instância EC2	"t3.micro"
vpc_cidr	string	CIDR da VPC	"10.0.0.0/16"
bucket_name	string	Nome do bucket S3	"tf-projeto-bucket"



# Outputs
Output	Descrição
Private DNS name of the EC2 instance.
aws_instance.app_server.private_dns
s3_account_public_access_block_id





# Boas Práticas Utilizadas
Organização modular

Uso de variáveis e outputs tipados

Tags em todos os recursos

Separação entre configuração e provisionamento

Readme detalhado seguindo padrão profissional

# Possíveis Extensões Futuras

Adicionar módulo de RDS

Criar módulo de Load Balancer (ALB)

Implementar remote backend (S3 + DynamoDB)

Pipeline CI/CD com GitHub Actions
