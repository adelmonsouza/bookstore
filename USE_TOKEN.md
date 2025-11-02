# 🔑 Como Usar Personal Access Token

## 📋 Passo a Passo

### 1. Token Já Gerado ✅
Você já criou o Personal Access Token no GitHub.

### 2. Limpar Credenciais Antigas

Execute no terminal:
```bash
git credential-osxkeychain erase
host=github.com
protocol=https
```
(Pressione Enter duas vezes após digitar protocol=https)

### 3. Fazer Push

```bash
git push -u origin main
```

### 4. Quando o Git Pedir Credenciais:

**Username:** `adelmonsouza`  
**Password:** Cole seu **Personal Access Token** (não sua senha do GitHub!)

### 5. Salvar Credenciais (Opcional)

Se o macOS perguntar se quer salvar, você pode:
- **Permitir** - Salvará o token no Keychain
- **Sempre permitir** - Para não perguntar mais

## 🔍 Verificar se Funcionou

Após o push, você verá:
```
Enumerating objects: X, done.
Counting objects: 100% (X/X), done.
Writing objects: 100% (X/X), done.
To https://github.com/adelmonsouza/bookstore.git
   [hash]..[hash]  main -> main
```

## ⚠️ Se Ainda Der Erro

1. **Verifique se copiou o token completo** (sem espaços)
2. **Verifique se o token tem escopo `repo`**
3. **Tente limpar credenciais novamente:**
   ```bash
   git credential reject https://github.com
   ```

## 💡 Dica

O token pode ser salvo no macOS Keychain para não precisar digitar sempre.

---

**Agora execute:** `git push -u origin main`

