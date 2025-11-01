-- ============================================
-- DBeaver SQL Queries - BookStore API
-- ============================================
-- Cole estes queries no DBeaver SQL Editor

-- ============================================
-- 1. Verificar Estrutura da Tabela
-- ============================================
SELECT 
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'books'
ORDER BY ordinal_position;

-- ============================================
-- 2. Listar Todos os Livros
-- ============================================
SELECT * FROM books
ORDER BY id;

-- ============================================
-- 3. Ver Total de Livros
-- ============================================
SELECT COUNT(*) AS total_livros FROM books;

-- ============================================
-- 4. Ver Estatísticas
-- ============================================
SELECT 
    COUNT(*) AS total_livros,
    SUM(stock_quantity) AS total_estoque,
    ROUND(AVG(price::numeric), 2) AS preco_medio,
    MAX(price::numeric) AS preco_maximo,
    MIN(price::numeric) AS preco_minimo
FROM books;

-- ============================================
-- 5. Buscar por Autor
-- ============================================
SELECT * FROM books 
WHERE author ILIKE '%martin%'
ORDER BY title;

-- ============================================
-- 6. Buscar por Título
-- ============================================
SELECT * FROM books 
WHERE title ILIKE '%code%'
ORDER BY title;

-- ============================================
-- 7. Livros com Estoque Baixo
-- ============================================
SELECT 
    title,
    author,
    stock_quantity,
    price
FROM books
WHERE stock_quantity < 20
ORDER BY stock_quantity ASC;

-- ============================================
-- 8. Top 5 Livros Mais Caros
-- ============================================
SELECT 
    title,
    author,
    price,
    stock_quantity
FROM books
ORDER BY price DESC
LIMIT 5;

-- ============================================
-- 9. Livros por Autor (Agrupado)
-- ============================================
SELECT 
    author,
    COUNT(*) AS total_livros,
    SUM(stock_quantity) AS total_estoque
FROM books
GROUP BY author
ORDER BY total_livros DESC;

-- ============================================
-- 10. Ver Últimos Livros Criados
-- ============================================
SELECT 
    id,
    title,
    author,
    created_at
FROM books
ORDER BY created_at DESC
LIMIT 10;

-- ============================================
-- 11. Verificar Constraints e Índices
-- ============================================
SELECT
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_schema = 'public'
  AND tc.table_name = 'books';

-- ============================================
-- 12. Ver Índices da Tabela
-- ============================================
SELECT
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND tablename = 'books';

-- ============================================
-- 13. Livros Criados Hoje
-- ============================================
SELECT * FROM books
WHERE DATE(created_at) = CURRENT_DATE
ORDER BY created_at DESC;

-- ============================================
-- 14. Valor Total do Estoque
-- ============================================
SELECT 
    COUNT(*) AS total_livros,
    SUM(stock_quantity) AS total_unidades,
    ROUND(SUM(stock_quantity * price::numeric), 2) AS valor_total_estoque
FROM books;

-- ============================================
-- 15. Pesquisa Full-Text (Título ou Autor)
-- ============================================
SELECT * FROM books
WHERE 
    title ILIKE '%keyword%' 
    OR author ILIKE '%keyword%'
    OR description ILIKE '%keyword%'
ORDER BY title;

-- ============================================
-- DICA: Use estas queries no DBeaver para
-- analisar seus dados enquanto desenvolve!
-- ============================================

