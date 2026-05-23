# Documentação: Regras de Negócio - Faturamento de Serviços

Este documento detalha em linguagem natural as regras de negócio e o comportamento dos botões e fluxos da tela de **Faturamento de Serviços**, que engloba a gestão das faturas existentes e a emissão/edição de novas faturas.

---

## 1. Tela Principal (Gestão de Faturas)

A tela principal possui um layout mestre-detalhe, listando todas as faturas emitidas e exibindo resumos instantâneos.

### Ações no Cabeçalho e Listagem
*   **Exporta API (Botão Roxo)**
    *   **Ação:** Envia os dados das faturas selecionadas (através das caixas de seleção na grade) para uma API ou sistema ERP externo (ex: TOTVS, Omie). Exige que pelo menos uma fatura esteja selecionada.
*   **Imprimir Lista (Botão Cinza)**
    *   **Ação:** Prepara a tela (ocultando painéis laterais) e envia para a impressora um relatório gerencial com a listagem de faturas e valores exibidos no filtro atual.
*   **Nova Fatura (Botão Azul +)**
    *   **Ação:** Abre o assistente de criação de faturamento do zero.
*   **Filtros de Busca (Por Número, Cliente ou Data)**
    *   **Ação:** Busca faturas de serviço (Tipo "S") já consolidadas no banco de dados.

### Ações de Linha (Ações por Fatura)
*   **Clique Simples na Linha**
    *   **Ação:** Abre o painel lateral de "Detalhes da Fatura" à direita, exibindo o desmembramento financeiro (Serviços, Produtos, Carcaça, Montagem, Descontos), o Valor Total final e a relação dos IDs de Pneus vinculados a ela.
    *   **Imprimir Fatura (Painel Detalhe):** Gera um espelho ou recibo da fatura selecionada para o cliente.
*   **Botão Visualizar (Ícone Olho Verde)**
    *   **Ação:** Abre a fatura em modo "Somente Leitura" total. Todos os campos, seleções de pneus e parcelamentos ficam bloqueados para evitar alterações acidentais ao apenas consultar.
*   **Botão Editar (Ícone Lápis Azul)**
    *   **Ação:** Carrega todos os dados da fatura (cliente, totais, parcelas, pneus e laudos) no formulário, permitindo retificar informações de uma fatura que ainda não foi fechada no financeiro/ERP.
*   **Botão Excluir (Ícone Lixeira Vermelha)**
    *   **Regra de Negócio Crítica:** Ao excluir uma fatura, o sistema não apenas apaga o registro financeiro, mas **devolve todos os pneus vinculados a ela para o status de "Pendentes de Faturamento"** (statusfat volta a ser falso), permitindo que sejam faturados novamente no futuro.

---

## 2. Tela de Emissão e Edição de Fatura (Modal)

O assistente de faturamento é dividido em duas abas (passos) principais para organizar o fluxo de trabalho.

### Passo 1: Seleção de Pneus
Nesta aba, o sistema busca o que foi produzido e liberado, mas que ainda não foi cobrado.

*   **Filtros (ID OS, Nº OS, Cliente)**
    *   **Regra:** O sistema obriga o preenchimento de pelo menos um filtro para evitar carregar toda a base da recauchutadora. Apenas pneus marcados como "Prontos" (que possuem serviços lançados e `statusfat = false`) aparecem.
*   **Pesquisar Pneus (Botão Azul)**
    *   **Ação:** Traz a grade de pneus aptos para a cobrança com os valores individuais de serviço.
*   **Caixas de Seleção (Checkboxes)**
    *   **Ação:** O usuário escolhe quais pneus da OS ou do Cliente entrarão nesta fatura. O checkbox do cabeçalho seleciona todos da lista de uma vez.
*   **Próximo: Dados da Fatura (Botão Verde)**
    *   **Regra de Negócio Crítica (Varredura de Serviços):** Ao clicar, o sistema exige que ao menos 1 pneu tenha sido marcado. Ele entra no banco de dados, busca **todos os serviços extras** de todos os pneus selecionados, soma tudo e carrega essa soma exata para o "Valor de Serviços" no Passo 2. Além disso, herda automaticamente o Nome do Cliente e o Vendedor.

### Passo 2: Dados da Fatura
Nesta aba ocorre o fechamento de valores, descontos e negociação de parcelas.

*   **Importar Fatura de Serviço (Aparece apenas em Fatura de Retorno/NFE)**
    *   **Ação:** Se for selecionado o tipo "Retorno", permite clonar dados de uma fatura de serviço existente para emitir a remessa de retorno de forma idêntica.
*   **Vincular Laudo de Garantia (+ Vincular Laudo)**
    *   **Ação:** Permite buscar um Laudo (Crédito do Cliente) e abater o seu saldo do total desta fatura.
    *   **Regra de Limite:** O sistema proíbe que o "Valor Aplicado" seja maior que o saldo em haver (vrsaldo) daquele laudo específico.
*   **Cálculo do Valor Total Final (Automático)**
    *   **Fórmula Fixa:** `(+) Vr Serviços + (+) Vr Produtos + (+) Vr Carcaça + (+) Vr Montagem - (-) Bônus/Desconto - (-) Laudos Vinculados`. Qualquer alteração nestes campos recalcula o total em tempo real na barra verde inferior.
*   **Gerar Parcelas (Botão Azul)**
    *   **Regra de Negócio Financeira:** Baseia-se no "Plano de Pagamento" selecionado (Ex: 30/60/90). Ao clicar, o sistema divide o "Total Final" pelo número de parcelas do plano e projeta datas de vencimento somando exatos 30 dias para cada cota sequencial a partir da Data de Faturamento.
*   **Editar / Excluir Parcela (Grade de Parcelas)**
    *   **Ação:** Permite que o operador force o vencimento de uma parcela para um dia útil, ajuste centavos quebrados de forma manual ou mude o tipo de documento de uma única parcela.
*   **Gerar Fatura Agora / Salvar Alterações (Botão Verde Final)**
    *   **Validações Múltiplas:** Verifica se há cliente vinculado, se há pneus amarrados (no caso de fatura de serviço), salva o cabeçalho financeiro, injeta os pneus na tabela de ligação, deduz saldos dos laudos e consolida as parcelas projetadas para enviar ao módulo de contas a receber. Se sucesso, emite alerta e volta à lista principal.
