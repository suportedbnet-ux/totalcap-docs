@echo off
setlocal
:: ======================================================
:: CONFIGURACOES DE PRODUCAO
:: ======================================================
set REPO_URL=https://github.com/suportedbnet-ux/totalcap-docs.git
set GIT_USER=suportedbnet-ux
set GIT_EMAIL=suporte.dbnet@gmail.com
set DIST_DIR=C:\Sistema\Doctotal
:: ======================================================

:: 3. Configuracao do Git de Documentacao
pushd "%DIST_DIR%"
echo [3/4] Configurando Git com identidade de documentacao: %GIT_USER%
git init
git config user.name "%GIT_USER%"
git config user.email "%GIT_EMAIL%"
git remote add origin %REPO_URL%

:: 4. Commit e Push
echo [4/4] Criando commit e enviando para GitHub...
set current_dt=%date% %time%
echo "Documentacao: %current_dt%"
git add .
git checkout -b main
git commit -m "Documentacao: %current_dt%"

echo.
echo Tentando enviar para o GitHub de documentacao...
git push origin main --force

if errorlevel 1 (
    echo.
    echo [!] O push falhou. Verifique o repositorio.
) else (
    echo.
    echo ======================================================
    echo    SISTEMA ENVIADO COM SUCESSO PARA DOCS!
    echo ======================================================
)

popd
pause

