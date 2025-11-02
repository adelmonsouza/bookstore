# 🔐 Corrigir Autenticação GitHub

## ❌ Erro Encontrado

```
remote: Permission to adelmonsouza/bookstore.git denied to e-nouveau.
fatal: unable to access 'https://github.com/adelmonsouza/bookstore.git/': The requested URL returned error: 403
```

**Problema:** Git está usando credenciais do usuário `e-nouveau`, mas precisa autenticar como `adelmonsouza`.

## ✅ Soluções

### Solução 1: Personal Access Token (HTTPS) - Rápida

1. **Criar Token no GitHub:**
   - Acesse: https://github.com/settings/tokens
   - Clique em **"Generate new token (classic)"**
   - Dê um nome: `BookStore-API-Push`
   - Selecione escopo: ✅ **repo**
   - Clique em **"Generate token"**
   - **COPIE O TOKEN** (você não verá novamente!)

2. **Usar Token ao fazer Push:**
   ```bash
   git push -u origin main
   ```
   
   Quando pedir:
   - **Username:** `adelmonsouza`
   - **Password:** Cole o Personal Access Token (não sua senha!)

3. **Ou configurar credenciais (macOS):**
   ```bash
   git credential-osxkeychain erase
   host=github.com
   protocol=https
   ```
   Depois faça push novamente e use o token.

### Solução 2: SSH (Mais Seguro - Recomendado)

1. **Gerar SSH Key:**
   ```bash
   ssh-keygen -t ed25519 -C "seu_email@example.com"
   # Pressione Enter para aceitar local padrão
   # Opcional: Adicione uma senha
   ```

2. **Copiar Chave Pública:**
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
   Copie toda a saída.

3. **Adicionar no GitHub:**
   - Acesse: https://github.com/settings/keys
   - Clique em **"New SSH key"**
   - **Title:** `MacBook - BookStore API`
   - **Key:** Cole a chave pública copiada
   - Clique em **"Add SSH key"**

4. **Alterar Remote para SSH:**
   ```bash
   git remote set-url origin git@github.com:adelmonsouza/bookstore.git
   ```

5. **Testar Conexão:**
   ```bash
   ssh -T git@github.com
   ```
   Deve retornar: `Hi adelmonsouza! You've successfully authenticated...`

6. **Fazer Push:**
   ```bash
   git push -u origin main
   ```

### Solução 3: Credentials Helper (HTTPS)

**macOS:**
```bash
git config --global credential.helper osxkeychain
```

**Depois:**
```bash
git push -u origin main
# Use Personal Access Token como senha
```

## 🔍 Verificar Configuração Atual

```bash
# Ver remote configurado
git remote -v

# Ver configuração do usuário Git
git config user.name
git config user.email
```

## 📝 Após Configurar Autenticação

Execute novamente:
```bash
git push -u origin main
```

## ⚠️ Importante

- **Nunca commite tokens ou senhas**
- **Personal Access Tokens são seguros** (podem ser revogados)
- **SSH é mais seguro** para uso diário

---

**Recomendação:** Use Solução 2 (SSH) para uma experiência mais fluida.

