# Documentação: Regras de Negócio — Relatório de Coleta de Pneus

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Coleta de Pneus**.

Esta tela tem um comportamento **híbrido**: pode ser uma tela analítica quando acessada manualmente, mas também funciona como uma **página de impressão automática** quando chamada por um processo externo.

---

## 1. O Painel de Filtros

Esta tela foi projetada de forma diferente dos demais relatórios. A filtragem dos dados não é feita no servidor, mas sim **dentro do próprio navegador (client-side)**.

*   **Campos de Filtro:**
    *   Os filtros são herdados da tela principal de Coletas via parâmetros de URL (`useSearchParams`). O usuário pode digitar um termo de busca (**search**) para localizar coletas por ID, nome do cliente, nome do vendedor ou número da OS. Também pode selecionar um período (**start** e **end**) para limitar a busca.
*   **Filtragem Client-Side (Regra Técnica Importante):**
    *   Diferente dos outros relatórios que enviam uma requisição ao servidor com parâmetros de filtro, este relatório **baixa todos os dados primeiro** (via `GET /coletas/`) e depois filtra **dentro do navegador**. Isso significa que:
        *   ✅ A resposta é mais rápida após o primeiro carregamento.
        *   ⚠️ Se houver muitas coletas, o carregamento inicial pode ser mais lento.
        *   🔍 A busca textual procura em múltiplos campos ao mesmo tempo (ID, nome do cliente, vendedor, número OS).

---

## 2. Visão Única (Tabela Unificada)

Uma única tabela que lista todas as coletas que passaram pelos filtros.

*   **O que cada linha mostra?**
    *   **ID** da coleta, **Número da OS** vinculada, **Data**, **Nome do Cliente**, **Valor Total** e **Status**.
*   **Total no Rodapé:**
    *   O sistema exibe o valor total geral de todas as coletas listadas.
*   **Layout Formal:**
    *   Esta tela possui um layout específico com a classe CSS `relatorio-coleta-container`, pensado para gerar um documento visualmente mais formal e adequado para impressão.

---

## 3. Fechamento e Documentação

*   **Impressão Automática (Regra Única no Sistema):**
    *   **Esta é a única tela do sistema que possui impressão automática.** Quando os dados são carregados e a lista não está vazia, o sistema **aciona a impressão sozinho** após 800 milissegundos. Isso foi projetado para que a tela funcione como uma "página de impressão" quando acessada diretamente por um link ou processo automatizado.
    *   Exemplo: O usuário está na tela de Coletas, clica em "Imprimir Relatório", o sistema abre esta página em uma nova aba com os filtros aplicados, e o relatório já sai impresso automaticamente sem o usuário precisar clicar em nada.
*   **Impressão Manual (Botão "Imprimir Agora"):**
    *   Caso a impressão automática não dispare (ou o usuário queira imprimir novamente), existe um botão "Imprimir Agora" para acionar manualmente.
*   **Capa Oficial:**
    *   Durante a impressão, o sistema utiliza o layout formal (`relatorio-coleta-container`) que inclui: cabeçalho com logotipo e dados da empresa, título "RELATÓRIO DE COLETA DE PNEUS", seção com informações dos filtros aplicados, tabela de dados e linha de total no rodapé.
