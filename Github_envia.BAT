@echo off
setlocal enabledelayedexpansion
:: ======================================================
:: CONFIGURACOES DE PRODUCAO
:: ======================================================
set REPO_URL=https://github.com/suportedbnet-ux/totalcap-docs.git
set GIT_USER=suportedbnet-ux
set GIT_EMAIL=suporte.dbnet@gmail.com
set DIST_DIR=C:\Sistema\Doctotal
:: ======================================================

:: 1. Validar se esta no diretorio correto
if not exist "%DIST_DIR%\mkdocs.yml" (
    echo [!] ERRO: Arquivo mkdocs.yml nao encontrado em %DIST_DIR%
    pause
    exit /b 1
)

:: 2. Gerar data/hora sem caracteres especiais
for /f "tokens=1-3 delims=/ " %%a in ('echo %date%') do set DATA=%%a%%b%%c
for /f "tokens=1-2 delims=: " %%a in ('echo %time%') do set HORA=%%a%%b
set DT=%DATE:/=%%_%HORA%

:: 3. Configuracao do Git de Documentacao
pushd "%DIST_DIR%"

echo [1/4] Configurando Git...
if not exist .git (
    git init
) else (
    echo     Git ja inicializado.
)

git config user.name "%GIT_USER%"
git config user.email "%GIT_EMAIL%"

:: Verificar se o remote origin ja existe
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin %REPO_URL%
) else (
    git remote set-url origin %REPO_URL%
)

:: 4. Commit e Push (codificacao UTF-8 para evitar caracteres estranhos)
echo [2/4] Adicionando arquivos...
git add -A

echo [3/4] Criando commit...
:: Forcar commit mesmo sem mudancas
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Documentacao: %DT%"
) else (
    echo     Nenhuma alteracao para commitar.
    :: Mesmo assim, fazemos um commit vazio para forcar o push
    git commit --allow-empty -m "Documentacao: %DT% (force)"
)

echo [4/4] Enviando para GitHub...
echo.
echo Tentando enviar para o GitHub de documentacao...

:: Primeiro tentar push normal
git push origin main
if errorlevel 1 (
    echo     Push normal falhou. Tentando com --force...
    git push origin main --force
)

if errorlevel 1 (
    echo.
    echo [!] O push falhou. Verifique:
    echo    - Se o repositorio existe: %REPO_URL%
    echo    - Suas credenciais do GitHub
    echo    - Conexao com internet
) else (
    echo.
    echo ======================================================
    echo    DOCUMENTACAO ENVIADA COM SUCESSO!
    echo ======================================================
)

popd
echo.
pause
