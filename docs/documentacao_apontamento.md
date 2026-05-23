# Documentação: Regras de Negócio - Apontamento de Produção

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de **Apontamentos de Produção** e seu respectivo modal de criação/edição.

---

## 1. Tela Principal (Gestão de Chão de Fábrica)

O "Apontamento" é o registro de que um pneu específico entrou em uma máquina ou setor (Ex: Raspadeira) e saiu, gerando um tempo de produção e indicando o funcionário que fez o serviço.

### Ações e Funcionalidades
*   **Novo Apontamento (+ Botão Azul Superior)**
    *   **Ação:** Abre o painel para que o apontador da fábrica registre a passagem de um pneu por um setor específico.
*   **Barra de Busca**
    *   **Ação:** Diferente de outras telas focadas apenas em nomes, esta busca é otimizada para o chão de fábrica. O usuário pode simplesmente "bipar" o código de barras na busca, ou digitar o nome de um "Operador" ou "Setor" para ver tudo que aquela pessoa ou máquina produziu no dia.
*   **Ações na Grade (Editar e Excluir)**
    *   **Editar (Lápis Azul):** Permite corrigir um apontamento (ex: caso o operador tenha esquecido de registrar o término e o tempo tenha ficado como 10 horas).
    *   **Excluir (Lixeira Vermelha):** Remove o registro de produção. O sistema exige confirmação para evitar perdas acidentais de registro de tempo de máquina.

---

## 2. Tela de Edição e Criação (Modal)

A regra central do modal de apontamento é que **é impossível apontar um serviço no "vazio"**. Todo serviço executado precisa estar rigorosamente ancorado em um pneu (carcaça) que já deu entrada no sistema via coleta/OS.

### O Coração do Apontamento
*   **Campo "Código de Barras / Nº Fogo" & Botão "Lupa"**
    *   **Regra de Barreira (Acesso):** Quando o usuário bipa um código ou clica no botão da lupa, o sistema vai até o banco de dados e verifica se aquele pneu existe. 
    *   **Comportamento Se Encontrado:** O sistema trava a identidade do pneu e abre um "Card Informativo" destacando a OS, o Cliente e os detalhes técnicos (Série, Medida, Desenho). Isso ajuda o operador na fábrica a confirmar se o pneu físico na frente dele é o mesmo que o sistema está lendo.
    *   **Comportamento Se Inválido:** O sistema dispara um erro e **impede a gravação**. Não se pode inventar ou forçar a gravação de um pneu não cadastrado.

### Dados do Serviço
*   **Setor e Operador (Listas de Seleção)**
    *   **Ação:** Amarra a responsabilidade técnica. "O pneu X passou pelo setor Y nas mãos do operador Z".
*   **Tempos e Status (Início, Término e Tempo em Minutos)**
    *   O apontamento permite o registro manual ou automático do tempo de produção. O *Status* (Pendente, Finalizado, Cancelado) reflete se o pneu apenas deu entrada na máquina (Pendente) ou se já concluiu o processo (Finalizado).

### Fechamento e Validação
*   **Iniciar/Gravar (Botão Azul)**
    *   **Regra Final:** Ao clicar em salvar, o sistema executa a checagem dupla: "A validação do pneu lá em cima deu certo?". Se o operador apenas digitou um número e tentou salvar correndo sem o sistema validar se o pneu existe, o botão será interrompido e uma mensagem exigirá que ele localize um pneu válido. Estando tudo certo, o histórico produtivo é gravado.
