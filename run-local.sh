#!/bin/bash

# Script para executar o BookStore API localmente
# Uso: ./run-local.sh

set -e

echo "🚀 Iniciando BookStore API..."
echo ""

# Verificar se Docker está rodando
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker não está rodando. Por favor, inicie o Docker primeiro."
    exit 1
fi

# Verificar se application.properties existe
if [ ! -f "src/main/resources/application.properties" ]; then
    echo "📝 Criando application.properties a partir do template..."
    cp src/main/resources/application.properties.example src/main/resources/application.properties
    echo "✅ application.properties criado"
fi

# Iniciar PostgreSQL
echo "🐘 Iniciando PostgreSQL..."
docker-compose up -d

# Aguardar PostgreSQL estar pronto
echo "⏳ Aguardando PostgreSQL estar pronto..."
sleep 5

# Verificar se PostgreSQL está rodando
if docker-compose ps | grep -q "Up"; then
    echo "✅ PostgreSQL está rodando"
else
    echo "❌ Erro ao iniciar PostgreSQL"
    exit 1
fi

# Compilar projeto
echo ""
echo "🔨 Compilando projeto..."
./mvnw clean compile -q
echo "✅ Compilação concluída"

# Executar aplicação
echo ""
echo "🎯 Iniciando aplicação Spring Boot..."
echo "📡 API estará disponível em: http://localhost:8080"
echo "📚 Endpoints: http://localhost:8080/api/books"
echo ""
echo "Pressione Ctrl+C para parar a aplicação"
echo ""

./mvnw spring-boot:run

