# 🗄️ Configuração do DBeaver - BookStore API

Guia completo para conectar o DBeaver ao banco de dados PostgreSQL do projeto.

## 📋 Informações de Conexão

```
Host:     localhost
Port:     5434
Database: bookstore
Username: postgres
Password: admin
```

## 🚀 Passo a Passo no DBeaver

### 1. Abrir DBeaver

Se não tiver instalado:
- Download: https://dbeaver.io/download/
- Instale e abra o DBeaver

### 2. Criar Nova Conexão

1. **Clique em "New Database Connection"** (ícone de plug na barra superior)
   - Ou: `Database → New Database Connection`
   - Ou atalho: `Ctrl+Shift+N` (Windows/Linux) / `Cmd+Shift+N` (Mac)

2. **Selecione PostgreSQL**
   - Na lista de bancos, escolha **PostgreSQL**
   - Clique em **Next >**

### 3. Configurar Conexão

Preencha os campos:

#### Main Tab
- **Host:** `localhost`
- **Port:** `5434` ⚠️ **IMPORTANTE: Porta 5434 (não 5432)**
- **Database:** `bookstore`
- **Username:** `postgres`
- **Password:** `admin`
- ✅ **Marque "Save password"** (opcional, mas útil)

#### Driver Properties (Opcional)
Se quiser ajustar timeouts:
- Clique em **Driver properties**
- Ou deixe os padrões

### 4. Testar Conexão

1. Clique em **"Test Connection"**
2. Se for a primeira vez, o DBeaver pode pedir para baixar o driver PostgreSQL
   - Clique em **"Download"** se aparecer
   - Aguarde o download

3. **Deve aparecer:**
   ```
   Connected
   PostgreSQL 15.x
   ```

4. Se der erro, verifique:
   - Container PostgreSQL está rodando: `docker ps | grep bookstore-postgres`
   - Porta está correta (5434)
   - Senha está correta (admin)

### 5. Finalizar

1. Clique em **"Finish"**
2. A conexão aparecerá na árvore de conexões à esquerda
3. Expanda para ver:
   - **bookstore** (database)
   - **Schemas → public**
   - **Tables → books** (depois de criar dados)

## 🗂️ Explorando o Banco

### Ver Estrutura da Tabela

1. Expanda: `bookstore → Schemas → public → Tables → books`
2. Clique com botão direito em `books`
3. Selecione **"View Table"** ou **"Edit Table"**

### Ver Dados

1. Clique com botão direito em `books`
2. Selecione **"View Data"** ou **"Edit Data"**
3. Você verá todos os livros cadastrados

### Executar Queries SQL

1. Clique com botão direito em `bookstore`
2. Selecione **"SQL Editor → New SQL Script"**
3. Ou use atalho: `Ctrl+]` (Windows/Linux) / `Cmd+]` (Mac)

**Exemplos de queries:**

```sql
-- Listar todos os livros
SELECT * FROM books;

-- Contar livros
SELECT COUNT(*) FROM books;

-- Buscar por autor
SELECT * FROM books WHERE author LIKE '%Martin%';

-- Ver estrutura da tabela
\d books

-- Ou
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'books';
```

### Acompanhar em Tempo Real

**Para ver mudanças enquanto desenvolve:**

1. Abra a tabela `books` em **"View Data"**
2. Clique no botão **"Refresh"** (F5) periodicamente
3. Ou configure auto-refresh:
   - **View → Data Editor → Auto-refresh**
   - Configure intervalo (ex: 5 segundos)

## 🔄 Sincronizar com Mudanças da API

### Ver Dados Após Criar Livro via API

1. Crie um livro via API (curl, Postman, etc.)
2. No DBeaver, pressione **F5** para atualizar
3. O novo livro aparecerá na tabela

### Ver Mudanças Após UPDATE/DELETE

- Execute **F5** após cada operação
- Ou use auto-refresh para ver em tempo real

## 📊 Funcionalidades Úteis do DBeaver

### 1. Executar SQL
- Crie scripts SQL complexos
- Execute queries de análise
- Veja resultados formatados

### 2. Exportar Dados
- Clique com botão direito na tabela
- **Export Data** → Escolha formato (CSV, Excel, JSON, etc.)

### 3. Visualizar Relacionamentos
- Veja estrutura de tabelas
- Entenda schema do banco
- Veja índices e constraints

### 4. Monitorar Performance
- Veja queries executadas
- Analise tempo de execução
- Identifique queries lentas

## 🐛 Troubleshooting

### Erro: "Connection refused"
→ Verifique se container está rodando:
```bash
docker ps | grep bookstore-postgres
```

### Erro: "Authentication failed"
→ Verifique credenciais:
- Username: `postgres`
- Password: `admin`
- Port: `5434`

### Erro: "Database does not exist"
→ O banco `bookstore` será criado automaticamente na primeira execução
→ Certifique-se de que a aplicação Spring Boot já rodou pelo menos uma vez

### Driver não encontrado
→ DBeaver deve baixar automaticamente
→ Se não funcionar: `Database → Driver Manager → PostgreSQL → Edit → Download`

## ✅ Checklist

- [ ] DBeaver instalado
- [ ] Conexão criada com porta 5434
- [ ] Conexão testada com sucesso
- [ ] Tabela `books` visível
- [ ] Dados sendo exibidos corretamente

## 📝 Exemplo de Uso

### Verificar Dados Após Criar Livro

1. **No Terminal/Postman:**
```bash
curl -X POST http://localhost:8080/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Effective Java",
    "isbn": "9780134685991",
    "author": "Joshua Bloch",
    "price": 54.99,
    "stockQuantity": 30
  }'
```

2. **No DBeaver:**
   - Abra tabela `books`
   - Pressione **F5** (refresh)
   - Novo livro aparece na lista!

### Query Personalizada

```sql
-- Ver livros com estoque baixo
SELECT title, author, stock_quantity 
FROM books 
WHERE stock_quantity < 20 
ORDER BY stock_quantity ASC;

-- Ver livros mais caros
SELECT title, author, price 
FROM books 
ORDER BY price DESC 
LIMIT 5;

-- Estatísticas
SELECT 
    COUNT(*) as total_books,
    SUM(stock_quantity) as total_stock,
    AVG(price) as avg_price,
    MAX(price) as max_price,
    MIN(price) as min_price
FROM books;
```

## 🎯 Próximos Passos

Agora você pode:
- ✅ Ver dados em tempo real
- ✅ Executar queries SQL
- ✅ Analisar estrutura do banco
- ✅ Exportar dados
- ✅ Monitorar mudanças

---

**Dica:** Configure um auto-refresh para ver mudanças em tempo real enquanto desenvolve!**

