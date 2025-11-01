#!/bin/bash

# Script para parar PostgreSQL na porta 5433

echo "🔍 Identificando processo na porta 5433..."

# Tentar encontrar PID via lsof
PID=$(lsof -ti :5433 2>/dev/null | head -1)

if [ -n "$PID" ]; then
    echo "✅ Processo encontrado: PID $PID"
    ps -p $PID -o pid,comm,args 2>/dev/null
    
    echo ""
    echo "🛑 Parando processo..."
    kill $PID 2>/dev/null
    
    # Aguardar 2 segundos
    sleep 2
    
    # Verificar se ainda está rodando
    if kill -0 $PID 2>/dev/null; then
        echo "⚠️ Processo ainda rodando, forçando parada..."
        kill -9 $PID 2>/dev/null
        sleep 2
    fi
    
    echo "✅ Processo parado!"
else
    echo "❌ Nenhum processo encontrado via lsof"
    echo ""
    echo "Tentando métodos alternativos..."
    
    # Tentar parar via pg_ctl
    for dir in /opt/homebrew/var/postgresql@14 /opt/homebrew/var/postgresql@17; do
        if [ -d "$dir" ]; then
            echo "Tentando parar PostgreSQL em $dir..."
            pg_ctl stop -D "$dir" -m fast 2>/dev/null
        fi
    done
    
    # Tentar parar via brew services
    echo "Tentando parar serviços Homebrew..."
    brew services stop postgresql@14 2>/dev/null
    brew services stop postgresql@17 2>/dev/null
fi

echo ""
echo "🔍 Verificando se porta está livre..."
sleep 2

if pg_isready -h localhost -p 5433 2>/dev/null; then
    echo "⚠️ PostgreSQL ainda está rodando na porta 5433"
    echo ""
    echo "Tente manualmente:"
    echo "  sudo lsof -ti :5433 | xargs kill -9"
else
    echo "✅ Porta 5433 está livre!"
    echo ""
    echo "Agora você pode executar a aplicação no IntelliJ!"
fi

