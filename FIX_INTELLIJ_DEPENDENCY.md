# 🔧 Corrigir Erro de Dependência no IntelliJ

## Problema
```
Unresolved dependency: 'org.springframework.boot:spring-boot-docker-compose:jar:3.5.7'
```

Isso acontece quando o IntelliJ não sincronizou corretamente com o Maven.

## ✅ Soluções (Tente na ordem)

### Solução 1: Reload Maven Project (Mais Rápido)

1. Abra o **Maven** tool window:
   - `View → Tool Windows → Maven`
   - Ou clique no ícone **Maven** na barra lateral direita

2. Clique no ícone **Reload All Maven Projects** 🔄
   - É o botão circular com setas no topo da janela Maven
   - Ou: `Ctrl+Shift+O` (Windows/Linux) / `Cmd+Shift+I` (Mac)

3. Aguarde a sincronização completar

### Solução 2: Reimport Maven Project

1. Clique com botão direito no arquivo `pom.xml` na raiz do projeto
2. Selecione **Maven → Reload project**
3. Aguarde

### Solução 3: Invalidate Caches

1. `File → Invalidate Caches...`
2. Marque todas as opções:
   - ✅ Clear file system cache and Local History
   - ✅ Clear downloaded shared indexes
   - ✅ Clear VCS Log caches and indexes
3. Clique em **Invalidate and Restart**
4. Aguarde o IntelliJ reiniciar e reindexar

### Solução 4: Forçar Download das Dependências

No Terminal do IntelliJ (`View → Tool Windows → Terminal`):

```bash
# Limpar e baixar dependências novamente
./mvnw clean install -U

# Ou atualizar dependências
./mvnw dependency:resolve
```

Depois, volte à **Solução 1** (Reload Maven Projects).

### Solução 5: Configurar Maven no IntelliJ

1. `File → Settings` (ou `Cmd+,` / `Ctrl+Alt+S`)
2. Navegue até: **Build, Execution, Deployment → Build Tools → Maven**
3. Verifique:
   - **Maven home path:** (deve apontar para Maven instalado ou usar wrapper)
   - **User settings file:** (geralmente `~/.m2/settings.xml`)
   - ✅ Marque **"Use Maven wrapper"** (se disponível)
4. Em **Maven → Runner**:
   - **JRE:** Use o mesmo Java do projeto (Java 21)
5. Clique em **OK**
6. **Reload Maven Projects** (Solução 1)

## ✅ Verificar se Funcionou

1. Abra o arquivo `pom.xml`
2. O IntelliJ não deve mais mostrar erros (linhas vermelhas)
3. No **Maven** tool window, todas as dependências devem aparecer sem erros

## 🔍 Verificação Adicional

**Se ainda não funcionar**, verifique se o Maven está funcionando no terminal:

```bash
./mvnw dependency:tree | grep docker-compose
```

Deve mostrar:
```
[INFO]    org.springframework.boot:spring-boot-docker-compose:jar:3.5.7:runtime
```

Se aparecer no terminal mas não no IntelliJ, é definitivamente um problema de sincronização.

## 💡 Dica

Após qualquer mudança no `pom.xml`, sempre:
1. Reload Maven Projects (Solução 1)
2. Aguarde o IntelliJ sincronizar (pode levar alguns segundos)

---

**A maioria dos casos resolve com a Solução 1 (Reload Maven Projects)!**

