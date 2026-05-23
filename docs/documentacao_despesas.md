# Documentação: Regras de Negócio - Despesas c/ Vendas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de **Despesas c/ Vendas**, que é o módulo focado no controle de reembolso e custos operacionais da equipe comercial.

---

## 1. Tela Principal (Gestão de Notas)

A tela principal exibe o acumulado das notas de despesas reportadas pelos vendedores. O grande diferencial desta tela em relação às demais do sistema é a automação por Inteligência Artificial.

### Botões e Funcionalidades
*   **Leitura OCR (Botão Verde com Câmera)**
    *   **A Regra da Automação:** Este botão ativa o sistema de visão computacional. Ao invés do usuário digitar item por item de um cupom fiscal de posto de gasolina amassado, ele faz o upload da foto.
    *   **Lógica de Negócio por trás do OCR:** O sistema envia a foto para a IA (Google Gemini/OpenAI), que extrai automaticamente o Fornecedor (via CNPJ), o Valor Total, a Quilometragem do veículo informada no papel e cria as linhas de "Combustível" ou "Alimentação" sozinhas, vinculando tudo ao vendedor correspondente. O usuário apenas confere e salva.
*   **Imprimir (Botão Secundário)**
    *   **Ação:** Imprime o espelho da despesa selecionada na grade. Muito utilizado para grampear junto com o cupom fiscal físico para o arquivo morto do financeiro.
*   **Nova Despesa (+ Botão Azul)**
    *   **Ação:** Abre a janela de cadastro manual, caso o usuário não queira ou não consiga usar a Leitura OCR.

---

## 2. Tela de Edição e Criação (Modal Mestre-Detalhe)

O lançamento de despesa obedece a uma lógica estrita de "Capa da Nota" (Mestre) e "Linhas da Nota" (Detalhes/Itens).

### A Capa da Despesa (Cabeçalho)
*   **Fornecedor e Vendedor**
    *   **Regra Financeira:** Para onde foi o dinheiro e quem gastou? O sistema permite salvar sem Fornecedor (ex: se for um gasto genérico), mas é **Terminantemente Proibido** salvar a despesa sem informar qual "Vendedor" efetuou o gasto. Isso garante que a empresa saiba exatamente a rentabilidade de cada membro da equipe comercial no fim do mês.

### Os Itens da Despesa (Sub-Modal)
Uma nota de posto pode conter R$ 200 de Diesel e R$ 30 de Arla. Por isso, a despesa exige itens.
*   **Adicionar Item (+ Botão Azul)**
    *   Abre um sub-formulário para digitar cada gasto individualmente.
*   **Regras de Frota (Veículo e KM)**
    *   **Custo de Frota:** Se o gasto for com o carro da empresa, o sistema permite atrelar o item especificamente à Placa do Veículo e exige/permite a anotação da KM Anterior e KM Atual. Isso alimenta o módulo de logística indiretamente, medindo a média de consumo do carro.
*   **Bloqueio de Saldo**
    *   O usuário nunca digita o "Valor Total" da nota manualmente na Capa. O valor mestre é sempre a soma automática matemática de todas as linhas de itens adicionadas.

### Fechamento
*   **Salvar Lançamento (Botão com Disquete)**
    *   **Trava de Segurança:** O sistema fará duas checagens antes de permitir o salvamento:
        1. Existe um vendedor atrelado?
        2. Existe pelo menos 1 (um) item de despesa detalhado?
    *   Se as duas respostas forem sim, o valor vai para as contas a pagar da empresa.
