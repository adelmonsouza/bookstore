# 🔒 Security & Sensitive Data Guidelines

## ⚠️ IMPORTANTE: Proteção de Informações Sensíveis

Este documento descreve as práticas de segurança para proteger informações sensíveis no projeto BookStore API.

## 🚫 NUNCA Commite no Git

### Arquivos que NÃO devem ser commitados:

- ✅ `application.properties` (use `application.properties.example`)
- ✅ `application-local.properties`
- ✅ `application-*.properties` (exceto `.example`)
- ✅ `.env` e `.env.*`
- ✅ Arquivos com credenciais
- ✅ Chaves e certificados (`.key`, `.pem`, `.jks`)
- ✅ Logs com informações sensíveis
- ✅ Docker compose override com senhas

### O que É Seguro Commitar:

- ✅ `application.properties.example` (template sem credenciais)
- ✅ `compose.yaml.example` (template sem senhas)
- ✅ Documentação pública
- ✅ Código fonte (sem hardcoded secrets)

## 🔐 Configuração Segura

### 1. Application Properties

**❌ ERRADO:**
```properties
spring.datasource.password=minhasenha123
```

**✅ CORRETO:**
```properties
# Usando variáveis de ambiente
spring.datasource.password=${DB_PASSWORD}

# Ou com valor padrão apenas para desenvolvimento local
spring.datasource.password=${DB_PASSWORD:dev_password}
```

### 2. Docker Compose

**❌ ERRADO:**
```yaml
environment:
  POSTGRES_PASSWORD: minhasenha123
```

**✅ CORRETO:**
```yaml
environment:
  POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-change_me}
```

### 3. Usando Variáveis de Ambiente

#### Linux/Mac:
```bash
export DB_PASSWORD=senha_segura
export POSTGRES_PASSWORD=senha_segura
./mvnw spring-boot:run
```

#### Windows (PowerShell):
```powershell
$env:DB_PASSWORD="senha_segura"
$env:POSTGRES_PASSWORD="senha_segura"
./mvnw spring-boot:run
```

#### Criar arquivo `.env` (não commitado):
```bash
# .env (adicionado ao .gitignore)
DB_PASSWORD=senha_segura
POSTGRES_PASSWORD=senha_segura
DB_USERNAME=postgres
```

## 📝 Setup Inicial

### Passo 1: Configurar Application Properties

```bash
# Copiar template
cp src/main/resources/application.properties.example \
   src/main/resources/application.properties

# Editar e adicionar suas credenciais
nano src/main/resources/application.properties
```

### Passo 2: Configurar Docker Compose

```bash
# Copiar template
cp compose.yaml.example compose.yaml

# Editar e configurar senhas
nano compose.yaml

# Ou usar variáveis de ambiente
export POSTGRES_PASSWORD=senha_segura
docker-compose up -d
```

## 🛡️ Boas Práticas

### 1. **Desenvolvimento Local**
- Use senhas simples apenas para desenvolvimento local
- Nunca use senhas de produção em ambiente local
- Mantenha `application.properties` no `.gitignore`

### 2. **Ambiente de Produção**
- Use variáveis de ambiente ou secrets management
- Considere usar:
  - **AWS Secrets Manager**
  - **HashiCorp Vault**
  - **Kubernetes Secrets**
  - **Docker Secrets**
- Não armazene secrets em código ou repositório

### 3. **Rotação de Senhas**
- Altere senhas regularmente
- Use senhas fortes (mínimo 16 caracteres)
- Combine letras, números e caracteres especiais

### 4. **Princípio do Menor Privilégio**
- Use usuários com permissões mínimas necessárias
- Evite usar `postgres` como usuário em produção
- Crie usuários específicos para a aplicação

## 🔍 Verificação de Segurança

### Antes de cada commit:

```bash
# Verificar se há senhas hardcoded
grep -r "password.*=" src/ --exclude-dir=target
grep -r "secret.*=" src/ --exclude-dir=target
grep -r "PASSWORD" compose.yaml

# Verificar arquivos que serão commitados
git status
git diff --cached

# Verificar se .gitignore está funcionando
git check-ignore -v application.properties
```

### Ferramentas Úteis:

- **git-secrets** - Previne commits de secrets
- **gitleaks** - Detecta secrets em repositórios
- **truffleHog** - Scans for secrets

## 📋 Checklist de Segurança

Antes de fazer push para o repositório público:

- [ ] ✅ Nenhuma senha hardcoded no código
- [ ] ✅ `application.properties` está no `.gitignore`
- [ ] ✅ Arquivos `.env` estão ignorados
- [ ] ✅ Templates (`.example`) não contêm senhas reais
- [ ] ✅ Logs não contêm informações sensíveis
- [ ] ✅ Variáveis de ambiente estão documentadas
- [ ] ✅ Secrets management configurado (produção)

## 🚨 O que fazer se comitou acidentalmente?

### 1. Remover do Histórico (se ainda não foi push):
```bash
git reset HEAD~1
# Editar o arquivo
git add .
git commit -m "fix: remove sensitive data"
```

### 2. Se já foi pushado:
```bash
# Remover do histórico
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch src/main/resources/application.properties" \
  --prune-empty --tag-name-filter cat -- --all

# Forçar push (cuidado em repositórios compartilhados!)
git push origin --force --all

# Importante: Alterar todas as senhas que foram expostas!
```

## 📚 Recursos Adicionais

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Spring Boot Security](https://spring.io/guides/topicals/spring-security-architecture)
- [12-Factor App - Config](https://12factor.net/config)
- [GitHub Security Best Practices](https://docs.github.com/en/code-security)

---

**Lembre-se:** Uma vez que uma senha é commitada em um repositório público, considere-a comprometida. Sempre altere credenciais que possam ter sido expostas!

