# Documentação: Regras de Negócio - Relatório de Vendas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Vendas**. 

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

A principal regra de negócio deste módulo é a capacidade de **cruzamento de dados**. A tela carrega o histórico de notas fiscais fechadas (Faturadas).

*   **Campos de Filtro:**
    *   O usuário pode cruzar informações comerciais (Data, Cliente, Vendedor, Área, Região) com informações de engenharia do pneu (Tipo de Recapagem, Medida e Desenho). Exemplo prático: *"Quero saber quantos pneus Medida 295, com Desenho Borrachudo, o Vendedor João vendeu na Região Sul no mês passado."*
*   **Gerar Relatório (Botão Azul com Lupa)**
    *   **Ação:** Dispara a consulta no banco de dados aplicando todas as "travas" de filtro selecionadas acima.

---

## 2. Abas de Visão (Como os dados são agrupados)

Uma vez que o botão "Gerar Relatório" trouxe os resultados brutos, a grande inteligência da tela mora nas "Abas". O sistema permite olhar para os **mesmos dados** de quatro formas diferentes (agrupamentos automáticos):

1.  **Por Serviço:**
    *   Soma toda a quantidade e o valor em reais faturados para cada tipo de serviço/produto. Ideal para saber qual o "carro chefe" da recauchutadora no mês.
2.  **Por Cliente:**
    *   Pega todas as notas e agrupa pelo nome do cliente. Mostra o volume financeiro gerado por cada transportadora ou pessoa física, ideal para identificar os maiores clientes da carteira.
3.  **Por Data:**
    *   Uma visão linear e cronológica do fluxo de vendas.
4.  **Preço Médio (A Visão Mais Complexa):**
    *   **Regra Matemática:** O sistema não apenas agrupa, ele faz uma conta matemática de (`Valor Total Faturado / Quantidade de Pneus`). 
    *   **Para que serve?** Como no mercado de recapagem há muitos descontos e negociações (o cliente A paga X e o cliente B paga Y no mesmo pneu), a diretoria usa essa tela para saber qual foi o **Preço Médio Real** alcançado no mercado para uma determinada Medida e Desenho de pneu durante aquele mês.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   **Regra Inteligente de Impressão:** Ao invés de imprimir um relatório padrão fixo, o sistema imprime **o que o usuário estiver vendo na tela**. Se o usuário estiver na aba "Por Cliente", sairá o relatório de clientes. Se estiver na aba "Preço Médio", sairá a tabela de preço médio.
    *   **Capa Oficial:** O botão aciona uma regra visual invisível que oculta menus e insere o Logotipo da Empresa, a Razão Social e o Período de Busca no papel (via PDF ou impressora física), garantindo um documento com valor gerencial e contábil.
