# 📚 BookStore API

Uma API RESTful moderna desenvolvida com **Java 17** e **Spring Boot 3.5.7** para gerenciamento de uma livraria, seguindo as melhores práticas da indústria.

## 🚀 Stack Tecnológica

- **Java 17** - Linguagem de programação
- **Spring Boot 3.5.7** - Framework principal
- **Spring Data JPA** - Persistência de dados
- **PostgreSQL 15** - Banco de dados relacional
- **Docker & Docker Compose** - Containerização
- **Maven** - Gerenciamento de dependências
- **Jakarta Validation** - Validação de dados

## 📋 Funcionalidades

- ✅ CRUD completo de livros
- ✅ Busca de livros por ID, ISBN, título ou autor
- ✅ Validação de dados de entrada
- ✅ Tratamento global de exceções
- ✅ DTOs para separação de camadas
- ✅ Auditoria de timestamps (createdAt, updatedAt)
- ✅ Controle de estoque
- ✅ API RESTful seguindo convenções HTTP

## 🏗️ Arquitetura

O projeto segue a arquitetura em camadas (Layered Architecture):

```
com.adelmon.bookstore/
├── controller/     # Camada de apresentação (REST Controllers)
├── service/        # Camada de lógica de negócio
├── repository/     # Camada de acesso a dados
├── model/          # Entidades JPA
├── dto/            # Data Transfer Objects (Request/Response)
├── exception/      # Tratamento de exceções
└── config/         # Configurações da aplicação
```

## 🛠️ Pré-requisitos

- Java 17 ou superior
- Maven 3.6+
- Docker e Docker Compose
- PostgreSQL 15 (ou via Docker)

## 📦 Instalação e Configuração

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/BookStore-API.git
cd BookStore-API
```

### 2. Configure o banco de dados

A aplicação está configurada para usar PostgreSQL via Docker Compose. Para iniciar o banco:

```bash
docker-compose up -d
```

Isso criará um container PostgreSQL com as seguintes credenciais:
- **Database:** `bookstore`
- **Username:** `postgres`
- **Password:** `admin`
- **Port:** `5432`

### 3. Execute a aplicação

```bash
# Compilar e executar
./mvnw spring-boot:run

# Ou se preferir compilar primeiro
./mvnw clean install
java -jar target/BookStore-API-0.0.1-SNAPSHOT.jar
```

A aplicação estará disponível em: `http://localhost:8080`

## 📡 Endpoints da API

### Base URL: `http://localhost:8080/api/books`

#### 1. Listar todos os livros
```http
GET /api/books
```

**Resposta:**
```json
[
  {
    "id": 1,
    "title": "Clean Code",
    "isbn": "9780132350884",
    "author": "Robert C. Martin",
    "price": 59.99,
    "stockQuantity": 10,
    "description": "A Handbook of Agile Software Craftsmanship",
    "createdAt": "2024-11-01T10:00:00",
    "updatedAt": "2024-11-01T10:00:00"
  }
]
```

#### 2. Buscar livro por ID
```http
GET /api/books/{id}
```

#### 3. Buscar livro por ISBN
```http
GET /api/books/isbn/{isbn}
```

#### 4. Pesquisar livros
```http
GET /api/books/search?keyword={keyword}
```

#### 5. Criar novo livro
```http
POST /api/books
Content-Type: application/json

{
  "title": "Effective Java",
  "isbn": "9780134685991",
  "author": "Joshua Bloch",
  "price": 54.99,
  "stockQuantity": 15,
  "description": "Third Edition"
}
```

#### 6. Atualizar livro
```http
PUT /api/books/{id}
Content-Type: application/json

{
  "title": "Effective Java",
  "isbn": "9780134685991",
  "author": "Joshua Bloch",
  "price": 59.99,
  "stockQuantity": 12,
  "description": "Third Edition - Updated"
}
```

#### 7. Atualizar estoque
```http
PATCH /api/books/{id}/stock?quantity=20
```

#### 8. Deletar livro
```http
DELETE /api/books/{id}
```

## 🧪 Testando a API

### Usando cURL

#### Criar um livro
```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "The Clean Coder",
    "isbn": "9780137081073",
    "author": "Robert C. Martin",
    "price": 45.99,
    "stockQuantity": 25,
    "description": "A Code of Conduct for Professional Programmers"
  }'
```

#### Listar todos os livros
```bash
curl http://localhost:8080/api/books
```

#### Buscar por ID
```bash
curl http://localhost:8080/api/books/1
```

### Usando Postman ou Insomnia

Importe a coleção de requisições ou crie suas próprias requisições seguindo os exemplos acima.

## 🗄️ Estrutura do Banco de Dados

### Tabela: `books`

| Campo | Tipo | Descrição |
|-------|------|-----------|
| id | BIGSERIAL | Chave primária |
| title | VARCHAR(255) | Título do livro |
| isbn | VARCHAR(13) | ISBN único |
| author | VARCHAR(255) | Nome do autor |
| price | DECIMAL(10,2) | Preço do livro |
| stock_quantity | INTEGER | Quantidade em estoque |
| description | VARCHAR(1000) | Descrição do livro |
| created_at | TIMESTAMP | Data de criação |
| updated_at | TIMESTAMP | Última atualização |

## 🔧 Configurações

### Configuração Inicial

1. **Copiar template de configuração:**
```bash
cp src/main/resources/application.properties.example \
   src/main/resources/application.properties
```

