# ✅ Validação - Projeto Rodando no IntelliJ

## 🎯 Checklist de Validação

### 1. Verificar se API está Respondendo

**No Terminal do IntelliJ ou terminal externo:**

```bash
# Teste básico - deve retornar [] (array vazio)
curl http://localhost:8080/api/books

# Ou teste completo
curl -v http://localhost:8080/api/books
```

**✅ Sucesso:** Retorna `[]` ou JSON vazio  
**❌ Erro:** Connection refused ou timeout

### 2. Verificar Container PostgreSQL

```bash
docker ps | grep bookstore-postgres
```

**✅ Sucesso:** Container aparece como "Up"  
**Deve mostrar:** `bookstore-postgres` na porta `0.0.0.0:5434->5432/tcp`

### 3. Verificar Logs da Aplicação

**No IntelliJ Console**, você deve ver:

```
Started BookStoreApiApplication in X.XXX seconds
```

**Sem erros** de conexão ao banco de dados.

### 4. Testar Endpoints da API

#### Listar Livros
```bash
curl http://localhost:8080/api/books
```

#### Criar um Livro
```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Test Book",
    "isbn": "1234567890123",
    "author": "Test Author",
    "price": 29.99,
    "stockQuantity": 10,
    "description": "A test book"
  }'
```

#### Verificar Livro Criado
```bash
curl http://localhost:8080/api/books
# Deve retornar o livro criado
```

### 5. Verificar Banco de Dados

```bash
# Verificar se PostgreSQL está acessível
pg_isready -h localhost -p 5434

# Conectar ao banco (opcional)
docker exec -it bookstore-postgres psql -U postgres -d bookstore -c "\dt"
# Deve mostrar a tabela "books"
```

## ✅ Indicadores de Sucesso

- ✅ API responde em `http://localhost:8080/api/books`
- ✅ Container `bookstore-postgres` está rodando
- ✅ Porta 5434 está sendo usada pelo container
- ✅ Logs do IntelliJ mostram "Started BookStoreApiApplication"
- ✅ Sem erros de conexão ao banco
- ✅ É possível criar e listar livros

## ❌ Problemas Comuns

### API não responde
- Verifique se aplicação está rodando no IntelliJ
- Verifique logs no console do IntelliJ
- Verifique porta 8080: `lsof -i :8080`

### Erro de conexão ao banco
- Verifique container: `docker ps | grep bookstore`
- Verifique logs: `docker-compose logs postgres`
- Verifique se porta está correta no `application.properties` (5434)

### Container não inicia
- Verifique se porta 5434 está livre: `lsof -i :5434`
- Verifique Docker: `docker ps`
- Verifique `compose.yaml` está na raiz do projeto

## 🎉 Projeto Funcionando!

Se todas as verificações passarem, seu projeto está rodando corretamente!

**Próximos passos:**
- Testar todos os endpoints da API
- Ver `API_EXAMPLES.md` para mais exemplos
- Começar a desenvolver novas funcionalidades

