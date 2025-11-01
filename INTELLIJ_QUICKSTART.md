# ⚡ IntelliJ - Quick Start (5 minutos)

Guia rápido para começar a trabalhar no IntelliJ IDEA.

## 🎯 Passo a Passo Rápido

### 1. Abrir o Projeto
```
File → Open → Selecionar pasta: /Volumes/AdellServer/Projects/30days/BookStore-API
```

### 2. Aguardar Indexação
O IntelliJ vai indexar o projeto automaticamente (pode levar 1-2 minutos).

### 3. Verificar Configuração Java
```
File → Project Structure (Cmd+;)
→ Project → SDK: Java 17
→ Project → Language level: 17
```

### 4. Criar application.properties (SE AINDA NÃO EXISTIR)
O arquivo já foi criado automaticamente, mas se não estiver:
```
File → New → File
Nome: application.properties
Localização: src/main/resources/
Conteúdo: copie de application.properties.example
```

### 5. Iniciar PostgreSQL
No terminal do IntelliJ (View → Tool Windows → Terminal):
```bash
docker-compose up -d
```

**Nota:** O projeto usa porta **5433** (não 5432) para evitar conflitos.  
**Importante:** Se você tiver PostgreSQL local rodando na porta 5433, pare-o primeiro (veja `STOP_POSTGRES_5433.md`) ou o Spring Boot gerenciará automaticamente o Docker Compose.

### 6. Criar Run Configuration

**Opção A: Automático (Recomendado)**
1. Abra: `src/main/java/com/adelmon/bookstore/BookStoreApiApplication.java`
2. Clique no ícone ▶️ ao lado da classe (ou `Ctrl+Shift+F10`)
3. O IntelliJ criará automaticamente a configuração

**Opção B: Manual**
1. `Run → Edit Configurations`
2. `+ → Spring Boot`
3. Main class: `com.adelmon.bookstore.BookStoreApiApplication`
4. OK

### 7. Executar
- Pressione `Shift+F10` (ou clique no botão Run)
- Aguarde: `Started BookStoreApiApplication`

### 8. Testar
No terminal:
```bash
curl http://localhost:8080/api/books
```

## 🐛 Problemas Comuns

**"Cannot resolve symbol"**
→ `File → Invalidate Caches → Invalidate and Restart`

**"Port 8080 already in use"**
→ Altere em `application.properties`: `server.port=8081`

**"Port 5433 already allocated" / "Bind for 0.0.0.0:5433 failed"**
→ Pare o PostgreSQL local que está usando a porta 5433 (veja `STOP_POSTGRES_5433.md`)
→ Ou altere a porta em `compose.yaml` para outra (ex: 5434) e atualize `application.properties`
→ Verifique se `application.properties` tem: `spring.datasource.url=jdbc:postgresql://localhost:5433/bookstore`
→ Verifique se `compose.yaml` tem: `"5433:5432"` na seção ports

**"Cannot connect to database"**
→ Verifique: `docker-compose ps` (deve mostrar "Up")
→ Verifique se a porta no `application.properties` corresponde à porta do docker-compose (5433)
→ Certifique-se de que iniciou o PostgreSQL manualmente: `docker-compose up -d`
→ Verifique logs: `docker-compose logs postgres`

## ✅ Checklist

- [ ] Projeto aberto no IntelliJ
- [ ] Java 17 configurado
- [ ] `application.properties` existe
- [ ] PostgreSQL rodando (`docker-compose ps`)
- [ ] Aplicação executada
- [ ] API respondendo (`curl http://localhost:8080/api/books`)

---

**🎉 Pronto! Agora você pode desenvolver!**