2. **Editar `application.properties` com suas credenciais:**
```properties
# Database (use variáveis de ambiente em produção!)
# Nota: Usando porta 5433 para evitar conflitos (porta 5432 já está em uso)
spring.datasource.url=jdbc:postgresql://localhost:5433/bookstore
spring.datasource.username=${DB_USERNAME:postgres}
spring.datasource.password=${DB_PASSWORD:admin}

# JPA
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

# Server
server.port=${SERVER_PORT:8080}
```

### Configuração do Docker Compose

1. **Copiar template:**
```bash
cp compose.yaml.example compose.yaml
```

2. **Usar variáveis de ambiente:**
```bash
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=sua_senha_segura
docker-compose up -d
```

**⚠️ IMPORTANTE:** Veja [SECURITY.md](SECURITY.md) para boas práticas de segurança e proteção de dados sensíveis.

## 📝 Validações Implementadas

- **Title:** Obrigatório, 1-255 caracteres
- **ISBN:** Obrigatório, 10-13 caracteres, único
- **Author:** Obrigatório, 1-255 caracteres
- **Price:** Obrigatório, maior que 0
- **Stock Quantity:** Não negativo
- **Description:** Máximo 1000 caracteres

## ⚠️ Tratamento de Erros

A API retorna respostas de erro padronizadas:

```json
{
  "status": 404,
  "message": "Book not found with id: 1",
  "timestamp": "2024-11-01T10:00:00"
}
```

### Códigos HTTP:
- `200 OK` - Sucesso
- `201 Created` - Recurso criado
- `204 No Content` - Deletado com sucesso
- `400 Bad Request` - Validação falhou
- `404 Not Found` - Recurso não encontrado
- `409 Conflict` - Conflito (ex: ISBN duplicado)
- `500 Internal Server Error` - Erro interno

## 🚢 Docker

### Subir o banco de dados
```bash
docker-compose up -d
```

### Parar o banco de dados
```bash
docker-compose down
```

### Ver logs
```bash
docker-compose logs -f postgres
```

## 🧑‍💻 Desenvolvimento

### Estrutura de Pacotes

```
src/main/java/com/adelmon/bookstore/
├── BookStoreApiApplication.java
├── controller/
│   └── BookController.java
├── service/
│   └── BookService.java
├── repository/
│   └── BookRepository.java
├── model/
│   └── Book.java
├── dto/
│   ├── BookRequest.java
│   └── BookResponse.java
├── exception/
│   ├── ResourceNotFoundException.java
│   ├── DuplicateResourceException.java
│   └── GlobalExceptionHandler.java
└── config/
    └── CorsConfig.java
```

### Build do projeto
```bash
./mvnw clean install
```

### Executar testes
```bash
./mvnw test
```

## 📈 Roadmap

- [ ] Adicionar autenticação e autorização (JWT)
- [ ] Implementar paginação e ordenação
- [ ] Adicionar testes unitários e de integração
- [ ] Implementar cache (Redis)
- [ ] Adicionar documentação com Swagger/OpenAPI
- [ ] Implementar filtros avançados de busca
- [ ] Adicionar suporte a múltiplos idiomas
- [ ] Implementar sistema de categorias
- [ ] Adicionar upload de imagens dos livros
- [ ] Implementar relatórios e estatísticas

## 🤝 Contribuindo

Este é um projeto pessoal de aprendizado, mas sugestões e melhorias são bem-vindas!

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👤 Autor

**Adelmon**
- GitHub: [@seu-usuario](https://github.com/seu-usuario)
- LinkedIn: [Seu Perfil](https://linkedin.com/in/seu-perfil)

## 📚 Documentação Adicional

### 🚀 Início Rápido
- 📖 [API_EXAMPLES.md](API_EXAMPLES.md) - Exemplos práticos de uso da API
- 🚀 [QUICKSTART.md](QUICKSTART.md) - Guia de início rápido (3 minutos)
- 💻 [INTELLIJ_SETUP.md](INTELLIJ_SETUP.md) - Configuração completa do IntelliJ IDEA

### 🔒 Segurança e Qualidade
- 🔒 [SECURITY.md](SECURITY.md) - Guia de segurança e proteção de dados sensíveis
- ✅ [PRE_COMMIT_CHECKLIST.md](PRE_COMMIT_CHECKLIST.md) - Checklist antes de fazer commit
- 🤝 [CONTRIBUTING.md](CONTRIBUTING.md) - Guia de contribuição e padrões de código

### 📤 Git e GitHub
- 📤 [GITHUB_SETUP.md](GITHUB_SETUP.md) - Configuração inicial do repositório GitHub
- 📤 [GITHUB_PUSH.md](GITHUB_PUSH.md) - Guia rápido para fazer push

## 🔒 Segurança

**⚠️ IMPORTANTE:** Este projeto segue boas práticas de segurança:

- Credenciais devem ser configuradas via variáveis de ambiente
- Templates de configuração (`.example`) são fornecidos
- `application.properties` está no `.gitignore`
- Nunca commite informações sensíveis

Veja [SECURITY.md](SECURITY.md) para detalhes completos.

## 📚 Recursos de Aprendizado

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Spring Data JPA](https://spring.io/projects/spring-data-jpa)
- [RESTful API Best Practices](https://restfulapi.net/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Clean Code Principles](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)

---

**Desenvolvido com ❤️ durante o desafio de 30 dias de desenvolvimento Java/Spring Boot**

*Última atualização: Novembro 2024*

