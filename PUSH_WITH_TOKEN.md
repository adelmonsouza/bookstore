# 🚀 Push com Personal Access Token

## Método Rápido (Recomendado)

### Opção 1: Push Direto com Token na URL

Execute substituindo `SEU_TOKEN` pelo seu Personal Access Token:

```bash
git push https://SEU_TOKEN@github.com/adelmonsouza/bookstore.git main
```

**Exemplo:**
Se seu token for `ghp_abc123xyz...`, execute:
```bash
git push https://ghp_abc123xyz@github.com/adelmonsouza/bookstore.git main
```

### Opção 2: Configurar Remote com Token

```bash
# Substitua SEU_TOKEN pelo seu token
git remote set-url origin https://SEU_TOKEN@github.com/adelmonsouza/bookstore.git

# Depois push normal
git push -u origin main
```

### Opção 3: Usar Git Credential Helper (Interativo)

```bash
# Limpar credenciais antigas
git credential reject https://github.com

# Tentar push (vai pedir credenciais)
git push -u origin main

# Quando pedir:
# Username: adelmonsouza
# Password: Cole seu token (ghp_...)
```

## 🔒 Segurança

⚠️ **IMPORTANTE:** 
- O token na URL aparecerá no histórico do Git local
- Após o push, remova o token da URL:
  ```bash
  git remote set-url origin https://github.com/adelmonsouza/bookstore.git
  ```
- Ou use Opção 3 (interativo) que é mais segura

## ✅ Verificar Push

Após push bem-sucedido:
```bash
git status
# Deve mostrar: "Your branch is up to date with 'origin/main'"
```

E verifique no GitHub:
- https://github.com/adelmonsouza/bookstore

---

**Recomendação:** Use Opção 1 para push rápido agora, depois configure SSH para uso diário.

