# Documentação: Regras de Negócio - Fatura NF Entrada

Este documento detalha em linguagem natural as regras de negócio e funcionalidades atreladas aos botões das telas de **Fatura NF Entrada** (gestão de notas fiscais de entrada/recebimento de mercadorias ou carcaças) e sua respectiva tela de **Edição/Criação**.

---

## 1. Tela Principal (Gestão de Faturas de Entrada)

O objetivo desta tela é gerenciar as faturas fiscais (Tipo "E") que documentam a entrada de materiais na recapadora, o que inclui a entrada física de carcaças (pneus) enviadas pelos clientes para reforma ou compra de matéria-prima.

### Ações no Cabeçalho e Listagem
*   **Exporta API (Botão Roxo)**
    *   **Ação:** Envia as faturas de entrada selecionadas para o sistema ERP externo. Útil para dar entrada no estoque físico ou registrar contas a pagar no ERP de retaguarda.
*   **Imprime (Botão Cinza)**
    *   **Ação:** Gera o relatório impresso das faturas de entrada selecionadas.
*   **Gerar NF (Botão Verde dinâmico)**
    *   **Ação e Regra:** Aparece apenas quando se seleciona uma ou mais faturas. Emite o documento fiscal (Ex: Emissão Própria de Entrada, quando o cliente/fornecedor não possui Inscrição Estadual para emitir a nota de remessa).
*   **Nova Fatura Entrada (+ Botão Azul)**
    *   **Ação:** Inicia uma fatura de entrada em branco ou por importação, abrindo o modal de criação.
*   **Ações da Grade (Visualizar, Editar, Excluir)**
    *   **Visualizar (Olho):** Modo somente leitura para checar os valores e produtos.
    *   **Editar (Lápis):** Carrega a fatura para alteração (apenas se a NF ainda não tiver sido processada fiscalmente).
    *   **Excluir (Lixeira):** Apaga o registro da fatura de entrada do sistema.

---

## 2. Tela de Emissão e Edição de Entrada (Modal)

Na criação da nota de entrada, há uma funcionalidade desenhada para agilizar a documentação de carcaças que já deram entrada física na fábrica através da Ordem de Serviço (OS).

### Ações de Importação e Cabeçalho
*   **Seleciona Ordem de Serviço (Botão Laranja com Lupa)**
    *   **Regra de Negócio Crítica (Importação de OS):** Este é o botão acelerador da tela. Em vez de registrar a entrada pneu a pneu, o usuário busca a Ordem de Serviço (OS) já preenchida na portaria/coleta.
    *   **Ação Automática:** Ao selecionar uma OS, o sistema:
        1. Copia o Fornecedor/Cliente e o Vendedor/Comprador da OS.
        2. Lê todos os pneus vinculados àquela OS.
        3. Converte cada pneu automaticamente em uma linha de "Produto" (Código: `PNEU`).
        4. Transcreve na descrição do item todos os dados técnicos para amparo fiscal (Ex: `275/80 R22.5 Dot:123 Serie:456 n.fogo:789`).
        5. Define o valor unitário como o `valornfe` (valor declarado de entrada do pneu).
*   **Dados Básicos do Fornecedor / Cliente**
    *   **Ação:** Autocompleta ao digitar. Ao selecionar, preenche o ID do Contato. É obrigatório para poder gravar a fatura.

### Ações na Grade de Itens (Produtos)
*   **Adicionar Item (+ Adicionar Item)**
    *   **Ação:** Adiciona uma linha vazia. Útil para dar entrada em matérias-primas comuns (Borracha, Camelback, Válvulas) que não vêm de uma OS.
*   **Excluir Item (Lixeira)**
    *   **Ação:** Exclui a linha e recalcula os totais.
*   **Edição do Código do Produto**
    *   **Regra Automática:** A célula de código possui uma lista inteligente (Datalist). Se o usuário digitar "PNEU" ou buscar pelo código de um insumo, o sistema autopreenche a descrição e o custo base cadastrado.
    *   **Matemática Contínua:** `Quantidade * Valor Unitário` atualiza o `Total` da linha, que imediatamente atualiza o "Valor Total da Nota" no rodapé.

### Totais e Pagamento
*   **Seleção de Plano de Pagamento**
    *   **Regra:** Define a forma de pagamento (ex: 30/60/90). Se for entrada de insumos, isso balizará as duplicatas do Contas a Pagar. Se for apenas remessa de carcaças de cliente, normalmente usa-se um plano "Sem Pagamento/Remessa".
*   **Gravar Fatura (Botão Verde)**
    *   **Ação:** Executa a verificação final de cliente preenchido e envia os dados para o banco, salvando o cabeçalho travado com `tipofat: 'E'` (Entrada) e vinculando os produtos inseridos na grade. Após salvar, o assistente fecha e a fatura fica pronta para emissão da NF.
