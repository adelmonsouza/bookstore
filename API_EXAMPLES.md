# 📚 BookStore API - Exemplos de Uso

Este documento contém exemplos práticos de como usar a API BookStore.

## 🚀 Pré-requisitos

1. Certifique-se de que o PostgreSQL está rodando via Docker:
```bash
docker-compose up -d
```

2. Inicie a aplicação Spring Boot:
```bash
./mvnw spring-boot:run
```

3. A API estará disponível em: `http://localhost:8080`

## 📝 Exemplos de Requisições

### 1. Criar um Livro (POST)

```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Clean Code: A Handbook of Agile Software Craftsmanship",
    "isbn": "9780132350884",
    "author": "Robert C. Martin",
    "price": 59.99,
    "stockQuantity": 50,
    "description": "Even bad code can function. But if code isnt clean, it can bring a development organization to its knees."
  }'
```

**Resposta esperada (201 Created):**
```json
{
  "id": 1,
  "title": "Clean Code: A Handbook of Agile Software Craftsmanship",
  "isbn": "9780132350884",
  "author": "Robert C. Martin",
  "price": 59.99,
  "stockQuantity": 50,
  "description": "Even bad code can function. But if code isnt clean, it can bring a development organization to its knees.",
  "createdAt": "2024-11-01T10:00:00",
  "updatedAt": "2024-11-01T10:00:00"
}
```

### 2. Criar mais livros (POST)

```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Effective Java",
    "isbn": "9780134685991",
    "author": "Joshua Bloch",
    "price": 54.99,
    "stockQuantity": 30,
    "description": "The Java platform has grown significantly since the publication of the first edition of Effective Java in 2001."
  }'
```

```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Design Patterns: Elements of Reusable Object-Oriented Software",
    "isbn": "9780201633610",
    "author": "Gang of Four",
    "price": 64.99,
    "stockQuantity": 25,
    "description": "Capturing a wealth of experience about the design of object-oriented software."
  }'
```

### 3. Listar Todos os Livros (GET)

```bash
curl http://localhost:8080/api/books
```

**Resposta esperada (200 OK):**
```json
[
  {
    "id": 1,
    "title": "Clean Code: A Handbook of Agile Software Craftsmanship",
    "isbn": "9780132350884",
    "author": "Robert C. Martin",
    "price": 59.99,
    "stockQuantity": 50,
    "description": "Even bad code can function...",
    "createdAt": "2024-11-01T10:00:00",
    "updatedAt": "2024-11-01T10:00:00"
  },
  {
    "id": 2,
    "title": "Effective Java",
    "isbn": "9780134685991",
    "author": "Joshua Bloch",
    "price": 54.99,
    "stockQuantity": 30,
    "description": "The Java platform has grown...",
    "createdAt": "2024-11-01T10:05:00",
    "updatedAt": "2024-11-01T10:05:00"
  }
]
```

### 4. Buscar Livro por ID (GET)

```bash
curl http://localhost:8080/api/books/1
```

**Resposta esperada (200 OK):**
```json
{
  "id": 1,
  "title": "Clean Code: A Handbook of Agile Software Craftsmanship",
  "isbn": "9780132350884",
  "author": "Robert C. Martin",
  "price": 59.99,
  "stockQuantity": 50,
  "description": "Even bad code can function...",
  "createdAt": "2024-11-01T10:00:00",
  "updatedAt": "2024-11-01T10:00:00"
}
```

### 5. Buscar Livro por ISBN (GET)

```bash
curl http://localhost:8080/api/books/isbn/9780132350884
```

### 6. Pesquisar Livros (GET)

```bash
# Buscar por palavra-chave (título ou autor)
curl "http://localhost:8080/api/books/search?keyword=Clean"

# Buscar por autor
curl "http://localhost:8080/api/books/search?keyword=Martin"
```

**Resposta esperada (200 OK):**
```json
[
  {
    "id": 1,
    "title": "Clean Code: A Handbook of Agile Software Craftsmanship",
    "isbn": "9780132350884",
    "author": "Robert C. Martin",
    "price": 59.99,
    "stockQuantity": 50,
    "description": "Even bad code can function...",
    "createdAt": "2024-11-01T10:00:00",
    "updatedAt": "2024-11-01T10:00:00"
  }
]
```

### 7. Atualizar Livro (PUT)

```bash
curl -X PUT http://localhost:8080/api/books/1 \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Clean Code: A Handbook of Agile Software Craftsmanship (Updated)",
    "isbn": "9780132350884",
    "author": "Robert C. Martin",
    "price": 64.99,
    "stockQuantity": 45,
    "description": "Updated description for Clean Code book."
  }'
```

