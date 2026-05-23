# Documentação: Regras de Negócio - Consumo Mat. Prima

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de **Consumo de Matéria Prima**, além de seu formulário de lançamento.

A identidade visual do módulo utiliza a cor Laranja/Âmbar para destacar que se trata do controle de insumos e custos.

---

## 1. Tela Principal (Gestão de Insumos)

A tela principal possui uma regra de negócio crítica: **A Divisão de Custos**. O consumo de material na recauchutadora pode ser geral (custo de fábrica) ou específico (custo daquele pneu). Por isso, a tela é dividida em duas grandes Abas:

### Aba 1: Consumo Aleatório
Destinada ao lançamento de materiais que não podem ser medidos por pneu, como galões de solvente ou tinta geral.
*   **Novo Lançamento (+ Botão Laranja)**
    *   **Ação:** Abre o formulário de consumo limpo. Qualquer material lançado aqui entrará como "Custo Geral de Produção" da empresa no final do mês, não afetando o custo unitário de um pneu específico.
*   **Ações na Grade**
    *   **Visualizar, Editar e Excluir:** Permitem a gestão padrão do lançamento, para corrigir eventuais erros de digitação na quantidade de material (ex: digitou 500kg ao invés de 5kg).

### Aba 2: Consumo Padrão Por Pneu
Destinada ao lançamento preciso da "Receita do Bolo". Onde se lança exatamente quantos quilos de borracha foram aplicados naquele pneu específico.
*   **Busca de Pneus**
    *   A grade muda completamente e passa a mostrar a lista de carcaças físicas em produção.
*   **Botão "M.Prima" (Pacote Azul na Linha)**
    *   **Ação de Direcionamento:** Ao clicar neste botão, o sistema abre um "Sub-Modal" exclusivo daquele pneu (Ex: Pneu Fogo #1234). 
    *   **Novo Material (Dentro do Pneu):** Ao clicar em "Novo Material" dentro dessa tela, o formulário de consumo é aberto, porém com uma **regra invisível**: o sistema trava a "ID" daquele pneu no fundo. Tudo que for salvo vai ser diretamente adicionado ao Custo de Produção daquele pneu específico, diminuindo o estoque e aumentando a precisão financeira.

---

## 2. Tela de Edição e Criação (Modal)

Este modal é universal. Ele serve tanto para lançar o solvente geral da fábrica (pela Aba 1) quanto a borracha específica do pneu (pela Aba 2).

### Campos de Registro
*   **Data do Movimento**
    *   Permite retroagir datas (Ex: registrar na segunda-feira um consumo que ocorreu no sábado de plantão).
*   **Produto / Insumo**
    *   Exibe a lista de produtos atrelados à sua unidade de medida (Ex: Borracha Camelback (KG), Válvula (UN)).
*   **Quantidade**
    *   **Regra de Precisão:** Como se trata de química e borracha, o campo de quantidade aceita precisão de 3 casas decimais (ex: `1.250` kg).
*   **Observação**
    *   Usado para justificar excessos de consumo (Ex: *"Borracha extra devido a falha na raspagem"*).

### Fechamento
*   **Salvar Consumo (Botão Laranja com Disquete)**
    *   **Validação:** O sistema proíbe o salvamento se não houver um Produto e uma Quantidade.
    *   **Ação:** Salva o registro e, se tiver sido aberto via "Consumo por Pneu", a tela atualizará mostrando os materiais vinculados àquela carcaça imediatamente.
