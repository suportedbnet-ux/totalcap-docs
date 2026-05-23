# Documentação: Regras de Negócio - Contratos

Este documento detalha em linguagem natural as regras de negócio e funcionalidades atreladas aos botões das telas de **Contratos** (gestão de acordos comerciais de longo prazo e fechamento de preços fixos) e sua respectiva tela de **Edição/Criação**.

---

## 1. Tela Principal (Gestão de Contratos)

A tela principal exibe o painel de acordos vigentes e vencidos, onde as negociações especiais com frotas ou grandes clientes são centralizadas.

### Ações e Comportamentos da Grade
*   **Seleção de Linha (Radio Button)**
    *   **Regra:** Ao contrário de outras telas que usam checkboxes múltiplos, os contratos usam "botões de rádio" na primeira coluna, permitindo selecionar apenas **um contrato por vez**. Quando uma linha é selecionada, ela ganha um leve destaque visual azul.
*   **Imprimir Contrato (Botão Branco com Ícone Impressora)**
    *   **Comportamento Dinâmico:** Este botão fica apagado (desabilitado) até que o usuário clique em uma das linhas da grade.
    *   **Ação de Impressão (Modo Contrato):** Ao clicar, o sistema intercepta a interface normal do sistema, oculta todos os menus e gera um documento formal em folha A4 em branco, que inclui o logotipo da empresa, dados do cliente, as condições comerciais e **linhas para assinatura digital ou manual** no rodapé, pronto para ser enviado como PDF ao cliente.
*   **Novo Contrato (+ Botão Azul)**
    *   **Ação:** Abre o grande assistente de criação de um novo acordo, iniciando zerado.
*   **Ações Individuais (Olho, Lápis, Lixeira)**
    *   **Visualizar (Olho):** Abre o formulário completo do contrato com edição bloqueada, apenas para conferência de cláusulas comerciais.
    *   **Editar (Lápis):** Permite alterar as condições de pagamento, adicionar mais itens ou inativar o acordo.
    *   **Excluir (Lixeira):** Pede confirmação e exclui o contrato definitivamente.

---

## 2. Tela de Edição e Criação (Modal)

Na criação do contrato, a regra de negócio determina a fixação de valores para um *lote de pneus* acordado antecipadamente, junto de um plano de pagamento que financia essa negociação.

### Cabeçalho do Contrato
*   **Cliente / Status**
    *   **Ação:** A seleção de cliente é mandatória. A marcação de "Contrato Ativo" é o que permite que este acordo seja válido e puxado no momento do Faturamento real futuro.

### Itens / Preços por Combinação de Pneu
*   **Adicionar Preço Especial (+ Botão Azul)**
    *   **Ação:** Abre um sub-painel para amarrar a engenharia do pneu. O usuário seleciona o combo exato: Medida + Desenho + Tipo de Recapagem.
    *   **Cálculo e Valor:** O usuário estipula a quantidade negociada desse combo e o seu "Valor Fixo" acordado. O sistema calcula o subtotal da linha automaticamente.
*   **Regra Crítica: Acumulador Financeiro Invisível**
    *   A cada item adicionado, alterado ou excluído na grade de combinações, o sistema recalcula, em tempo real, a **Quantidade Total** de carcaças do contrato e o **Valor Total** financeiro dele, exibindo esses totais no rodapé dessa seção. Esses totais são a base estrita para o módulo de contas a receber abaixo.

### Condições de Pagamento & Parcelas
Nesta área, é feita a projeção de como a empresa vai receber os valores acordados daquela prestação de serviço em lote.

*   **Seleção Básica**
    *   Escolhe-se um **Plano de Pagamento** (ex: Entrada + 30/60) e o **Tipo de Documento** (ex: Boleto Bancário).
*   **Botão "Gerar Parcelas" (O Cérebro Financeiro)**
    *   **Bloqueios:** O botão só funciona se houver Cliente selecionado, Plano selecionado e se o Valor Total do contrato for maior que zero (ou seja, se itens já foram adicionados acima).
    *   **Regra de Cálculo (Desmembramento):** Ao clicar, ele lê quantas parcelas o plano exige e qual o intervalo de dias entre elas. Ele pega o "Valor Total", divide por esse número e projeta as datas somando os dias desde a "Data de Cadastro".
    *   **Regra do Arredondamento Comercial:** Como divisões financeiras costumam dar dízimas (ex: 100 reais em 3 vezes de 33,33), o sistema joga os 33,33 nas parcelas iniciais e, na **última parcela**, ele calcula a diferença matemática para garantir que a soma de tudo bata perfeitamente no centavo com o Valor Total lá de cima (que seria 33,34).
*   **Ajuste Fino na Grade de Parcelas**
    *   O usuário pode alterar datas que eventualmente caiam no final de semana ou ajustar pequenos valores manuais direto na tabela.

### Finalização
*   **Salvar Alterações / Gravar Contrato (Botão Verde)**
    *   Valida se as exigências comerciais (cliente e pelo menos 1 pneu negociado) foram cumpridas e grava tudo (Cabeçalho, Serviços Combinados e Projeção de Parcelas) em uma única transação no banco de dados.
