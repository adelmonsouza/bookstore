# ✅ Pre-Commit Checklist

Use este checklist antes de fazer commit e push para o repositório.

## 🔒 Segurança

- [ ] ✅ Nenhuma senha hardcoded no código
- [ ] ✅ `application.properties` está no `.gitignore`
- [ ] ✅ Arquivos `.env` não estão sendo commitados
- [ ] ✅ `compose.yaml` não contém senhas reais (apenas variáveis)
- [ ] ✅ Templates (`.example`) não contém credenciais reais
- [ ] ✅ Nenhuma chave de API ou token no código

## 📝 Código

- [ ] ✅ Código compila sem erros (`./mvnw clean compile`)
- [ ] ✅ Sem warnings críticos
- [ ] ✅ Segue os padrões de Clean Code
- [ ] ✅ Nomes de variáveis/métodos são descritivos
- [ ] ✅ Comentários adicionados onde necessário
- [ ] ✅ Tratamento de exceções adequado

## 🧪 Testes

- [ ] ✅ Testes executam sem erros (`./mvnw test`)
- [ ] ✅ Novas funcionalidades têm testes (quando aplicável)

## 📚 Documentação

- [ ] ✅ README.md atualizado (se houver mudanças relevantes)
- [ ] ✅ Comentários JavaDoc para novas classes/métodos públicos
- [ ] ✅ Exemplos de uso atualizados (se necessário)

## 🔍 Verificações Git

### Verificar arquivos que serão commitados:

```bash
git status
git diff --cached
```

### Verificar se informações sensíveis estão sendo commitadas:

```bash
# Buscar por senhas
git diff --cached | grep -i "password\|secret\|key\|token" | grep -v "CHANGE_ME\|example"

# Verificar se application.properties está ignorado
git check-ignore -v application.properties

# Verificar arquivos que podem conter secrets
git diff --cached --name-only | grep -E "\.env|application.*\.properties|secrets"
```

**Se encontrar algo:** ❌ **NÃO FAÇA COMMIT!** Remova as informações sensíveis primeiro.

## 📦 Estrutura

- [ ] ✅ Arquivos na estrutura de pacotes correta
- [ ] ✅ Sem arquivos temporários ou de backup
- [ ] ✅ `.gitignore` está funcionando corretamente

## 📝 Commit Message

- [ ] ✅ Mensagem segue padrão Conventional Commits
- [ ] ✅ Descrição clara do que foi alterado
- [ ] ✅ Tipo correto (`feat:`, `fix:`, `docs:`, etc.)

### Exemplo de boa mensagem:

```bash
feat: add book search by category

- Added category field to Book entity
- Implemented search endpoint /api/books/search?category=X
- Added tests for new functionality

Closes #123
```

## 🚀 Antes do Push

```bash
# 1. Verificar status
git status

# 2. Ver diferenças
git diff origin/main

# 3. Verificar se compila
./mvnw clean compile

# 4. Verificar testes
./mvnw test

# 5. Revisar arquivos que serão enviados
git log --oneline -5
git diff --stat origin/main
```

## ⚠️ Checklist Final

Antes de executar `git push`:

- [ ] ✅ Todos os itens acima foram verificados
- [ ] ✅ Nenhuma informação sensível será exposta
- [ ] ✅ Código está funcionando corretamente
- [ ] ✅ Documentação está atualizada
- [ ] ✅ Mensagem de commit está clara e descritiva

## 🔄 Se encontrar problemas

1. **Senhas no código:** Remova e use variáveis de ambiente
2. **Arquivos não devem ser commitados:** Adicione ao `.gitignore`
3. **Erros de compilação:** Corrija antes de commitar
4. **Conflitos:** Resolva antes de fazer push

---

**Lembre-se:** É melhor fazer vários commits pequenos e bem documentados do que um grande commit confuso!

**Quando em dúvida:** Peça ajuda ou revise o código antes de commitar.

