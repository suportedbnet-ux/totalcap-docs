# Documentação: Regras de Negócio — Relatório de Ordens de Serviço

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Ordens de Serviço**.

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

Esta tela é o "Radar" do planejamento e controle da produção (PCP). Permite ao gestor saber quantas ordens de serviço foram abertas e em qual estágio cada uma se encontra.

*   **Campos de Filtro:**
    *   O usuário seleciona um **período** (padrão: mês corrente), podendo refinar por **Cliente** (para ver as OS de uma transportadora específica) e por **Status** (Aberta, Em Produção, Finalizada ou Cancelada).
    *   **Filtro de Status:** Diferente dos demais relatórios, aqui o filtro de status é essencial — ele permite, por exemplo, listar apenas as OS que estão "Em Produção" para o supervisor saber o que está na linha hoje.
*   **Carregamento Automático:**
    *   Os dados carregam automaticamente. Ajustou os filtros? A consulta refaz na hora.

---

## 2. Visão Única (Tabela Unificada)

Assim como o relatório de Laudos, esta tela **não tem abas**. É uma única tabela que funciona como um "Extrato de Ordens de Serviço do Período".

*   **O que cada linha mostra?**
    *   **Data de abertura** da OS, **número da OS**, **nome do cliente**, **data de previsão** de entrega, o **status** atual (com badge colorido) e o **valor total** da ordem.
*   **Regra de Badges (Status Visual):**
    *   O sistema usa badges coloridos para que o usuário identifique rapidamente em que estágio a OS está:
        *   🟢 **Aberta:** OS criada, aguardando início da produção.
        *   🔵 **Em Produção:** OS na linha de produção.
        *   ⚫ **Finalizada:** Produção concluída.
        *   🔴 **Cancelada:** OS cancelada.
*   **Totais no Rodapé:**
    *   O sistema soma no rodapé: o **total de ordens de serviço** emitidas no período e o **valor total acumulado** de todas as OS listadas. Isso permite ao gestor saber o volume de trabalho e o faturamento potencial do período.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   O sistema imprime a tabela completa com todas as ordens de serviço, incluindo os badges de status.
    *   **Capa Oficial:** O sistema insere automaticamente o Logotipo da Empresa, a Razão Social, o título "RELATÓRIO DE ORDENS DE SERVIÇO" e o período com os filtros selecionados, gerando um documento formal para o PCP e a diretoria.