**Resposta esperada (200 OK):**
```json
{
  "id": 1,
  "title": "Clean Code: A Handbook of Agile Software Craftsmanship (Updated)",
  "isbn": "9780132350884",
  "author": "Robert C. Martin",
  "price": 64.99,
  "stockQuantity": 45,
  "description": "Updated description for Clean Code book.",
  "createdAt": "2024-11-01T10:00:00",
  "updatedAt": "2024-11-01T10:30:00"
}
```

### 8. Atualizar Estoque (PATCH)

```bash
curl -X PATCH "http://localhost:8080/api/books/1/stock?quantity=100"
```

**Resposta esperada (200 OK):**
```json
{
  "id": 1,
  "title": "Clean Code: A Handbook of Agile Software Craftsmanship (Updated)",
  "isbn": "9780132350884",
  "author": "Robert C. Martin",
  "price": 64.99,
  "stockQuantity": 100,
  "description": "Updated description for Clean Code book.",
  "createdAt": "2024-11-01T10:00:00",
  "updatedAt": "2024-11-01T10:35:00"
}
```

### 9. Deletar Livro (DELETE)

```bash
curl -X DELETE http://localhost:8080/api/books/1
```

**Resposta esperada (204 No Content):** (sem corpo de resposta)

## ❌ Exemplos de Erros

### Erro 400 - Validação Falhou

```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "",
    "isbn": "123",
    "author": "Test",
    "price": -10,
    "stockQuantity": -5
  }'
```

**Resposta esperada (400 Bad Request):**
```json
{
  "status": 400,
  "message": "Validation failed",
  "errors": {
    "title": "Title is required",
    "isbn": "ISBN must be between 10 and 13 characters",
    "price": "Price must be greater than 0",
    "stockQuantity": "Stock quantity must be 0 or greater"
  },
  "timestamp": "2024-11-01T10:00:00"
}
```

### Erro 404 - Recurso Não Encontrado

```bash
curl http://localhost:8080/api/books/999
```

**Resposta esperada (404 Not Found):**
```json
{
  "status": 404,
  "message": "Book not found with id: 999",
  "timestamp": "2024-11-01T10:00:00"
}
```

### Erro 409 - Conflito (ISBN Duplicado)

```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Another Book",
    "isbn": "9780132350884",
    "author": "Another Author",
    "price": 29.99,
    "stockQuantity": 10
  }'
```

**Resposta esperada (409 Conflict):**
```json
{
  "status": 409,
  "message": "Book with ISBN 9780132350884 already exists",
  "timestamp": "2024-11-01T10:00:00"
}
```

## 🧪 Testando com Postman

1. Importe as requisições no Postman ou crie uma coleção
2. Configure a variável de ambiente `baseUrl` como `http://localhost:8080`
3. Execute as requisições na ordem sugerida acima

## 🧪 Testando com HTTPie

Se você usa HTTPie, aqui estão alguns exemplos:

```bash
# Criar livro
http POST localhost:8080/api/books \
  title="Clean Code" \
  isbn="9780132350884" \
  author="Robert C. Martin" \
  price:=59.99 \
  stockQuantity:=50

# Listar todos
http GET localhost:8080/api/books

# Buscar por ID
http GET localhost:8080/api/books/1

# Atualizar
http PUT localhost:8080/api/books/1 \
  title="Clean Code Updated" \
  isbn="9780132350884" \
  author="Robert C. Martin" \
  price:=64.99 \
  stockQuantity:=45

# Deletar
http DELETE localhost:8080/api/books/1
```

## 📊 Scripts de Teste Rápido

### Criar 5 livros de uma vez (Linux/Mac)

```bash
#!/bin/bash

books=(
  '{"title":"Clean Code","isbn":"9780132350884","author":"Robert C. Martin","price":59.99,"stockQuantity":50,"description":"A Handbook of Agile Software Craftsmanship"}'
  '{"title":"Effective Java","isbn":"9780134685991","author":"Joshua Bloch","price":54.99,"stockQuantity":30,"description":"Third Edition"}'
  '{"title":"Design Patterns","isbn":"9780201633610","author":"Gang of Four","price":64.99,"stockQuantity":25,"description":"Elements of Reusable Object-Oriented Software"}'
  '{"title":"Refactoring","isbn":"9780134757599","author":"Martin Fowler","price":49.99,"stockQuantity":40,"description":"Improving the Design of Existing Code"}'
  '{"title":"The Pragmatic Programmer","isbn":"9780201616224","author":"Andrew Hunt","price":44.99,"stockQuantity":35,"description":"From Journeyman to Master"}'
)

for book in "${books[@]}"; do
  curl -X POST http://localhost:8080/api/books \
    -H "Content-Type: application/json" \
    -d "$book"
  echo ""
done
```

Salve como `populate.sh`, dê permissão (`chmod +x populate.sh`) e execute (`./populate.sh`).

---

**Dica:** Use `jq` para formatar as respostas JSON de forma mais legível:
```bash
curl http://localhost:8080/api/books | jq
```

