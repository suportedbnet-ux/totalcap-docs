# Documentação: Regras de Negócio — Relatório de Consumo de Matéria-Prima

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Consumo de Matéria-Prima**.

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

Esta é a tela de controle de **custos e estoque**. Enquanto a produção consome materiais no dia a dia (borracha, solvente, óleo, etc.), este relatório mostra para onde está indo cada quilo de insumo.

*   **Campos de Filtro:**
    *   O usuário seleciona um **período** e pode filtrar por um **Produto/Insumo** específico (ex: "Borracha S20", "Querosene", "Lonas"). O sistema carrega até 1000 produtos no seletor.
*   **Carregamento Automático:**
    *   Os dados carregam automaticamente ao entrar na tela. Ajuste os filtros e a consulta é refeita na hora.

---

## 2. Abas de Visão (Como os dados são agrupados)

O sistema permite duas visões complementares. O objetivo principal é responder: *"Quanto de cada material foi consumido e por quem?"*

1.  **Lançamentos Detalhados (O Diário de Consumo):**
    *   Exibe **todos os registros de consumo** individualizados, em ordem cronológica. Cada linha mostra: a data e hora do consumo, qual produto/insumo foi usado, a quantidade consumida, a unidade de medida (kg, L, un), em qual setor e por qual operador.
    *   **Total no Rodapé:** O sistema exibe a quantidade total de registros de consumo no período.
    *   **Para que serve?** O almoxarife ou supervisor quer "abrir o detalhamento" e ver cada saída de estoque que aconteceu, conferindo se não houve desperdício.

2.  **Resumo por Insumo (O Consolidado):**
    *   O sistema agrupa todos os consumos pelo **nome do produto/insumo**. Para cada insumo, mostra: quantas vezes foi consumido (quantidade de lançamentos), o consumo total (soma de todas as quantidades) e a unidade de medida.
    *   **Totais no Rodapé:** O sistema consolida todos os insumos em um total geral.
    *   **Para que serve?** O engenheiro de produção e o financeiro querem saber: *"Quanto de Borracha S20 foi consumida esse mês?"* sem precisar somar lançamento por lançamento.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   **Regra de Fidelidade Visual:** O sistema imprime exatamente o que está sendo visto na tela. Se estiver no "Resumo por Insumo", o relatório impresso trará o consumo consolidado de cada material.
    *   **Capa Oficial:** O sistema insere automaticamente o Logotipo da Empresa, a Razão Social, o título "RELATÓRIO DE CONSUMO DE MATÉRIA-PRIMA" e o período selecionado, gerando um documento formal para controle de custos e inventário.
