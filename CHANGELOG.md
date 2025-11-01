# 📋 Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [0.1.0] - 2024-11-01

### ✅ Adicionado

#### Funcionalidades
- ✅ CRUD completo de livros (Create, Read, Update, Delete)
- ✅ Busca de livros por ID, ISBN e palavra-chave
- ✅ Atualização de estoque
- ✅ Validação completa de dados de entrada
- ✅ Tratamento global de exceções
- ✅ DTOs para separação de camadas
- ✅ Auditoria automática (createdAt, updatedAt)

#### Segurança
- ✅ `.gitignore` completo e robusto
- ✅ Templates de configuração (`.example`)
- ✅ Suporte a variáveis de ambiente
- ✅ Documentação de segurança (SECURITY.md)
- ✅ Checklist pré-commit (PRE_COMMIT_CHECKLIST.md)
- ✅ `.gitattributes` para controle de line endings

#### Documentação
- ✅ README.md completo e profissional
- ✅ API_EXAMPLES.md com exemplos práticos
- ✅ QUICKSTART.md para início rápido
- ✅ SECURITY.md com guia de segurança
- ✅ CONTRIBUTING.md com padrões de código
- ✅ GITHUB_SETUP.md para configuração do repositório
- ✅ PRE_COMMIT_CHECKLIST.md para qualidade
- ✅ PROJECT_SUMMARY.md com resumo do projeto

#### Infraestrutura
- ✅ Docker Compose para PostgreSQL
- ✅ Configuração de ambiente de desenvolvimento
- ✅ Healthcheck para container PostgreSQL

### 🔒 Segurança

#### Melhorias de Segurança
- ✅ Remoção de senhas hardcoded
- ✅ Uso de variáveis de ambiente
- ✅ Templates sem credenciais reais
- ✅ `.gitignore` protege informações sensíveis
- ✅ Documentação sobre práticas seguras

#### Arquivos Protegidos
- ✅ `application.properties` (ignorado pelo Git)
- ✅ `application-*.properties` (exceto `.example`)
- ✅ `.env` e variações
- ✅ Arquivos de log
- ✅ Chaves e certificados

### 🏗️ Arquitetura

#### Estrutura de Pacotes
- ✅ `controller/` - REST Controllers
- ✅ `service/` - Business Logic
- ✅ `repository/` - Data Access
- ✅ `model/` - JPA Entities
- ✅ `dto/` - Data Transfer Objects
- ✅ `exception/` - Custom Exceptions
- ✅ `config/` - Configuration Classes

#### Padrões Implementados
- ✅ Arquitetura em camadas (Layered Architecture)
- ✅ DTOs para separação de responsabilidades
- ✅ Dependency Injection
- ✅ Transaction Management
- ✅ Exception Handling Global

### 📝 Código

#### Qualidade
- ✅ Clean Code principles aplicados
- ✅ Nomenclatura descritiva
- ✅ Funções pequenas e focadas
- ✅ Validações adequadas
- ✅ Comentários JavaDoc onde necessário

---

## Tipos de Mudanças

- `Adicionado` - para novas funcionalidades
- `Modificado` - para mudanças em funcionalidades existentes
- `Depreciado` - para funcionalidades que serão removidas
- `Removido` - para funcionalidades removidas
- `Corrigido` - para correções de bugs
- `Segurança` - para vulnerabilidades

---

**Nota:** Este projeto está em desenvolvimento ativo durante o desafio de 30 dias.

