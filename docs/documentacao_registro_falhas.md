# Documentação: Regras de Negócio - Registro de Falhas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e funcionalidades da tela de **Registro de Falhas** e de seu modal de criação/edição. Toda a identidade visual desta tela usa tons de vermelho para alertar que se trata do controle de interrupções, quebras e problemas na produção.

---

## 1. Tela Principal (Gestão de Interrupções)

Esta tela é o painel onde o gerente de produção ou manutenção acompanha tudo o que deu errado na fábrica, seja uma máquina que quebrou ou um pneu que estourou durante o processo.

### Ações e Funcionalidades
*   **Novo Registro (+ Botão Vermelho)**
    *   **Ação:** Abre o formulário para documentar uma nova ocorrência de falha no chão de fábrica.
*   **Grade de Ocorrências**
    *   Exibe rapidamente quando aconteceu, onde (Setor), quem reportou (Operador) e qual o "Tipo de Falha" (destacado em vermelho para chamar atenção).
*   **Ações Individuais (Editar e Excluir)**
    *   **Editar (Lápis Azul):** Permite complementar a observação da falha ou corrigir o tipo de falha apontado.
    *   **Excluir (Lixeira Vermelha):** Remove o registro histórico da falha após confirmação do usuário.

---

## 2. Tela de Edição e Criação (Modal)

A regra central do modal de Falhas é que ela **pode ser mista**: a falha pode ser geral (da fábrica/máquina) ou pode ser específica (culpa de uma carcaça/pneu que apresentou defeito).

### Rastreabilidade Opcional do Pneu
*   **Campo "ID Pneu" & Botão "Lupa de Pesquisa"**
    *   **Regra de Flexibilidade:** Diferente da tela de Apontamento (onde o pneu é obrigatório), aqui o vínculo do pneu é **opcional**. Se acabou a energia na fábrica, a falha é do setor, não de um pneu específico.
    *   **Botão Pesquisar (Lupa):** Caso a falha seja em um pneu (Ex: *o pneu estourou na autoclave*), o operador digita o ID interno do pneu e clica na lupa.
    *   **Regra do Card de Segurança (Card Verde):** Se o sistema encontrar o pneu, ele exibe um quadro verde validando as informações técnicas (OS, Cliente, Marca, Medida, Série). Isso serve para o gerente ter absoluta certeza de qual pneu de qual cliente causou ou sofreu o problema.

### Categorização Obrigatória da Ocorrência
*   **Campos de Classificação (Setor, Operador e Tipo de Falha)**
    *   **Regra de Negócio:** Para fins de métricas (KPIs de qualidade e manutenção), o sistema obriga a informação de **Onde** ocorreu (Setor), **Quem** estava operando ou reportou (Operador) e **Qual a categoria** (Tipo de Falha, ex: Falha Mecânica, Falha Humana, Pneu Recusado).
*   **Motivo / Observação**
    *   Campo de texto livre para o operador relatar o que exatamente aconteceu (Ex: *"Lixadeira travou rolamento principal e começou a soltar fumaça"*).

### Fechamento
*   **Salvar (Botão Vermelho com Ícone de Disquete)**
    *   **Ação e Validação:** Ao clicar, o sistema verifica se as 3 categorias obrigatórias (Setor, Operador, Tipo de Falha) foram informadas. Se estiver tudo certo, a falha entra para o histórico da produção.
