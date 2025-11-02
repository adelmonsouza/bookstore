# 🚀 Quick Start Guide - BookStore API

Guia rápido para iniciar o projeto em 3 passos!

## ⚡ Início Rápido (3 minutos)

### Passo 1: Subir o Banco de Dados PostgreSQL

```bash
docker-compose up -d
```

Isso irá:
- ✅ Criar um container PostgreSQL 15
- ✅ Configurar o banco `bookstore`
- ✅ Expôr na porta **5433** (externa) → 5432 (interna no container)

**Verificar se está rodando:**
```bash
docker ps
```

Você deve ver o container `bookstore-postgres` rodando.

### Passo 2: Executar a Aplicação Spring Boot

```bash
./mvnw spring-boot:run
```

Ou se preferir compilar primeiro:
```bash
./mvnw clean install
java -jar target/BookStore-API-0.0.1-SNAPSHOT.jar
```

**Aguardar a mensagem:**
```
Started BookStoreApiApplication in X.XXX seconds
```

A aplicação estará disponível em: `http://localhost:8080`

### Passo 3: Testar a API

```bash
# Verificar se a API está respondendo
curl http://localhost:8080/api/books

# Criar um livro de teste
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

**Sucesso! 🎉** Você deve receber um JSON com o livro criado.

## 🛑 Parar os Serviços

```bash
# Parar a aplicação Spring Boot
# Pressione Ctrl+C no terminal

# Parar o PostgreSQL
docker-compose down
```

## 🐛 Troubleshooting

### Erro: "Port 5433 already allocated" / "Bind for 0.0.0.0:5433 failed"
O projeto está configurado para usar porta **5433** por padrão para evitar conflitos.

**Solução:** Pare o PostgreSQL local que está usando a porta 5433:
```bash
# Via Homebrew
brew services stop postgresql@14 postgresql@17

# Ou veja STOP_POSTGRES_5433.md para mais opções
```

### Erro: "Cannot connect to database"
```bash
# Verificar se o container está rodando
docker ps

# Ver logs do PostgreSQL
docker-compose logs postgres

# Reiniciar o container
docker-compose restart postgres
```

### Erro: "Port 8080 already in use"
```bash
# Mudar a porta no application.properties
server.port=8081

# Ou parar o processo que está usando a porta
lsof -i :8080
kill -9 <PID>
```

## 📝 Próximos Passos

1. ✅ Leia o [README.md](README.md) para documentação completa
2. ✅ Veja exemplos em [API_EXAMPLES.md](API_EXAMPLES.md)
3. ✅ Teste todos os endpoints da API
4. ✅ Personalize as configurações conforme necessário

## 📚 Recursos Úteis

- **API Base URL:** `http://localhost:8080/api/books`
- **PostgreSQL:** `localhost:5433` (porta externa)
- **Database:** `bookstore`
- **Username:** `postgres`
- **Password:** Verifique em `compose.yaml` ou use a variável `POSTGRES_PASSWORD`

---

**Pronto para desenvolver! 🚀**

