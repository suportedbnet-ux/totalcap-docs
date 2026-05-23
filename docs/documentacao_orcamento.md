# Documentação: Regras de Negócio - Orçamentos

Este documento detalha em linguagem natural as regras de negócio e funcionalidades atreladas aos botões da tela de **Orçamentos Comerciais** e sua respectiva tela de **Edição/Criação de Propostas**.

---

## 1. Tela Principal (Gestão de Propostas)

O painel de Orçamentos é desenhado para centralizar as propostas comerciais feitas a clientes, que muitas vezes originam-se de carcaças já inspecionadas na fábrica.

### Ações de Grade
*   **Novo Orçamento (+ Botão Azul)**
    *   **Ação:** Abre a interface de formulação da proposta em tela cheia.
*   **Imprimir Proposta (Botão Roxo com Ícone de Arquivo)**
    *   **Regra Formal de Impressão:** Ao clicar neste botão de ação na linha de um orçamento, o sistema abre uma janela em branco especial. Ele "desenha" uma Proposta Comercial em formato A4, puxando a logomarca da empresa, cabeçalho formatado, dados completos do cliente, validade, grid de serviços e peças, os totalizadores e as **linhas de assinatura**. Após construir esse documento, o sistema automaticamente aciona o comando de impressão (`Ctrl+P`) do navegador.
*   **Visualizar (Olho Verde)**
    *   **Ação:** Abre o formulário da proposta com os campos trancados, evitando que um vendedor altere dados de um orçamento antigo sem querer ao tentar apenas consultá-lo.
*   **Editar (Lápis Azul)**
    *   **Ação:** Permite alterar os termos do orçamento, adicionar ou abater itens.
*   **Excluir (Lixeira Vermelha)**
    *   **Ação:** Remove o orçamento permanentemente após confirmação.

---

## 2. Tela de Edição e Criação (Modal)

Na criação do orçamento, o sistema possui regras de produtividade focadas em aproveitar os dados de Ordem de Serviço (OS), evitando redigitação.

### Integração Mágica com OS e Clientes
*   **Campo "ID Ordem (OS)" (Buscador Automático)**
    *   **Regra de Importação Ativa:** Este não é um campo comum. Ao digitar o número de uma OS (ex: `15`), o sistema "escuta" a digitação. Após uma fração de segundo (Debounce), ele pesquisa silenciosamente essa OS. Se encontrar:
        1. **Puxa o Cliente:** Ele descobre quem é o dono da OS e autocompleta toda a seção de "Dados do Cliente" (Endereço, Celular, Email).
        2. **Puxa a Produção:** Ele varre todos os pneus que estão fisicamente amarrados a essa OS e joga eles instantaneamente na grade de "Itens e Serviços" abaixo, já com os serviços pretendidos e os valores base.
*   **Busca Cliente Cadastrado (Snapshot)**
    *   **Regra de Fotografia (Snapshot):** Se não for usar uma OS, o vendedor busca o cliente pelo nome. Ao selecionar, o sistema preenche todos os campos de endereço e fone. A regra de negócio aqui é que o orçamento tira uma "foto" dos dados do cliente naquele instante. Se o cliente mudar de endereço daqui a dois anos, o orçamento antigo ainda mostrará o endereço da época.

### Itens e Totalizadores
*   **Novo Item (+ Botão Azul Menor)**
    *   **Ação:** Abre a janelinha para registrar manualmente uma Medida/Peça, descrição do serviço, quantidade e valor.
*   **Cálculo Dinâmico Invisível**
    *   Sempre que um item é criado, o sistema multiplica `Qtd * Valor Unitário`. Além disso, a cada mudança na grade, o sistema soma todos os subtotais e atualiza imediatamente o placar gigante "Total Geral do Orçamento" no rodapé esquerdo.

### Fechamento do Orçamento
*   **Proposta (Botão Cinza no Rodapé - Aparece só na Edição)**
    *   **Ação:** É um atalho idêntico ao botão roxo da tela principal. Permite que o vendedor imprima a proposta sem precisar fechar o modal.
*   **Salvar Orçamento (Botão Verde Check)**
    *   **Ação:** Consolida os dados e salva a proposta comercial no banco de dados.
