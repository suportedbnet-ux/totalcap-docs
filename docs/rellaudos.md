# Documentação: Regras de Negócio — Relatório de Laudos Técnicos

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Laudos Técnicos**.

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

Esta tela é o coração do **departamento de garantias**. Quando um pneu volta com reclamação do cliente, a fábrica emite um laudo técnico para avaliar se a culpa é do processo (garantia cobre) ou do mau uso (garantia não cobre).

*   **Campos de Filtro:**
    *   O usuário seleciona um **período**, opcionalmente filtra por **Cliente** (para ver o histórico de reclamações de uma transportadora específica) e por **Resultado** (Aprovado, Recusado ou Outros).
    *   **Filtro Inteligente de Saldo:** Existe um filtro chamado "Saldo" que permite mostrar **apenas os laudos que ainda têm saldo pendente** (o cliente ainda não pagou ou a fábrica ainda não creditou). Isso é essencial para o controle financeiro de garantias.
*   **Carregamento Automático:**
    *   Os dados carregam automaticamente. Ajustou os filtros? A consulta refaz na hora.

---

## 2. Visão Única (Tabela Unificada)

Diferente de outros relatórios, esta tela **não tem abas**. É uma única tabela que funciona como um "Extrato de Garantias".

*   **O que cada linha mostra?**
    *   **Data** do laudo, **número do laudo** (#ID), **nome do cliente** que reclamou, **resultado** (com um badge colorido — verde para aprovado, vermelho para recusado), o **valor de crédito** que o cliente tem direito, o **valor já pago** e o **saldo pendente**.
*   **Regra de Badges (Status Visual):**
    *   O sistema usa bolinhas coloridas para que o usuário identifique rapidamente o resultado sem precisar ler o texto:
        *   🟢 **Verde:** Laudo Aprovado (garantia deferida).
        *   🔴 **Vermelho:** Laudo Recusado (garantia indeferida).
        *   🟡 **Amarelo/Cinza:** Outros status (pendente de análise, etc.).
*   **Totais no Rodapé:**
    *   O sistema soma no rodapé: o **total de laudos** emitidos, o **total de crédito** concedido e o **saldo pendente total**. Isso permite que o financeiro saiba exatamente quanto a empresa deve em garantias naquele período.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   O sistema imprime a tabela completa com todos os laudos, incluindo os badges coloridos (que sairão em escala de cinza ou preto e branco na impressão).
    *   **Capa Oficial:** O sistema insere automaticamente o Logotipo da Empresa, a Razão Social, o título "RELATÓRIO DE LAUDOS TÉCNICOS" e o período com os filtros selecionados, gerando um documento formal para o departamento jurídico ou contábil.
