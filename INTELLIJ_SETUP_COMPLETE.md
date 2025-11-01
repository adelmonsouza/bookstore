# ✅ Configuração Completa do IntelliJ - BookStore API

Guia passo a passo após as mudanças de configuração (porta 5433, Docker Compose automático).

## 🎯 Passo a Passo no IntelliJ

### 1. Abrir o Projeto (se ainda não abriu)

```
File → Open → Selecionar: /Volumes/AdellServer/Projects/30days/BookStore-API
```

### 2. Aguardar Indexação

O IntelliJ vai:
- Indexar o projeto Maven
- Baixar dependências
- Resolver classes

**Aguarde até ver "Indexing completed" na barra de status** (canto inferior direito).

### 3. Verificar Configuração Java

```
File → Project Structure (Cmd+; no Mac, Ctrl+Alt+Shift+S no Windows/Linux)
```

Verificar:
- **Project → SDK:** Java 17 ou 21 (o que você tiver instalado)
- **Project → Language level:** 17 ou 21
- **Modules → Language level:** Mesmo do Project

### 4. Verificar/Criar application.properties

**Verificar se existe:**
- Navegue até: `src/main/resources/application.properties`

**Se NÃO existir:**
1. Clique com botão direito em `src/main/resources/`
2. **New → File**
3. Nome: `application.properties`
4. **Copie o conteúdo de** `application.properties.example`

**Conteúdo deve ter:**
```properties
spring.datasource.url=jdbc:postgresql://localhost:5433/bookstore
spring.datasource.username=${DB_USERNAME:postgres}
spring.datasource.password=${DB_PASSWORD:admin}
```

### 5. IMPORTANTE: Parar PostgreSQL Local

**Antes de executar**, você precisa parar o PostgreSQL local que está na porta 5433:

**No Terminal do IntelliJ** (View → Tool Windows → Terminal):
```bash
brew services stop postgresql@14 postgresql@17
```

Ou veja `STOP_POSTGRES_5433.md` para mais opções.

**Verificar se parou:**
```bash
pg_isready -h localhost -p 5433
# Deve retornar erro (porta livre)
```

### 6. Criar Run Configuration

**Opção A: Automático (Mais Fácil)**
1. Abra: `src/main/java/com/adelmon/bookstore/BookStoreApiApplication.java`
2. Clique no ícone ▶️ ao lado da linha `public static void main` (ou `Ctrl+Shift+F10`)
3. O IntelliJ criará automaticamente a configuração Spring Boot

**Opção B: Manual**
1. `Run → Edit Configurations...`
2. Clique em `+` → `Spring Boot`
3. Configure:
   - **Name:** `BookStore API`
   - **Main class:** `com.adelmon.bookstore.BookStoreApiApplication`
   - **Working directory:** `$PROJECT_DIR$`
   - **Use classpath of module:** `BookStore-API`
4. Clique em **OK**

### 7. Executar a Aplicação

1. Selecione a Run Configuration criada (barra superior)
2. Clique no botão ▶️ Run (ou pressione `Shift+F10` / `Ctrl+R` no Mac)

**O que vai acontecer:**
1. Spring Boot detecta `compose.yaml`
2. **Automaticamente inicia** o container PostgreSQL
3. Aguarda o PostgreSQL ficar pronto
4. Inicia a aplicação
5. Conecta ao banco de dados

**Aguarde ver no console:**
```
Started BookStoreApiApplication in X.XXX seconds
```

### 8. Verificar se Funcionou

**No terminal do IntelliJ:**
```bash
# Testar API
curl http://localhost:8080/api/books
# Deve retornar: [] (array vazio - nenhum livro ainda)

# Verificar container
docker ps | grep bookstore-postgres
# Deve mostrar o container rodando na porta 5433
```

## ✅ Checklist Rápido

- [ ] Projeto aberto no IntelliJ
- [ ] Indexação completa
- [ ] Java 17/21 configurado
- [ ] `application.properties` existe e está correto (porta 5433)
- [ ] PostgreSQL local parado (`brew services stop`)
- [ ] Run Configuration criada
- [ ] Aplicação executada com sucesso
- [ ] API respondendo (`curl http://localhost:8080/api/books`)

## 🐛 Problemas Comuns

### Erro: "Port 5433 already allocated"
→ Você não parou o PostgreSQL local
→ Execute: `brew services stop postgresql@14 postgresql@17`

### Erro: "Cannot resolve symbol"
→ `File → Invalidate Caches → Invalidate and Restart`
→ Aguarde reindexar

### Erro: "Cannot connect to database"
→ Verifique se o container está rodando: `docker ps`
→ Verifique logs: `docker-compose logs postgres`
→ Verifique se `application.properties` tem a porta correta (5433)

### Docker Compose não inicia automaticamente
→ Verifique se o arquivo `compose.yaml` está na raiz do projeto
→ O Spring Boot deve detectar automaticamente

## 🎉 Pronto!

Agora você pode:
- ✅ Desenvolver no IntelliJ
- ✅ Adicionar breakpoints e debugar
- ✅ Ver logs no console
- ✅ Usar todas as ferramentas do IntelliJ

**Dica:** Use o terminal integrado do IntelliJ (View → Tool Windows → Terminal) para executar comandos Docker enquanto desenvolve.

