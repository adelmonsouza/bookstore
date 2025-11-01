# 📤 Push para GitHub - Guia Rápido

## ✅ Status Atual

- ✅ Repositório Git inicializado
- ✅ Commit inicial criado
- ✅ Arquivos sensíveis protegidos no `.gitignore`

## 🚀 Próximos Passos

### 1. Criar Repositório no GitHub

1. Acesse [GitHub](https://github.com)
2. Clique em **"+" → "New repository"**
3. Configure:
   - **Repository name:** `BookStore-API`
   - **Description:** `RESTful API for bookstore management - Java 17 + Spring Boot + PostgreSQL`
   - **Visibility:** `Public` (recomendado para portfólio)
   - ⚠️ **NÃO marque** nenhuma opção (já temos README, .gitignore, etc.)
4. Clique em **"Create repository"**

### 2. Conectar ao Repositório Remoto

Após criar o repositório, você verá instruções. Escolha uma opção:

#### Opção A: HTTPS (Mais simples)

```bash
cd /Volumes/AdellServer/Projects/30days/BookStore-API

# Adicione o remote (substitua SEU_USUARIO pelo seu username do GitHub)
git remote add origin https://github.com/SEU_USUARIO/BookStore-API.git

# Verificar
git remote -v
```

**Nota:** Você precisará de um **Personal Access Token** para fazer push via HTTPS.

#### Opção B: SSH (Recomendado)

```bash
cd /Volumes/AdellServer/Projects/30days/BookStore-API

# Adicione o remote (substitua SEU_USUARIO pelo seu username do GitHub)
git remote add origin git@github.com:SEU_USUARIO/BookStore-API.git

# Verificar
git remote -v
```

**Nota:** Certifique-se de que sua SSH key está configurada no GitHub.

### 3. Renomear Branch (se necessário)

```bash
# Renomear branch para 'main' (se ainda estiver em 'master')
git branch -M main
```

### 4. Fazer o Push

```bash
# Primeiro push
git push -u origin main
```

**Se pedir autenticação:**
- **HTTPS:** Use seu Personal Access Token
- **SSH:** Certifique-se de que a SSH key está configurada

### 5. Verificar no GitHub

1. Acesse seu repositório: `https://github.com/SEU_USUARIO/BookStore-API`
2. Verifique se todos os arquivos foram enviados
3. Veja se o README.md está sendo exibido corretamente

## 🔑 Configuração de Autenticação

### Personal Access Token (HTTPS)

1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. **Generate new token**
3. Dê um nome e selecione escopos: `repo`
4. Copie o token gerado
5. Use-o como senha ao fazer push

### SSH Key (SSH)

```bash
# Verificar se já tem SSH key
ls -al ~/.ssh

# Se não tiver, criar uma nova
ssh-keygen -t ed25519 -C "seu_email@example.com"

# Copiar a chave pública
cat ~/.ssh/id_ed25519.pub

# Adicionar no GitHub:
# Settings → SSH and GPG keys → New SSH key
```

## 📝 Verificações Finais

Antes do push, verifique:

```bash
# Ver status
git status

# Ver o que será enviado
git log --oneline

# Verificar se application.properties não está sendo enviado
git ls-files | grep application.properties
# (Não deve retornar nada, ou apenas o .example)

# Ver todos os arquivos que serão enviados
git ls-files | head -20
```

## 🎯 Próximos Commits

Após o primeiro push, use estes comandos:

```bash
# Adicionar mudanças
git add .

# Fazer commit
git commit -m "tipo: descrição curta"

# Fazer push
git push
```

## ⚠️ Importante

- ✅ Nunca faça push de `application.properties` com credenciais reais
- ✅ Sempre use `.example` files para templates
- ✅ Verifique o `.gitignore` antes de cada commit
- ✅ Use mensagens de commit descritivas

## 🆘 Problemas Comuns

### Erro: "remote origin already exists"

```bash
# Remover o remote existente
git remote remove origin

# Adicionar novamente
git remote add origin [URL]
```

### Erro: "permission denied"

- **HTTPS:** Verifique o Personal Access Token
- **SSH:** Verifique a configuração da SSH key

### Erro: "failed to push some refs"

```bash
# Se o repositório no GitHub já tem conteúdo, faça pull primeiro
git pull origin main --allow-unrelated-histories

# Depois faça push
git push -u origin main
```

---

**🎉 Pronto! Seu projeto está no GitHub!**

