# Documentação: Regras de Negócio — Relatório de Metas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Metas**.

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

Esta tela é a "Planilha de Resultados" da equipe comercial. Ela compara o que foi **planejado** (meta) contra o que foi **realizado** (faturamento real), permitindo ao gestor avaliar o desempenho de cada vendedor.

*   **Campos de Filtro:**
    *   O usuário seleciona um **mês/ano de início** e um **mês/ano de fim** (padrão: mês corrente), podendo refinar por **Vendedor** específico.
    *   **Regra de Armazenamento de Data:** Internamente, o sistema armazena o dia 1 de cada mês (YYYY-MM-01) para facilitar a comparação entre meses, já que o que importa aqui é o mês, não o dia exato.
*   **Carregamento Automático:**
    *   Os dados carregam automaticamente. Ajustou os filtros? A consulta refaz na hora.

---

## 2. Abas de Visão (Como os dados são agrupados)

O sistema permite duas visões complementares. O objetivo principal é responder: *"Qual vendedor está batendo a meta e qual está ficando para trás?"*

1.  **Metas de Vendas (O Coração do Relatório):**
    *   Cada linha da tabela representa um **vendedor em um mês específico**. Mostra: qual era o valor da meta em reais (R$), quanto o vendedor realmente faturou (R$) e o **percentual de atingimento** da meta.
    *   **Código de Cores Inteligente (Semáforo de Desempenho):**
        *   🟢 **Verde:** Meta atingida ou superada (>= 100%). O vendedor está de parabéns.
        *   🟡 **Amarelo:** Quase lá (>= 80% e < 100%). O vendedor está próximo, mas precisa de incentivo.
        *   🔴 **Vermelho:** Abaixo da meta (< 80%). O vendedor precisa de atenção e suporte.
    *   **Totais no Rodapé:** O sistema soma o total das metas planejadas e o total realizado, dando ao gestor uma visão do atingimento global da equipe.
    *   **Para que serve?** O gerente comercial abre a tela e, em 5 segundos, sabe exatamente quem está performando bem e quem precisa de acompanhamento.

2.  **Metas de Combustível (Visão Logística):**
    *   Exatamente a mesma estrutura da aba de Vendas, mas aplicada a **metas de consumo de combustível**. Mostra: quantidade meta (litros ou km), quantidade realizada e percentual de atingimento.
    *   **Mesmo Código de Cores:** Verde (>= 100%), Amarelo (>= 80%), Vermelho (< 80%).
    *   **Para que serve?** Empresas que fornecem combustível para a frota ou para os vendedores usarem nos deslocamentos. Permite controlar se o vendedor está dentro da cota de combustível estabelecida.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   **Título Dinâmico:** O sistema é inteligente e altera o título do relatório conforme a aba ativa. Se estiver na aba "Metas de Vendas", o título impresso será "RELATÓRIO DE METAS — VENDAS". Se estiver na aba "Metas de Combustível", o título será "RELATÓRIO DE METAS — COMBUSTÍVEL".
    *   **Regra de Fidelidade Visual:** O sistema imprime exatamente o que está sendo visto na tela, incluindo os percentuais e as cores indicativas (que sairão em tons de cinza na impressão física).
    *   **Capa Oficial:** O sistema insere automaticamente o Logotipo da Empresa, a Razão Social e o período selecionado, gerando um documento formal para a reunião de resultados comerciais.
