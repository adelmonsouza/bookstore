# 📤 Configuração do GitHub - BookStore API

Guia passo a passo para configurar o repositório no GitHub e fazer o primeiro push.

## 🎯 Objetivo

Subir o projeto BookStore API para o GitHub seguindo as melhores práticas.

## 📋 Pré-requisitos

- ✅ Conta no GitHub criada
- ✅ Git instalado no sistema
- ✅ SSH Key configurada (ou usar HTTPS)

## 🚀 Passo a Passo

### 1. Verificar Status do Git

```bash
# Verificar se já existe um repositório Git
git status
```

Se não existir, você verá: `fatal: not a git repository`

### 2. Inicializar o Repositório Git

```bash
# Navegar até a pasta do projeto
cd /Volumes/AdellServer/Projects/30days/BookStore-API

# Inicializar o repositório
git init

# Adicionar todos os arquivos
git add .

# Fazer o commit inicial
git commit -m "init: BookStore API project

- Java 17 + Spring Boot 3.5.7
- PostgreSQL 15 + Docker Compose
- RESTful API com CRUD completo
- Validação de dados e tratamento de exceções
- Arquitetura em camadas (Controller, Service, Repository)
- DTOs para separação de responsabilidades"
```

### 3. Criar Repositório no GitHub

1. Acesse [GitHub](https://github.com)
2. Clique em **"New repository"** (ou `+` → `New repository`)
3. Configure:
   - **Repository name:** `BookStore-API`
   - **Description:** `RESTful API for bookstore management - Java 17 + Spring Boot + PostgreSQL`
   - **Visibility:** `Public` (ou `Private` se preferir)
   - **⚠️ NÃO marque** "Add a README file" (já temos um)
   - **⚠️ NÃO marque** "Add .gitignore" (já temos um)
   - **⚠️ NÃO marque** "Choose a license" (pode adicionar depois)
4. Clique em **"Create repository"**

### 4. Conectar ao Repositório Remoto

**Opção A: Usando HTTPS**
```bash
# Copie a URL do repositório criado (exemplo)
git remote add origin https://github.com/seu-usuario/BookStore-API.git

# Verificar
git remote -v
```

**Opção B: Usando SSH** (Recomendado)
```bash
# Se você tem SSH configurado
git remote add origin git@github.com:seu-usuario/BookStore-API.git

# Verificar
git remote -v
```

### 5. Fazer o Push Inicial

```bash
# Renomear branch para 'main' (se necessário)
git branch -M main

# Fazer o push
git push -u origin main
```

**Se pedir autenticação:**
- **HTTPS:** Use um Personal Access Token (não sua senha)
- **SSH:** Certifique-se de que sua SSH key está configurada

### 6. Verificar no GitHub

1. Acesse seu repositório no GitHub
2. Verifique se todos os arquivos foram enviados
3. Veja se o README.md está sendo exibido

## 📝 Estrutura Esperada no GitHub

```
BookStore-API/
├── .gitignore
├── README.md
├── API_EXAMPLES.md
├── QUICKSTART.md
├── GITHUB_SETUP.md
├── compose.yaml
├── pom.xml
├── mvnw
├── mvnw.cmd
└── src/
    ├── main/
    │   ├── java/
    │   │   └── com/adelmon/bookstore/
    │   └── resources/
    └── test/
```

## 🔄 Próximos Commits

Siga boas práticas de mensagens de commit:

```bash
# Padrão de mensagem
git commit -m "tipo: descrição curta

Descrição mais detalhada (opcional)"

# Exemplos:
git commit -m "feat: add book search by keyword"
git commit -m "fix: correct ISBN validation"
git commit -m "docs: update API examples"
git commit -m "refactor: improve exception handling"
```

### Convenções de Commit (Conventional Commits)

- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Documentação
- `style:` Formatação (não afeta código)
- `refactor:` Refatoração
- `test:` Adicionar testes
- `chore:` Tarefas de manutenção

## 🏷️ Criar Tags e Releases

Após algumas funcionalidades, você pode criar uma release:

```bash
# Criar uma tag
git tag -a v0.1.0 -m "Initial release - CRUD operations"

# Enviar tag para GitHub
git push origin v0.1.0
```

No GitHub:
1. Vá em **Releases**
2. Clique em **"Create a new release"**
3. Selecione a tag `v0.1.0`
4. Adicione uma descrição
5. Clique em **"Publish release"**

## 🔒 Proteger Dados Sensíveis

**⚠️ IMPORTANTE:** Nunca commite:
- Senhas
- Chaves de API
- Credenciais de banco de dados
- Arquivos `.env` ou `application-local.properties`

O `.gitignore` já está configurado para proteger alguns arquivos, mas verifique antes de cada commit.

## 📊 Badges para o README (Opcional)

Você pode adicionar badges ao README.md:

```markdown
![Java](https://img.shields.io/badge/Java-17-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.7-brightgreen)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)
![License](https://img.shields.io/badge/License-MIT-yellowgreen)
```

## 🌟 Adicionar Topics ao Repositório

No GitHub, vá em **"About"** → **"Add topics"** e adicione:
- `java`
- `spring-boot`
- `rest-api`
- `postgresql`
- `docker`
- `bookstore`
- `crud-api`

## 📱 Links Úteis

- [GitHub Docs](https://docs.github.com/)
- [Git SCM Book](https://git-scm.com/book)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub CLI](https://cli.github.com/) (alternativa ao GitHub web)

## ✅ Checklist Final

Antes de fazer push, certifique-se:

- [ ] ✅ `.gitignore` está configurado
- [ ] ✅ README.md está completo e informativo
- [ ] ✅ Não há credenciais hardcoded no código
- [ ] ✅ Código está compilando sem erros
- [ ] ✅ Estrutura de pastas está organizada
- [ ] ✅ Commits seguem boas práticas

---

**🎉 Pronto! Seu projeto está no GitHub e pronto para impressionar recrutadores!**

