# Documentação: Regras de Negócio - Informe de Serviços e Cadastro de Serviços

Este documento detalha em linguagem natural as regras de negócio e funcionalidades atreladas aos botões das telas de **Informe de Serviços** (apontamento por pneu) e de **Serviços** (Catálogo/Edição de novos serviços) no sistema Totalcap.

---

## 1. Tela de Informe de Serviços

Esta tela é utilizada pelo setor de produção ou faturamento para bipar (ler o código de barras) um pneu individual e realizar ajustes finos, inserir serviços extras (manchões, consertos) ou laudar uma recusa.

### Buscador e Ações Gerais
*   **Identificar Pneu (Lupa)**
    *   **Ação:** O usuário digita o ID numérico ou escaneia o código de barras gerado pela ficha de produção. O sistema busca esse pneu específico e bloqueia buscas inválidas.
    *   **Regra de Negócio de Bloqueio:** Ao encontrar o pneu, o sistema verifica a flag de Faturamento (`statusfat`). Se o pneu já constar como "Faturado", o sistema emite um alerta fixo em tela e **desabilita** quase todos os botões de ação e edição (não é possível alterar laudos ou serviços de pneus já cobrados do cliente).
*   **Nova Pesquisa (Botão Cinza)**
    *   **Ação:** Limpa os painéis e o pneu selecionado no momento, voltando a tela ao estado de "pronta para bipe" do próximo pneu.

### Ações de Edição do Pneu
*   **Imprime Carta Avaliação (Botão de Impressora no Examinador)**
    *   **Regra de Negócio:** Este botão só se torna clicável se um "Motivo Recusa" for selecionado. 
    *   **Ação:** Gera uma impressão especial (Laudo Técnico de Recusa / Carta de Avaliação de Carcaça) formatada para o cliente, contendo todos os dados da transportadora/cliente, as dimensões do pneu e o motivo pelo qual ele não pôde ser recapado.
*   **Salvar Alterações do Pneu (Botão Azul)**
    *   **Ação:** Consolida alterações nos dados básicos do pneu (mudança de medida, valor da reforma, examinador, etc).
    *   **Regra de Negócio Crítica (Recusa):** Se o operador alterar o campo "Motivo Recusa" de *Vazio* para um motivo *Válido*, o sistema realiza uma automação pesada ao salvar: 
        1. Altera forçadamente o tipo de recapagem para "Recusado" (Id 1).
        2. **Deleta** automaticamente todos os serviços de recapagem ou conserto que já estavam vinculados a este pneu.
        3. Cria um único serviço padronizado de "Recusa" para este pneu com o valor do pneu atual (muitas vezes zerado ou taxado).
        Se a recusa for retirada, ele também limpa os serviços de recusa.

### Ações na Grade de Serviços Adicionais
*   **Adicionar Serviço (+ Adicionar Serviço)**
    *   **Ação:** Serve para lançar serviços extras executados no pneu (como remendos, vulcanização extra, etc).
    *   **Regra de Negócio Crítica (Serviço Automático):** Se o usuário clicar neste botão e o pneu **ainda não possuir nenhum serviço lançado** (Quantidade de Serviços = 0), o sistema não abre a janela de escolha. Em vez disso, ele assume que o operador quer lançar o serviço padrão daquele pneu (baseado na medida e desenho) e o **lança automaticamente no banco**, recarregando a página e poupando tempo. Se já houver 1 ou mais serviços, o clique abre normalmente a janela (modal) para escolher outro serviço da lista.
*   **Editar / Excluir Serviço Adicional (Ícones Lápis e Lixeira)**
    *   **Ação:** Permite alterar o valor unitário ou quantidade de um serviço extra, ou excluí-lo.
    *   **Regras:** Como mencionado, totalmente inativos se o pneu constar como "Faturado".

---

## 2. Tela de Cadastro e Edição de Novos Serviços (Catálogo)

Esta tela é o "Menu de Restaurante" da recapadora. Nela são cadastrados os serviços base que poderão ser utilizados na OS e no Informe.

### Ações na Listagem
*   **Imprimir (Botão Secundário no Cabeçalho)**
    *   **Ação:** Gera a impressão da lista mestra de todos os serviços cadastrados na base, útil como catálogo de preços físicos para vendedores.
*   **Novo Serviço (+ Novo Serviço)**
    *   **Ação:** Abre o formulário para criação de um novo serviço, zerando os dados.
*   **Filtros (Selects de Recapagem, Medida e Desenho)**
    *   **Ação:** Permitem cruzar filtros para encontrar os serviços rapidamente (Ex: "Mostre todos os serviços da Medida 275/80 para Desenho Liso").
*   **Status Ativo/Inativo (Grade)**
    *   **Regra Visual:** Exibe de forma rápida se um serviço ainda pode ser vendido ou se foi descontinuado.

### Ações no Modal de Edição/Criação
*   **Automação de Descrição e Código (Sem Botão, Lógica Reativa)**
    *   **Regra de Negócio (Nomenclatura Padrão):** O sistema não espera que o usuário digite a descrição do serviço manualmente em todos os casos. Ao selecionar o *Tipo de Recapagem*, a *Medida* e o *Desenho*, o sistema **escreve sozinho** a descrição do serviço no formato `[Medida] [Desenho] [Código do Tipo Recapagem]`.
    *   **Regra de Negócio (Código de Serviço):** Da mesma forma, o Código interno referencial do serviço é autogerado concatenando os IDs: `ID_Medida.ID_Desenho.ID_Recap`. Isso garante que serviços não fiquem duplicados e sigam o padrão exato exigido na validação automática da Ordem de Serviço.
*   **Salvar (Botão Azul)**
    *   **Ação:** Grava o serviço no banco de dados. Exige, impreterivelmente, que o serviço possua uma descrição (que na maioria das vezes é a gerada pela automação acima).
*   **Checkbox "Serviço ativo para novas ordens"**
    *   **Regra:** Se desmarcado, o serviço será inativado e deixará de aparecer na lista de sugestões automáticas nas telas de Ordem de Serviço, impedindo que os vendedores lancem serviços antigos ou com preços defasados.
