# 📤 Instruções para Push no GitHub

## ⚠️ Problema de Autenticação

O Git precisa autenticar como `adelmonsouza` no GitHub.

## 🔐 Opções de Autenticação

### Opção A: Personal Access Token (Mais Rápido)

1. **Criar Token:**
   - https://github.com/settings/tokens
   - **Generate new token (classic)**
   - Nome: `BookStore-API`
   - Escopo: ✅ **repo**
   - **Copie o token gerado**

2. **Alterar Remote para HTTPS:**
   ```bash
   git remote set-url origin https://github.com/adelmonsouza/bookstore.git
   ```

3. **Fazer Push:**
   ```bash
   git push -u origin main
   ```
   - **Username:** `adelmonsouza`
   - **Password:** Cole o Personal Access Token

### Opção B: Configurar SSH (Recomendado)

1. **Verificar se SSH key está no GitHub:**
   - https://github.com/settings/keys
   - Verifique se sua chave `id_ed25519.pub` está listada
   - Se não estiver:
     ```bash
     cat ~/.ssh/id_ed25519.pub
     # Copie a saída e adicione no GitHub
     ```

2. **Remote já está configurado para SSH:**
   ```bash
   git remote -v
   # Deve mostrar: git@github.com:adelmonsouza/bookstore.git
   ```

3. **Testar Conexão:**
   ```bash
   ssh -T git@github.com
   # Deve retornar: Hi adelmonsouza! You've successfully authenticated...
   ```

4. **Fazer Push:**
   ```bash
   git push -u origin main
   ```

## 📋 Status Atual

- ✅ Remote configurado: `git@github.com:adelmonsouza/bookstore.git`
- ✅ Branch: `main`
- ✅ Commit pronto: `3ce781f`
- ⚠️ Precisa autenticação

## 🚀 Após Autenticar

Execute:
```bash
git push -u origin main
```

---

**Dica:** Se SSH não funcionar, use Personal Access Token (Opção A).

