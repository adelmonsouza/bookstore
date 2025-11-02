#!/bin/bash

# Script para configurar múltiplas contas GitHub no mesmo computador
# Uso: ./setup-multiple-github-accounts.sh

echo "🔧 Configuração de Múltiplas Contas GitHub"
echo ""

# Verificar se ~/.ssh existe
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Perguntar informações
echo "=== CONTA PESSOAL (adelmonsouza) ==="
read -p "Email da conta pessoal: " email_pessoal
read -p "Nome da conta pessoal [adelmonsouza]: " user_pessoal
user_pessoal=${user_pessoal:-adelmonsouza}

echo ""
echo "=== CONTA TRABALHO (e-nouveau) ==="
read -p "Email da conta trabalho: " email_trabalho
read -p "Nome da conta trabalho [e-nouveau]: " user_trabalho
user_trabalho=${user_trabalho:-e-nouveau}

echo ""
echo "Gerando SSH keys..."

# Gerar chave para conta pessoal
if [ ! -f ~/.ssh/id_ed25519_${user_pessoal} ]; then
    ssh-keygen -t ed25519 -C "$email_pessoal" -f ~/.ssh/id_ed25519_${user_pessoal} -N ""
    echo "✅ Chave pessoal gerada: ~/.ssh/id_ed25519_${user_pessoal}"
else
    echo "⚠️ Chave pessoal já existe"
fi

# Gerar chave para conta trabalho
if [ ! -f ~/.ssh/id_ed25519_${user_trabalho} ]; then
    ssh-keygen -t ed25519 -C "$email_trabalho" -f ~/.ssh/id_ed25519_${user_trabalho} -N ""
    echo "✅ Chave trabalho gerada: ~/.ssh/id_ed25519_${user_trabalho}"
else
    echo "⚠️ Chave trabalho já existe"
fi

# Configurar ~/.ssh/config
echo ""
echo "Configurando ~/.ssh/config..."

CONFIG_FILE=~/.ssh/config
BACKUP_FILE=~/.ssh/config.backup.$(date +%Y%m%d_%H%M%S)

if [ -f "$CONFIG_FILE" ]; then
    cp "$CONFIG_FILE" "$BACKUP_FILE"
    echo "✅ Backup criado: $BACKUP_FILE"
fi

# Adicionar configuração se não existir
if ! grep -q "Host github.com-${user_pessoal}" "$CONFIG_FILE" 2>/dev/null; then
    cat >> "$CONFIG_FILE" << EOF

# Conta pessoal - ${user_pessoal}
Host github.com-${user_pessoal}
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_${user_pessoal}
    IdentitiesOnly yes

EOF
    echo "✅ Configuração pessoal adicionada"
fi

if ! grep -q "Host github.com-${user_trabalho}" "$CONFIG_FILE" 2>/dev/null; then
    cat >> "$CONFIG_FILE" << EOF

# Conta trabalho - ${user_trabalho}
Host github.com-${user_trabalho}
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_${user_trabalho}
    IdentitiesOnly yes

EOF
    echo "✅ Configuração trabalho adicionada"
fi

# Mostrar chaves públicas
echo ""
echo "=== CHAVES PÚBLICAS PARA ADICIONAR NO GITHUB ==="
echo ""
echo "📋 CONTA PESSOAL (${user_pessoal}):"
echo "   https://github.com/settings/keys"
echo ""
cat ~/.ssh/id_ed25519_${user_pessoal}.pub
echo ""
echo "📋 CONTA TRABALHO (${user_trabalho}):"
echo "   https://github.com/settings/keys"
echo ""
cat ~/.ssh/id_ed25519_${user_trabalho}.pub
echo ""

# Configurar remote atual
echo "=== CONFIGURAR REMOTE DO PROJETO ATUAL ==="
read -p "Qual conta usar para este projeto? [pessoal/trabalho]: " conta_escolhida

if [ "$conta_escolhida" = "pessoal" ] || [ -z "$conta_escolhida" ]; then
    REPO=$(git remote get-url origin 2>/dev/null | sed 's/.*github\.com[:/]\([^/]*\)\/\([^.]*\)\.git/\1\/\2/')
    if [ -n "$REPO" ]; then
        git remote set-url origin "git@github.com-${user_pessoal}:${REPO}.git"
        echo "✅ Remote configurado para conta pessoal"
    fi
elif [ "$conta_escolhida" = "trabalho" ]; then
    REPO=$(git remote get-url origin 2>/dev/null | sed 's/.*github\.com[:/]\([^/]*\)\/\([^.]*\)\.git/\1\/\2/')
    if [ -n "$REPO" ]; then
        git remote set-url origin "git@github.com-${user_trabalho}:${REPO}.git"
        echo "✅ Remote configurado para conta trabalho"
    fi
fi

echo ""
echo "✅ CONFIGURAÇÃO CONCLUÍDA!"
echo ""
echo "📋 Próximos passos:"
echo "   1. Adicione as chaves SSH no GitHub (veja acima)"
echo "   2. Teste: ssh -T git@github.com-${user_pessoal}"
echo "   3. Teste: ssh -T git@github.com-${user_trabalho}"
echo ""
echo "💡 Para outros projetos, use:"
echo "   git remote set-url origin git@github.com-${user_pessoal}:USER/REPO.git"
echo "   git remote set-url origin git@github.com-${user_trabalho}:USER/REPO.git"

