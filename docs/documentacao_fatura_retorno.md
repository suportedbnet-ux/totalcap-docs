# Documentação: Regras de Negócio - Fatura NF Retorno

Este documento detalha em linguagem natural as regras de negócio e funcionalidades atreladas aos botões das telas de **Fatura NF Retorno** (gestão de notas fiscais de devolução de carcaças/pneus ao cliente) e sua respectiva tela de **Edição/Criação**.

---

## 1. Tela Principal (Gestão de Faturas de Retorno)

Nesta tela, o foco é gerenciar as faturas fiscais (Tipo "R") que representam a devolução física do pneu (carcaça) para o cliente após a recapagem.

### Ações no Cabeçalho e Listagem
*   **Exporta API (Botão Roxo)**
    *   **Ação:** Dispara a integração das faturas selecionadas (via caixas de seleção) para o sistema ERP externo que emite as notas fiscais (ex: emissor NFe).
*   **Imprime (Botão Cinza)**
    *   **Ação:** Gera relatório/impressão das faturas de retorno que estão selecionadas.
*   **Gerar NF (Botão Verde dinâmico)**
    *   **Ação e Regra:** Este botão **só aparece** quando o usuário marca um ou mais checkboxes na lista. Ele serve como atalho rápido para comandar a emissão do documento fiscal de retorno para as faturas selecionadas.
*   **Nova Fatura Retorno (+ Botão Azul)**
    *   **Ação:** Inicia uma fatura de retorno em branco ou através da importação de serviço, abrindo o modal de edição.
*   **Ações da Grade (Visualizar, Editar, Excluir)**
    *   **Visualizar (Olho):** Abre os dados da fatura bloqueados para edição.
    *   **Editar (Lápis):** Carrega a fatura para alteração de produtos, NFe de origem ou cliente.
    *   **Excluir (Lixeira):** Apaga o registro da fatura de retorno do sistema.

---

## 2. Tela de Emissão e Edição de Retorno (Modal)

A Fatura de Retorno possui uma regra de negócio fundamental: ela geralmente espelha uma fatura de serviço que já foi cobrada. O sistema automatiza essa transição.

### Ações de Importação e Cabeçalho
*   **Seleciona Fatura Serviço (Botão Laranja com Lupa)**
    *   **Regra de Negócio Crítica (Clonagem Reversa):** Este é o botão mais importante da tela de criação. Em vez do usuário digitar pneu por pneu manualmente, ele clica neste botão para buscar uma Fatura de Serviço (cobrança de recapagem) já existente.
    *   **Ação Automática:** Ao selecionar a fatura de serviço anterior, o sistema:
        1. Copia o Cliente, Vendedor e Dados da Nota Fiscal de Entrada.
        2. Varre todos os pneus recapados daquela OS e os **transforma magicamente em produtos de estoque** (Código: `PNEU`).
        3. Monta a descrição do produto incluindo os dados rastreáveis da carcaça (Ex: `275/80 R22.5 Dot:123 Serie:456 n.fogo:789`).
        4. Define o valor unitário desse "produto" como o **Valor da NFE Original de Entrada**, para não gerar discrepância fiscal para o cliente.
*   **Dados Básicos do Cliente**
    *   **Ação:** Auto-completar pelo nome do cliente. 
    *   **Campos Fiscais Essenciais:** Exige (para fins de cruzamento fiscal) o preenchimento do *Número da NF de Entrada* e a *Chave XML de Entrada* para o sistema referenciar a devolução de mercadoria corretamente perante a SEFAZ.

### Ações na Grade de Itens (Produtos)
*   **Adicionar Item (+ Adicionar Item)**
    *   **Ação:** Adiciona uma linha em branco na grade para lançar manualmente a devolução de alguma mercadoria específica, caso não se use o botão de importar fatura.
*   **Excluir Item (Lixeira na linha)**
    *   **Ação:** Remove o item da grade e recalcula automaticamente o valor total da nota.
*   **Edição do Código do Produto (Autocompletar na Célula)**
    *   **Regra Automática:** Ao digitar um código ou nome e selecionar o produto da lista (Ex: "PNEU"), o sistema preenche sozinho a descrição padrão e o valor unitário cadastrado no catálogo.
    *   **Cálculo Dinâmico:** A cada alteração de Quantidade ou Valor Unitário, a coluna `Total` da linha é atualizada (`Qte * Valor`) e o Totalizador Geral da Nota (no rodapé escuro) sobe ou desce instantaneamente.

### Totais e Pagamento
*   **Seleção de Plano de Pagamento**
    *   **Regra:** Apesar de ser uma nota fiscal de simples remessa/retorno (que não gera boleto na maioria das vezes), o sistema permite registrar o plano de pagamento como "Sem Pagamento" ou atrelar à cobrança se o contador exigir.
*   **Gravar Fatura (Botão Azul)**
    *   **Ação:** Valida se o cliente está selecionado, consolida todos os itens da tabela como `produtos_fatura` e salva o cabeçalho configurado fixamente como `tipofat: 'R'` (Retorno). Volta para a tela inicial para que o botão "Gerar NF" possa ser utilizado.
