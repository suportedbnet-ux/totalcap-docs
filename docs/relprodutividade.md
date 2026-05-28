# Documentação: Regras de Negócio — Relatório de Produtividade

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Produtividade**.

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

Esta tela foi desenhada para o gerente de produção acompanhar a eficiência da fábrica. A principal matéria-prima aqui é o **tempo**.

*   **Campos de Filtro:**
    *   O usuário seleciona um **período** (padrão: mês corrente), e pode refinar por **Setor** (ex: "Sala de Raspagem", "Montagem") e **Operador** (ex: "João", "Maria").
*   **Carregamento Automático:**
    *   Assim como os outros relatórios gerenciais, os dados já são carregados automaticamente ao entrar na tela. Basta ajustar os filtros para refazer a consulta.

---

## 2. Abas de Visão (Como os dados são agrupados)

O sistema permite analisar a produtividade de três ângulos diferentes. O objetivo central é responder à pergunta: *"Quanto cada setor e cada operador produziu em um determinado período?"*

1.  **Geral Detalhado (A "Relação" de Produção):**
    *   Exibe **todos os apontamentos de produção** um por um, em ordem cronológica. Cada linha mostra: qual OS/Pneu foi trabalhado, em qual setor, qual operador fez o serviço, que horas começou, que horas terminou e quanto tempo levou (em minutos).
    *   **Total no Rodapé:** O sistema soma a quantidade de peças apontadas e o tempo total gasto.
    *   **Para que serve?** O supervisor quer "abrir o capô" e ver o Diário de Bordo da Produção, minuto a minuto.

2.  **Resumo por Operador (Ranking de Produção):**
    *   O sistema agrupa todos os apontamentos pelo nome do operador. Para cada operador, mostra: quantos apontamentos ele fez (quantidade de peças), o tempo total que ele trabalhou e o **tempo médio** que ele levou por peça.
    *   **Para que serve?** A gerência quer saber quem são os operadores mais rápidos, quem está produzindo mais e identificar quem precisa de treinamento (tempo médio muito alto).

3.  **Resumo por Setor (Gargalos da Fábrica):**
    *   O sistema agrupa pelo nome do setor. Mostra: quantas peças passaram por aquele setor, o tempo total acumulado do setor e o tempo médio por peça naquele setor.
    *   **Para que serve?** Identificar qual setor está "engarrafando" a produção. Se o setor de "Pintura" tem um tempo médio muito superior aos demais, a fábrica precisa alocar mais operadores ou investigar o processo.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   **Regra de Fidelidade Visual:** O sistema imprime exatamente **aquilo que o usuário está vendo na tela naquele momento**. Se estiver analisando o "Resumo por Operador", o relatório impresso será o resumo por operador, com seus totais e médias.
    *   **Capa Oficial:** O sistema insere automaticamente o Logotipo da Empresa, a Razão Social, o título "RELATÓRIO DE PRODUTIVIDADE" e o período selecionado, transformando a consulta em um documento formal para a diretoria.
