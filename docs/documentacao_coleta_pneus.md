# Documentação: Regras de Negócio - Coleta de Pneus

Este documento descreve as funcionalidades e as regras de negócio envolvidas nos botões das telas de **Coleta de Pneus**, **Leitura OCR** e **Edição de Coleta de Pneus** do sistema TotalCAP.  [->Assistir Video](https://youtu.be/bAk5sJI-cZA)

---

## 1. Tela Principal: Coleta de Pneus

A tela principal ("grid") apresenta a listagem de coletas realizadas, permitindo filtros e ações diretas nos registros.

*   **Leitura OCR**
    *   **Ação:** Abre o modal de "Leitura Inteligente", iniciando o fluxo para capturar ou fazer upload de uma imagem do pneu/documento para análise via Inteligência Artificial.
*   **Imprimir Lista**
    *   **Ação:** Formata a tela ocultando elementos não essenciais e aciona o diálogo de impressão do navegador para gerar um relatório em papel da lista atual de coletas (respeitando os filtros aplicados).
*   **Nova Coleta**
    *   **Ação:** Abre o formulário de coleta (modal) em modo de criação. Os campos e dados de sessão são limpos (zerados) para iniciar um registro em branco.
*   **Limpar Filtros (Botão de 'X')**
    *   **Ação:** Reseta todos os parâmetros de busca (ID, cliente, vendedor, OS) e os filtros de data (data inicial e final), recarregando a lista completa de registros na tela.
*   **Filtrar (Lupa)**
    *   **Ação:** Como o sistema é reativo (filtra automaticamente enquanto o usuário digita), este botão funciona como um reforço visual, confirmando para o usuário a aplicação dos filtros estabelecidos.
*   **Gera OS (Botão Laranja)**
    *   **Regra de Negócio:** Converte a coleta prévia em uma Ordem de Serviço (OS) efetiva. 
    *   **Validação:** Só pode ser acionado se a coleta estiver com o status exato de **"Ok"** (ou seja, se já foi validada e está sem pendências).
    *   **Bloqueio:** Caso a coleta já tenha sido transformada em OS (Status **"GOS"**), o botão fica permanentemente bloqueado/desabilitado. O sistema também pede uma confirmação de alerta antes da conversão e, se aceito, envia o usuário para a tela de Ordens de Serviço carregando os dados.
*   **Visualizar Detalhes (Olho Verde)**
    *   **Ação:** Abre a coleta selecionada no modo de visualização. O formulário é carregado com as informações preenchidas, porém todos os campos ficam bloqueados para edição.
*   **Editar Coleta (Lápis Azul)**
    *   **Regra de Negócio:** Abre a coleta em modo de edição.
    *   **Bloqueio:** Se a coleta já possui uma OS gerada (Status **"GOS"**), não é mais permitido editá-la.
*   **Excluir Coleta (Lixeira Vermelha)**
    *   **Regra de Negócio:** Deleta o registro inteiro da coleta e seus pneus vinculados do banco de dados após uma janela de confirmação de segurança.
    *   **Bloqueio:** Coletas com status **"GOS"** não podem ser excluídas.

---

## 2. Tela de Leitura Inteligente (OCR)

Tela responsável por analisar a imagem do pneu ou do romaneio de coleta usando IA para extração automatizada de dados.

*   **Câmera**
    *   **Ação:** Aciona um recurso do dispositivo (especialmente em mobiles) que abre a câmera nativa do aparelho para o usuário tirar a foto do pneu em tempo real.
*   **Selecionar Foto**
    *   **Ação:** Abre o gerenciador de arquivos ou a galeria de imagens do dispositivo para que o usuário escolha uma foto previamente capturada.
*   **Envia p/ IA (Botão Primário na Leitura)**
    *   **Ação:** Compacta a imagem enviada para economizar dados de rede (mobile) e a envia ao Backend (API da IA). 
    *   **Regra de Negócio Pós-Retorno:**
        *   Tenta localizar clientes de forma autônoma através da varredura de CPF/CNPJ.
        *   Tenta cruzar (parear) rigorosamente os dados lidos do pneu (Medida, Marca, Desenho e tipo de Recapagem) buscando correspondências exatas ou por semelhança avançada (prefixo de tamanho) no banco de dados do sistema.
        *   Carrega a inteligência de auto-associação: se encontra o desenho, pode inferir a recapagem associada a ele caso a IA não tenha lido essa informação com clareza.
        *   Fica desabilitado temporariamente enquanto o envio para o servidor estiver em processamento.
*   **Fechar / Descartar (Botão de Cruz / Vermelho)**
    *   **Ação:** Cancela o processo de leitura em andamento, apaga a foto selecionada da memória e esvazia eventuais resultados gerados na tela de OCR.
*   **Gerar Coleta (Botão Azul ao final da leitura)**
    *   **Ação:** Transforma as respostas lidas pela Inteligência Artificial num registro estruturado, fechando a tela de OCR e abrindo imediatamente a tela de **Nova Coleta**, transferindo todos os dados mastigados e os pneus listados pela IA para dentro do formulário.

---

## 3. Tela de Edição de Coleta de Pneus (Modal do Formulário)

Esta seção lida tanto com a gravação de uma coleta na íntegra quanto as regras do sub-modal de adição/edição de pneus individuais.

### Botões do Formulário Geral
*   **Imprimir Coleta (Cabeçalho do Modal)**
    *   **Ação:** (Somente aparece nos modos de 'Editar' ou 'Visualizar'). Abre a visão formatada em página A4 para emitir o comprovante documentado da coleta em tela, junto com campos de assinatura para o cliente e o conferente.
*   **Validar Dados (Botão Verde com Escudo)**
    *   **Ação Crítica de Validação de Negócio:** Antes de gerar OS, os dados precisam ser coerentes. Este botão cruza informações e exige:
        *   Se a coleta já está como "GOS", ela é ignorada (não pode revalidar).
        *   É **obrigatório** ter um *Cliente* e um *Vendedor* informados na cabeça da coleta.
        *   É **obrigatório** ter no mínimo 1 pneu vinculado à coleta.
        *   Para cada pneu listado, o sistema audita se as referências cruciais (Medida, Marca, Desenho e Piso) estão preenchidas.
        *   O botão tenta resolver problemas com a Inteligência Artificial: Tenta associar textos vagos do OCR de um desenho com IDs reais no banco de dados para evitar pneus órfãos.
        *   **Resultado:** Se falhar na auditoria, exibe erro ao topo e zera o Status da coleta. Se tiver sucesso, aprova o documento trocando o Status para **"Ok"**, notificando o usuário que ele está liberado para prosseguir e gravar.
*   **Salvar Coleta / Salvar Alterações**
    *   **Regra de Negócio:** Faz a gravação dos dados no banco.
    *   *Bloqueio de Vendedor:* Não deixa gravar em hipótese nenhuma se o vendedor estiver em branco (0).
    *   *Auto-cálculo:* Nos bastidores da gravação, o botão reprocessa automaticamente a quantidade total de pneus e o Valor Total Financeiro (`vtotal`) somando a grade.

### Botões do Sub-Modal de Pneus
*   **Editar (Lápis Azul no Item de Pneu)**
    *   **Ação:** Abre uma tela menor com os dados exatos do pneu selecionado para alterar medidas, valores, piso ou ler os valores sugeridos do OCR.
*   **Excluir (Lixeira Vermelha no Item de Pneu)**
    *   **Ação:** Elimina o pneu da listagem que será salva sem questionamentos de alerta.
*   **Salvar Pneu**
    *   **Ação:** Não grava no banco ainda. Apenas injeta os dados preenchidos sobre o pneu de volta no array de pneus da coleta geral em tela.
*   **Cancelar**
    *   **Ação:** Desfaz qualquer alteração e fecha a tela do detalhe do pneu.
