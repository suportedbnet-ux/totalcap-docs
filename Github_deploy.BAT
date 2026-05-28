@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
:: ======================================================
:: DEPLOY DA DOCUMENTACAO PARA GITHUB PAGES
:: ======================================================
:: Este script faz deploy do site estatico para o branch gh-pages
:: ======================================================

cd /d C:\Sistema\doctotal

echo ======================================================
echo   Deploy MkDocs para GitHub Pages
echo ======================================================
echo.

:: Verificar se mkdocs.yml existe
if not exist mkdocs.yml (
    echo [!] ERRO: Arquivo mkdocs.yml nao encontrado!
    pause
    exit /b 1
)

:: Garantir que o diretorio site/ nao esta sujo
if exist site\ (
    echo [1/3] Limpando build anterior...
    rmdir /s /q site 2>nul
)

echo [2/3] Gerando site estatico...
mkdocs build
if errorlevel 1 (
    echo [!] ERRO: Falha ao gerar o site!
    pause
    exit /b 1
)

echo [3/3] Enviando para GitHub Pages...
echo.

:: Usar --force para sobrescrever o branch gh-pages (evita erro "fetch first")
mkdocs gh-deploy --force

if errorlevel 1 (
    echo.
    echo [!] ERRO: Falha ao fazer deploy!
    echo.
    echo Tente manualmente:
    echo   cd C:\Sistema\doctotal
    echo   git push origin gh-pages --force
) else (
    echo.
    echo ======================================================
    echo   DEPLOY CONCLUIDO COM SUCESSO!
    echo ======================================================
    echo   Site disponivel em:
    echo   https://suportedbnet-ux.github.io/totalcap-docs/
)

echo.
pause