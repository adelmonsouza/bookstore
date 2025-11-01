# 🚀 Configuração do IntelliJ IDEA

Guia completo para abrir e configurar o projeto BookStore API no IntelliJ IDEA.

## 📋 Pré-requisitos

- ✅ IntelliJ IDEA instalado (Community ou Ultimate)
- ✅ Java 17 instalado
- ✅ Docker instalado (para PostgreSQL)
- ✅ Git configurado

## 🔧 Passo a Passo

### 1. Abrir o Projeto

#### Opção A: Abrir pelo IntelliJ
1. Abra o IntelliJ IDEA
2. **File → Open** (ou `Cmd+O` no Mac / `Ctrl+O` no Windows)
3. Navegue até: `/Volumes/AdellServer/Projects/30days/BookStore-API`
4. Selecione a pasta e clique em **Open**

#### Opção B: Importar como Projeto Maven
1. **File → New → Project from Existing Sources**
2. Selecione a pasta do projeto
3. Escolha **Maven** como tipo de projeto
4. Clique em **Next** até finalizar

### 2. Configurar SDK do Java

1. **File → Project Structure** (ou `Cmd+;` / `Ctrl+Alt+Shift+S`)
2. Em **Project Settings → Project**:
   - **SDK:** Selecione Java 17
   - **Language level:** 17
3. Em **Project Settings → Modules**:
   - Verifique se o módulo está configurado corretamente
   - **Language level:** 17
4. Clique em **OK**

### 3. Configurar Maven

1. **File → Settings** (ou `Cmd+,` / `Ctrl+Alt+S`)
2. Navegue até: **Build, Execution, Deployment → Build Tools → Maven**
3. Verifique:
   - **Maven home path:** (geralmente já configurado)
   - **User settings file:** (deixe padrão)
4. Em **Maven → Runner**:
   - ✅ Marque **Delegate IDE build/run actions to Maven**
   - **JRE:** Java 17

### 4. Importar Dependências Maven

O IntelliJ deve fazer isso automaticamente, mas se não:
1. Abra o **Maven** tool window (View → Tool Windows → Maven)
2. Clique no ícone **Reload All Maven Projects** 🔄
3. Aguarde a importação das dependências

### 5. Criar application.properties Local

Como o `application.properties` não está no Git (por segurança), você precisa criá-lo:

1. **File → New → File**
2. Nome: `application.properties`
3. Localização: `src/main/resources/`
4. Copie o conteúdo de `application.properties.example`:
   ```properties
   spring.application.name=BookStore-API
   
   # Database Configuration
   spring.datasource.url=jdbc:postgresql://localhost:5432/bookstore
   spring.datasource.username=${DB_USERNAME:postgres}
   spring.datasource.password=${DB_PASSWORD:admin}
   
   # JPA/Hibernate Configuration
   spring.jpa.hibernate.ddl-auto=update
   spring.jpa.show-sql=true
   spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
   spring.jpa.properties.hibernate.format_sql=true
   
   # Server Configuration
   server.port=8080
   
   # Logging
   logging.level.com.adelmon.bookstore=DEBUG
   logging.level.org.springframework.web=INFO
   logging.level.org.hibernate.SQL=DEBUG
   logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
   ```

### 6. Configurar Run Configuration

1. **Run → Edit Configurations**
2. Clique em **+** → **Spring Boot**
3. Configure:
   - **Name:** `BookStore API`
   - **Main class:** `com.adelmon.bookstore.BookStoreApiApplication`
   - **VM options:** (deixe vazio)
   - **Working directory:** `$PROJECT_DIR$`
   - **Use classpath of module:** `BookStore-API`
4. Clique em **OK**

### 7. Iniciar PostgreSQL com Docker

**Antes de rodar a aplicação:**

```bash
# No terminal (fora do IntelliJ) ou no Terminal do IntelliJ
cd /Volumes/AdellServer/Projects/30days/BookStore-API
docker-compose up -d
```

