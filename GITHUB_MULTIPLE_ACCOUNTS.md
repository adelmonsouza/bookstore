# 👥 Gerenciar Múltiplas Contas GitHub no Mesmo Computador

Você pode usar múltiplas contas GitHub sem precisar trocar de conta manualmente! Existem várias estratégias.

## 🎯 Soluções

### Solução 1: SSH Keys por Conta (⭐ RECOMENDADO)

**Vantagens:**
- ✅ Automático - não precisa digitar credenciais
- ✅ Seguro - uma chave por conta
- ✅ Fácil de gerenciar

**Como fazer:**

#### 1. Gerar SSH Key para cada conta

```bash
# Para conta pessoal
ssh-keygen -t ed25519 -C "seu_email_pessoal@example.com" -f ~/.ssh/id_ed25519_pessoal

# Para conta trabalho
ssh-keygen -t ed25519 -C "seu_email_trabalho@example.com" -f ~/.ssh/id_ed25519_trabalho
```

#### 2. Adicionar SSH Keys no GitHub

**Para cada conta:**
- Acesse: https://github.com/settings/keys
- Clique em "New SSH key"
- Título: `Nome_do_Computador - Nome_da_Conta`
- Cole sua chave pública: `cat ~/.ssh/id_ed25519_NOME_DA_CONTA.pub`
- Clique em "Add SSH key"

**Repita o processo para cada conta GitHub**

#### 3. Configurar SSH Config

Criar/editar `~/.ssh/config`:

```bash
# Conta pessoal
Host github.com-pessoal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_pessoal
    IdentitiesOnly yes

# Conta trabalho
Host github.com-trabalho
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_trabalho
    IdentitiesOnly yes
```

#### 4. Usar SSH Config nos Repositórios

**Para projetos pessoais:**
```bash
git remote set-url origin git@github.com-pessoal:USUARIO/REPOSITORIO.git
```

**Para projetos trabalho:**
```bash
git remote set-url origin git@github.com-trabalho:USUARIO/REPOSITORIO.git
```

### Solução 2: Personal Access Tokens por Projeto

**Vantagens:**
- ✅ Simples - cada projeto usa seu token
- ✅ Funciona com HTTPS
- ✅ Fácil de gerenciar

**Como fazer:**

#### 1. Criar Tokens para cada conta

**Conta adelmonsouza:**
- https://github.com/settings/tokens
- Generate token → Escopo: `repo`
- Copie o token

**Conta e-nouveau:**
- Mesmo processo

#### 2. Usar Token no Remote

**Para projetos pessoais:**
```bash
git remote set-url origin https://SEU_TOKEN@github.com/USUARIO/REPOSITORIO.git
```

**Para projetos trabalho:**
```bash
git remote set-url origin https://SEU_TOKEN@github.com/USUARIO/REPOSITORIO.git
```

⚠️ **Cuidado:** Tokens aparecem no histórico local. Use SSH para mais segurança.

### Solução 3: Git Config por Diretório

**Vantagens:**
- ✅ Automático por projeto
- ✅ Não precisa mudar configuração global
- ✅ Fácil de alternar

**Como fazer:**

Criar arquivo `.gitconfig.local` em cada projeto:

**Projetos pessoais (adelmonsouza):**
```bash
# No diretório do projeto
cat > .gitconfig.local << EOF
[user]
    name = Adelmon Souza
    email = seu_email_pessoal@example.com
[credential]
    helper = osxkeychain
[credential "https://github.com"]
    username = adelmonsouza
EOF
```

**Projetos trabalho (e-nouveau):**
```bash
cat > .gitconfig.local << EOF
[user]
    name = Seu Nome Trabalho
    email = seu_email_trabalho@example.com
[credential]
    helper = osxkeychain
[credential "https://github.com"]
    username = e-nouveau
EOF
```

Usar no Git:
```bash
git config --local include.path ../.gitconfig.local
```

### Solução 4: Git Credential Store por Conta

**Vantagens:**
- ✅ Credenciais salvas separadamente
- ✅ Funciona bem com HTTPS

**Como fazer:**

```bash
# Configurar credencial helper para cada conta
git config --global credential.https://github.com/adelmonsouza.helper osxkeychain
git config --global credential.https://github.com/e-nouveau.helper osxkeychain
```

## 🎯 Recomendação Final

**Para seu caso (pessoal + trabalho):**

Use **Solução 1 (SSH Keys)** - É a mais prática:

```bash
# 1. Gerar chaves para cada conta
ssh-keygen -t ed25519 -C "seu_email@example.com" -f ~/.ssh/id_ed25519_CONTA_PESSOAL
ssh-keygen -t ed25519 -C "seu_email@example.com" -f ~/.ssh/id_ed25519_CONTA_TRABALHO

# 2. Adicionar no ~/.ssh/config (veja exemplo acima)

# 3. Para cada repositório, usar o host correto:
# Projetos pessoais:
git remote set-url origin git@github.com-CONTA_PESSOAL:USUARIO/REPOSITORIO.git

# Projetos trabalho:
git remote set-url origin git@github.com-CONTA_TRABALHO:USUARIO/REPOSITORIO.git
```

## 📋 Script de Setup Automático

Criei um script para facilitar! Veja próximo arquivo.

## ✅ Checklist

- [ ] SSH keys geradas para cada conta
- [ ] Keys adicionadas no GitHub
- [ ] Arquivo `~/.ssh/config` configurado
- [ ] Remotes configurados com hosts corretos

---

**Dica:** Uma vez configurado, você não precisa mais se preocupar - cada projeto usará a conta certa automaticamente!

