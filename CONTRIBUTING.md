# 🤝 Guia de Contribuição

Obrigado por considerar contribuir com o projeto BookStore API!

## 📋 Tabela de Conteúdos

- [Código de Conduta](#código-de-conduta)
- [Como Contribuir](#como-contribuir)
- [Padrões de Código](#padrões-de-código)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Commit Messages](#commit-messages)
- [Pull Requests](#pull-requests)

## 📜 Código de Conduta

Este projeto segue o [Código de Conduta do Contributor Covenant](https://www.contributor-covenant.org/).

## 🚀 Como Contribuir

### 1. Fork e Clone

```bash
# Fork o repositório no GitHub
# Clone seu fork
git clone https://github.com/seu-usuario/BookStore-API.git
cd BookStore-API

# Adicionar upstream
git remote add upstream https://github.com/original/BookStore-API.git
```

### 2. Criar Branch

```bash
# Sempre crie uma branch para suas mudanças
git checkout -b feature/nome-da-feature
# ou
git checkout -b fix/descricao-do-bug
```

### 3. Fazer Mudanças

- Siga os [Padrões de Código](#padrões-de-código)
- Escreva código limpo e bem documentado
- Adicione testes quando apropriado
- Atualize a documentação se necessário

### 4. Commit

```bash
git add .
git commit -m "feat: adiciona nova funcionalidade X"
```

Veja [Commit Messages](#commit-messages) para o formato correto.

### 5. Push e Pull Request

```bash
git push origin feature/nome-da-feature
```

Depois abra um Pull Request no GitHub.

## 📐 Padrões de Código

### Clean Code Principles

1. **Nomes Significativos**
   ```java
   // ❌ Ruim
   String s = "John";
   int x = 5;
   
   // ✅ Bom
   String customerName = "John";
   int numberOfBooks = 5;
   ```

2. **Funções Pequenas e Focadas**
   - Uma função deve fazer apenas uma coisa
   - Máximo 20-30 linhas por função
   - Nomes descritivos

3. **Comentários Úteis**
   ```java
   // ❌ Ruim - comentário óbvio
   // Incrementa o contador
   counter++;
   
   // ✅ Bom - explica o "porquê"
   // Incrementa o contador após cada venda para manter
   // o número de transações atualizado no relatório
   counter++;
   ```

4. **Tratamento de Erros**
   - Use exceções apropriadas
   - Mensagens de erro claras
   - Não engula exceções silenciosamente

5. **DRY (Don't Repeat Yourself)**
   - Evite duplicação de código
   - Extraia métodos comuns

### Convenções Java

- **Nomenclatura:**
  - Classes: `PascalCase` (ex: `BookController`)
  - Métodos/Variáveis: `camelCase` (ex: `getBookById`)
  - Constantes: `UPPER_SNAKE_CASE` (ex: `MAX_BOOKS`)

- **Formatação:**
  - Use 4 espaços para indentação
  - Linhas máximas de 120 caracteres
  - Adicione espaços ao redor de operadores

- **Estrutura de Classes:**
  ```java
  public class BookController {
      // 1. Constantes
      private static final String BASE_PATH = "/api/books";
      
      // 2. Campos
      private final BookService bookService;
      
      // 3. Construtores
      @Autowired
      public BookController(BookService bookService) {
          this.bookService = bookService;
      }
      
      // 4. Métodos públicos
      // 5. Métodos privados
  }
  ```

### Spring Boot Best Practices

1. **Dependency Injection:**
   ```java
   // ✅ Prefer constructor injection
   @Autowired
   public BookService(BookRepository bookRepository) {
       this.bookRepository = bookRepository;
   }
   ```

2. **Annotations:**
   - Use `@Valid` para validação
   - Use `@Transactional` apropriadamente
   - Evite anotações desnecessárias

3. **Response Entities:**
   ```java
   // ✅ Sempre retorne ResponseEntity com status apropriado
   return ResponseEntity.ok(book);
   return new ResponseEntity<>(book, HttpStatus.CREATED);
   return ResponseEntity.noContent().build();
   ```

## 📁 Estrutura do Projeto

```
src/main/java/com/adelmon/bookstore/
├── controller/      # REST Controllers
├── service/         # Business Logic
├── repository/      # Data Access
├── model/           # JPA Entities
├── dto/             # Data Transfer Objects
├── exception/       # Custom Exceptions
└── config/         # Configuration Classes
```

### Onde Adicionar Novos Arquivos?

- **Nova entidade?** → `model/`
- **Novo endpoint?** → `controller/`
- **Nova regra de negócio?** → `service/`
- **Nova query?** → `repository/`
- **Novo DTO?** → `dto/`
- **Nova exceção?** → `exception/`
- **Nova configuração?** → `config/`

## 📝 Commit Messages

Siga o padrão [Conventional Commits](https://www.conventionalcommits.org/):

```
<tipo>: <descrição curta>

<descrição detalhada (opcional)>

<footer (opcional)>
```

### Tipos:

- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Documentação
- `style:` Formatação (não afeta código)
- `refactor:` Refatoração
- `test:` Testes
- `chore:` Manutenção

### Exemplos:

```bash
feat: add book search by category
fix: correct ISBN validation logic
docs: update API examples with new endpoints
refactor: extract book validation to separate method
test: add unit tests for BookService
chore: update dependencies
```

## 🔍 Pull Requests

### Checklist do Pull Request:

- [ ] ✅ Código segue os padrões do projeto
- [ ] ✅ Documentação atualizada (se necessário)
- [ ] ✅ Testes adicionados/atualizados
- [ ] ✅ Build passa sem erros
- [ ] ✅ Commit messages seguem convenção
- [ ] ✅ Branch está atualizada com main
- [ ] ✅ Nenhuma informação sensível exposta

### Template de Pull Request:

```markdown
## Descrição
Breve descrição das mudanças

## Tipo de Mudança
- [ ] Bug fix
- [ ] Nova funcionalidade
- [ ] Breaking change
- [ ] Documentação

## Como testar
Instruções de como testar as mudanças

## Checklist
- [ ] Código testado
- [ ] Documentação atualizada
- [ ] Sem breaking changes
```

## 🧪 Testes

### Antes de Submeter:

```bash
# Executar testes
./mvnw test

# Compilar projeto
./mvnw clean install

# Verificar formatação
# Use o formato do projeto
```

## 📚 Recursos

- [Clean Code by Robert C. Martin](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Java Code Conventions](https://www.oracle.com/java/technologies/javase/codeconventions-contents.html)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

**Obrigado por contribuir! 🎉**

