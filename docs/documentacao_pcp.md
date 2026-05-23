# Documentação: Regras de Negócio - PCP (Programação de Produção)

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de **PCP (Planejamento e Controle de Produção)**. 

O objetivo do PCP é organizar a "fila de trabalho" da fábrica, definindo quais pneus devem ser processados em qual dia, gerando uma ficha física para os operadores de máquina.

---

## 1. Tela Principal (Gestão de Lotes)

A tela principal adota o modelo "Mestre-Detalhe", onde a parte superior mostra o Lote (O PCP) e a parte inferior mostra imediatamente os pneus dentro daquele lote selecionado, sem precisar abrir edições.

### Botões e Ações
*   **Nova Programação (+ Botão Azul)**
    *   **Ação:** Abre o painel para montar um novo lote de pneus para a fábrica trabalhar.
*   **Imprimir PCP (Botão Branco no Topo)**
    *   **Regra de Lote:** Diferente da impressão individual, este botão obedece aos filtros de tela. Se o gerente filtrar "Data de Hoje até Amanhã", este botão vai gerar um relatório massivo contendo todos os pneus de todos os PCPs desses dois dias agrupados.
*   **Ações na Grade (Ícones à direita)**
    *   **Impressora Azul (Impressão Individual):** Gera a "Ficha de Programação de Produção" oficial daquele lote específico. Esta ficha possui espaço para as assinaturas dos operadores e checagens físicas na fábrica.
    *   **Editar e Excluir:** Edita o lote ou remove o PCP inteiro (cancelando o agendamento da produção).

---

## 2. Tela de Edição e Criação (Modal de Agendamento)

A regra de ouro do modal de PCP é que **você não cria pneus aqui, você os "puxa"**. O PCP é apenas um organizador de carcaças que já deram entrada no sistema.

### Regra de Disponibilidade de Pneus
Antes de sequer deixar o usuário digitar, o sistema faz uma filtragem de segurança silenciosa no banco de dados: **Ele só permite listar pneus que NÃO foram faturados**. Um pneu que já foi faturado teoricamente já foi entregue ao cliente e não pode voltar para a fila de produção.

### Adicionando Pneus à Fila
*   **Campo "ID ou Cód. Barras" + Botão Enter**
    *   **Ação de Gatilho:** O usuário do PCP bipará os códigos de barras das carcaças físicas que estão enfileiradas na fábrica. Ao bater o "Enter" no leitor, o sistema tenta achar o pneu.
    *   **Regra de Duplicidade:** Se o operador acidentalmente bipar o mesmo pneu duas vezes no mesmo lote, o sistema bloqueia e ignora a segunda leitura, evitando que a fábrica conte 2 serviços para o mesmo pneu.
    *   **Visualização Imediata:** Ao achar o pneu, ele desce para a grade inferior ("Pneus Agendados"), mostrando o Cliente e a OS para confirmação visual rápida.

### Fechamento do Lote
*   **Imprimir Ficha (Dentro do Modal)**
    *   Permite que o usuário já mande o lote para a impressora antes mesmo de sair da tela de edição.
*   **Salvar Programação (Botão Azul com Disquete)**
    *   **Regra de Validação Final:** O sistema exige, obrigatoriamente, que o PCP tenha **pelo menos 1 pneu** na lista. É proibido salvar um lote de produção "vazio". Ao salvar, a programação é travada e enviada para o controle do chão de fábrica.