**Ou no IntelliJ:**
1. Abra o terminal integrado: **View → Tool Windows → Terminal**
2. Execute: `docker-compose up -d`
3. Verifique: `docker ps` (deve mostrar o container `bookstore-postgres`)

### 8. Executar a Aplicação

1. Encontre a classe `BookStoreApiApplication.java`
2. Clique com botão direito → **Run 'BookStoreApiApplication'**
   - Ou use o atalho: `Shift+F10` (Windows/Linux) ou `Ctrl+R` (Mac)
   - Ou use a Run Configuration criada acima
3. Aguarde a inicialização
4. Você deve ver no console:
   ```
   Started BookStoreApiApplication in X.XXX seconds
   ```

### 9. Verificar se Está Funcionando

No terminal do IntelliJ ou em outro terminal:

```bash
# Testar se a API está respondendo
curl http://localhost:8080/api/books
```

Você deve receber uma resposta JSON vazia `[]` (se não houver livros ainda).

## 🔧 Configurações Recomendadas

### Code Style

1. **File → Settings → Editor → Code Style → Java**
2. Use as configurações padrão ou importe um estilo

### Plugins Úteis

1. **File → Settings → Plugins**
2. Considere instalar:
   - ✅ **Lombok** (se for usar)
   - ✅ **Spring Assistant** (já incluído em versões recentes)
   - ✅ **Git Integration** (já incluído)

### Live Templates

IntelliJ já tem templates úteis:
- `psvm` → `public static void main`
- `sout` → `System.out.println`
- `psf` → `public static final`

### Atalhos Úteis

| Ação | Mac | Windows/Linux |
|------|-----|---------------|
| Buscar classe | `Cmd+O` | `Ctrl+N` |
| Buscar arquivo | `Cmd+Shift+O` | `Ctrl+Shift+N` |
| Buscar em todos os lugares | `Shift+Shift` | `Double Shift` |
| Refatorar | `Ctrl+T` | `Ctrl+Alt+Shift+T` |
| Gerar código | `Cmd+N` | `Alt+Insert` |
| Formatar código | `Cmd+Alt+L` | `Ctrl+Alt+L` |
| Renomear | `Shift+F6` | `Shift+F6` |
| Executar | `Ctrl+R` | `Shift+F10` |
| Debug | `Ctrl+D` | `Shift+F9` |

## 🐛 Troubleshooting

### Erro: "Cannot resolve symbol"

**Solução:**
1. **File → Invalidate Caches → Invalidate and Restart**
2. Ou: **Maven → Reload All Maven Projects**

### Erro: "Port 8080 is already in use"

**Solução:**
1. Altere a porta no `application.properties`:
   ```properties
   server.port=8081
   ```
2. Ou pare o processo que está usando a porta

### Erro: "Cannot connect to database"

**Solução:**
1. Verifique se Docker está rodando: `docker ps`
2. Verifique se PostgreSQL está ativo: `docker-compose ps`
3. Reinicie o container: `docker-compose restart postgres`

### Dependências não são importadas

**Solução:**
1. **Maven → Reload All Maven Projects**
2. Verifique se o arquivo `pom.xml` está correto
3. Tente **File → Invalidate Caches**

### IntelliJ não reconhece Spring Boot

**Solução:**
1. Verifique se o plugin Spring Boot está habilitado
2. **File → Project Structure → Facets** → Adicione **Spring** facet se necessário
3. Reinicie o IntelliJ

## 🎯 Próximos Passos

1. ✅ Execute a aplicação
2. ✅ Teste os endpoints da API
3. ✅ Explore o código no IntelliJ
4. ✅ Adicione breakpoints e debug
5. ✅ Configure testes unitários

## 📚 Recursos

- [IntelliJ IDEA Documentation](https://www.jetbrains.com/help/idea/)
- [Spring Boot in IntelliJ](https://www.jetbrains.com/help/idea/spring-boot.html)
- [Maven in IntelliJ](https://www.jetbrains.com/help/idea/maven.html)

---

**Pronto! Agora você pode desenvolver no IntelliJ IDEA! 🎉**

