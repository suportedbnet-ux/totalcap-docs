# Documentação: Regras de Negócio - Ordem de Serviço (OS)

Este documento descreve as funcionalidades e as regras de negócio envolvidas nos botões das telas de **Ordens de Serviço** e seus modais de **Edição/Criação** do sistema TotalCAP. [->Assistir Video](https://youtu.be/5Ixb-lU1vHg)

---

## 1. Tela Principal: Listagem de Ordens de Serviço

A tela principal apresenta todas as OSs geradas (manualmente ou a partir de coletas), e dispõe de filtros e controles de grade.

*   **Imprimir Lista (Ícone de Impressora)**
    *   **Ação:** Prepara o formato visual para impressão (ocultando filtros e painéis de ação) e gera um relatório eletrônico contendo a listagem atual de OSs, respeitando os filtros aplicados, somatório de itens e valor total acumulado.
*   **Nova OS (+ Nova OS)**
    *   **Ação:** Inicia uma nova Ordem de Serviço em branco. O sistema abre o modal de criação, limpando todos os campos e desvinculando itens de sessões anteriores.
*   **Botão Limpar Filtros ("X" Cinza)**
    *   **Ação:** Zera de forma imediata todos os termos de pesquisa (ID exato, Número da OS, Cliente e o intervalo de Datas) e recarrega a tabela completa trazendo os dados mais recentes do banco.
*   **Filtrar (Lupa / Buscar)**
    *   **Ação:** Aciona a consulta no banco de dados usando os parâmetros selecionados. 
    *   **Regra de Negócio:** Se o usuário pesquisar por um ID numérico específico no campo ID, o sistema busca aquele registro exato, ignorando as datas.
*   **Visualizar (Olho Verde na grade)**
    *   **Ação:** Abre o formulário da OS referenciada no modo "somente leitura". Nenhuma alteração é permitida, os botões de ação ficam ocultos.
*   **Editar (Lápis Azul na grade)**
    *   **Ação:** Abre o formulário carregando todos os dados do cabeçalho da OS e seus pneus vinculados, permitindo atualizações.
*   **Excluir (Lixeira Vermelha na grade)**
    *   **Regra de Negócio:** Exclui permanentemente a Ordem de Serviço selecionada e "desamarra"/exclui os pneus vinculados a ela em cascata. Há um pop-up de confirmação de segurança para prevenir exclusões acidentais.

---

## 2. Tela de Edição e Criação (Modal de Ordem de Serviço)

Nesta tela é onde ocorre todo o processo de orçamento, vinculação de contratos e amarração de serviços aos pneus do cliente.

### Ações Gerais do Formulário e Cabeçalho
*   **Imprimir OS (Cabeçalho do Modal)**
    *   **Ação:** (Ativo apenas nos modos 'Editar' ou 'Visualizar'). Gera e imprime o comprovante "Espelho da OS", listando os dados da empresa (matriz), o detalhamento financeiro, as observações e o local de assinatura do cliente e do técnico.
*   **Salvar Ordem de Serviço / Salvando (Botão Azul ao rodapé)**
    *   **Regra de Negócio:** Consolida as informações no banco de dados. Verifica e padroniza dados numéricos (converte inteiros e formata valores financeiros) e processa os checkboxes dos status de cada pneu. Impede o salvamento se não houver Número de OS ou se o Cliente não estiver selecionado.
*   **Fechar / Cancelar (Botão Cinza ou X)**
    *   **Ação:** Encerra o modal, descartando as alterações visuais que não foram salvas na base.

### Validadores Avançados e Automação
*   **Validar Serviço (Botão Verde com Escudo no rodapé)**
    *   **Regra Crítica de Negócio:** Ao clicar, o sistema fará uma varredura interna (auditoria) verificando se a OS e **todos** os seus pneus cumprem as exigências:
        *   Nº da OS e Cliente informados;
        *   Deve existir pelo menos um pneu na grade;
        *   Cada pneu deve ter uma Medida, Marca e um **Serviço** atrelado.
    *   **Ação Resultante:** Se algo estiver incorreto, exibe as pendências. Se um ou mais pneus não tiverem o Serviço informado (comum quando OS vem de uma coleta móvel), o sistema sinaliza falta e destrava uma ação oculta: O botão de "Gerar Código Serviço" aparecerá ao lado deste botão.
*   **Gerar Código Serviço (Botão Azul surgido pós-validação)**
    *   **Regra de Negócio Automática:** Como o setor de recapagem combina Medida + Desenho + Tipo de Recap para formar um "Serviço de Produção", é frequente ter itens exóticos novos.
    *   **Ação:** O sistema lê os pneus que estão sem serviço e, para cada um, acessa o banco de dados e cria ativamente o cadastro de um Serviço novo no sistema. 
    *   **Mecânica:** Ele concatena as nomenclaturas (Ex: *Frio Borracha Lisa 275/80 R22.5 Liso BRL*) e atribui o ID gerado automaticamente de volta no pneu da OS. O sistema exibe um alerta avisando que esses serviços nasceram com "Preço Zero" e devem ser ajustados no financeiro posteriormente.

### Ações na Grade de Pneus (Itens da OS)
*   **Ficha de Produção (Botão Branco no título da grade)**
    *   **Ação de Lote:** Imprime o **Cartão de Acompanhamento do Pneu** de produção (para ir para a fábrica colado ao pneu) apenas dos itens cujos *checkboxes da tabela* estiverem marcados.
    *   **Motivos de Recusa:** A impressão inclui automaticamente uma página de "Cartão de Recusa/Não Garantia" anexa ao cartão de acompanhamento.
*   **Checkbox Geral e Específico**
    *   **Ação:** Marca todos ou um pneu individual na grade para a funcionalidade de impressão de fichas em lote informada acima.
*   **Adicionar Pneu (+ Adicionar Pneu)**
    *   **Ação:** Abre o sub-modal de Pneus em branco para incluir um item novo na OS.
*   **Imprimir Ficha Individual (Ícone de Impressora no Pneu)**
    *   **Ação:** Forma rápida de imprimir o Cartão de Acompanhamento apenas daquele pneu (linha) específico, sem usar checkboxes.
*   **Editar Pneu (Ícone de Lápis / Lupa)**
    *   **Ação:** Abre o sub-modal de Pneus preenchido com os dados atuais daquela linha, pronto para alterações ou apenas visualização (lupa).
*   **Excluir Pneu (Lixeira Vermelha no Pneu)**
    *   **Ação:** Remove imediatamente o pneu da listagem visual (o banco só entende a deleção definitiva ao clicar em "Salvar Ordem de Serviço").

---

## 3. Tela de Edição de Detalhes do Pneu (Sub-modal de Item)

Trata da inserção de informações detalhadas como série, DOT, valores, e apuração da produção daquele item.

*   **Regras de Auto-preenchimento In-Line (Sem botão explícito):**
    *   *Se mudar Desenho:* Se o desenho escolhido tem um "Tipo de Recap" padrão associado na tabela de desenhos, o sistema seleciona o Tipo de Recap automaticamente para você.
    *   *Se mudar Medida, Desenho ou Recapagem:* O sistema varre silenciosamente a tabela de Serviços para tentar achar um serviço que coincida exatamente com as três informações. Se achar, já atrela o serviço e copia o Preço (Valor) dele para o pneu em tela.
    *   *Se escolher Serviço manualmente:* O sistema faz o reverso; preenche automaticamente o Valor, Medida, Desenho, Recapagem e Marca, baseados nas definições matrizes daquele serviço na tabela mestre.
*   **Controles de Checkbox (Status Produzido / Status Faturado)**
    *   **Ação:** São definidores de status visual do pneu na listagem. Gerenciam se o item já finalizou a linha fabril e se o financeiro já contabilizou, mas não afetam logicamente o status principal da OS de forma restrita durante o clique.
*   **Confirmar Pneu / Atualizar Pneu (Botão Azul)**
    *   **Ação:** Aceita os dados preenchidos e injeta (ou atualiza) na tabela da OS por trás.
    *   **Regra de Código de Barras Automático:** É no momento de confirmar que, se for uma edição de pneu já existente no banco (tem um ID numérico), ele cria um código de barras simulado adicionando zeros à esquerda (ex: `00000342`), para que o leitor de barras dos Cartões de Produção funcione perfeitamente.
*   **Cancelar / Fechar Detalhes (Botão Cinza)**
    *   **Ação:** Descarta o que foi digitado/alterado e retorna à OS.
