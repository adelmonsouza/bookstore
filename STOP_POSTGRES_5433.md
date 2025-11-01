# 🛑 Como Parar PostgreSQL na Porta 5433

Se você está tendo conflito com a porta 5433, siga estes passos para parar o PostgreSQL local:

## Método 1: Via Homebrew (Recomendado)

```bash
# Verificar quais serviços PostgreSQL estão rodando
brew services list | grep postgres

# Parar todos os serviços PostgreSQL do Homebrew
brew services stop postgresql@14
brew services stop postgresql@17

# Ou parar todos de uma vez
brew services stop --all | grep postgres
```

## Método 2: Via pg_ctl

```bash
# Para PostgreSQL 14
pg_ctl stop -D /opt/homebrew/var/postgresql@14

# Para PostgreSQL 17
pg_ctl stop -D /opt/homebrew/var/postgresql@17
```

## Método 3: Encontrar e Parar Processo Manualmente

```bash
# 1. Encontrar o PID do processo usando a porta 5433
lsof -ti :5433

# 2. Parar o processo (substitua PID pelo número encontrado)
kill PID

# Ou forçar parada se necessário
kill -9 PID
```

## Método 4: Verificar e Parar via psql

```bash
# Tentar conectar e verificar
psql -h localhost -p 5433 -U postgres

# Se conectar, você pode parar com:
# SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid();
```

## Verificar se Parou

```bash
# Verificar se a porta está livre
pg_isready -h localhost -p 5433

# Ou verificar diretamente
lsof -i :5433
```

## Depois de Parar

Após parar o PostgreSQL local, você pode iniciar o Docker Compose normalmente:

```bash
docker-compose up -d
./mvnw spring-boot:run
```

---

**Nota:** Se não conseguir parar, você pode usar outra porta (ex: 5434, 5436) alterando `compose.yaml` e `application.properties`.

