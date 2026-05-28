# Documentação: Regras de Negócio — Relatório de Comissões

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Comissões**.

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

A tela de comissões foi pensada para o departamento comercial e financeiro calcularem quanto cada vendedor tem a receber.

*   **Campos de Filtro:**
    *   O usuário escolhe um **período** (mês a mês) e opcionalmente filtra por um **Vendedor** específico. O sistema já vem configurado para mostrar o mês corrente por padrão, para facilitar o fechamento mensal.
*   **Carregamento Automático:**
    *   Diferente do Relatório de Vendas, este relatório **já carrega os dados automaticamente** assim que a tela abre. O usuário não precisa clicar em "Gerar" — os números já aparecem. Se quiser mudar o período ou o vendedor, basta ajustar os filtros que a consulta é refeita na hora.

---

## 2. Abas de Visão (Como os dados são agrupados)

O sistema permite olhar para as comissões de três formas diferentes, cada uma servindo a um propósito distinto dentro da gestão comercial:

1.  **Vendedor/Fatura (Detalhado):**
    *   Mostra uma árvore de dados: primeiro o nome do vendedor, e dentro dele a lista de cada fatura que ele vendeu. Para cada fatura, o sistema exibe o serviço prestado, o valor da venda, qual percentual de comissão foi aplicado e quanto de comissão aquela venda gerou.
    *   **Regra de Subtotal:** No final de cada vendedor, o sistema soma automaticamente o total de vendas e o total de comissão daquele vendedor. No final do relatório, um **Total Geral** consolida todo mundo.
    *   **Para que serve?** O vendedor quer ver "fatura por fatura" o que ele vai receber, e o financeiro quer conferir cada cálculo individualmente.

2.  **Vendedor/Resumo (Sintético):**
    *   Aqui o sistema "achata" a árvore: cada vendedor aparece em uma única linha com a quantidade de serviços que ele vendeu no período, o total vendido em reais e o total de comissão a receber.
    *   **Para que serve?** A diretoria quer bater o olho e saber rapidamente: "quanto o João vai receber de comissão esse mês?" sem precisar conferir fatura por fatura.

3.  **Por Serviço (Visão do Produto):**
    *   Em vez de olhar para o vendedor, o sistema agrupa pelo **tipo de serviço** (Ex: Recapagem 295, Borracha de Encher, etc.). Mostra quantos serviços daquele tipo foram vendidos, quanto faturado e quanto de comissão foi gerada.
    *   **Para que serve?** A fábrica quer saber qual serviço está dando mais retorno e gerando mais comissão para a equipe.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   **Regra de Fidelidade Visual:** O sistema imprime exatamente **o que está sendo exibido na tela no momento**. Se estiver na aba "Vendedor/Fatura", o relatório impresso trará a árvore detalhada. Se estiver na aba "Vendedor/Resumo", sairá o consolidado.
    *   **Capa Oficial:** O sistema insere automaticamente o Logotipo da Empresa, a Razão Social, o título "RELATÓRIO DE COMISSÕES" e o período selecionado no topo do papel, gerando um documento formal para arquivo ou assinatura.
