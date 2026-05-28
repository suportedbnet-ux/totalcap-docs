# Documentação: Regras de Negócio - Setores

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Setores e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Setores Produtivos)

O "Setor" representa cada etapa do fluxo produtivo da fábrica (ex: Raspagem, Vulcanização, Pintura). A tela define os parâmetros operacionais, sequenciamento, regras de geração de baixa de matéria-prima e tipo de avaliação de cada etapa.

### Ações e Funcionalidades

**Novo Setor (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo setor produtivo, definindo sua posição no fluxo e regras operacionais.

**Barra de Busca**
- **Ação**: Permite localizar setores por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os parâmetros completos do setor no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o setor do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código do setor |
| Descrição (descricao) | text | **Sim** | Nome do setor (ex: Raspagem, Vulcanização) |
| Sequência (sequencia) | number | Não | Ordem no fluxo produtivo |
| Tempo Médio (tempomedio) | number | Não | Tempo médio de operação (min) |
| Tempo Mínimo (tempominimo) | number | Não | Tempo mínimo de operação (min) |
| Qtd Meta (qmeta) | number | Não | Quantidade meta |
| Próximo Setor (proxsetor) | text | Não | Setor subsequente no fluxo |
| Só Passagem (sopassagem) | checkbox | Não | Setor apenas de passagem |
| Avaliação (avaliacao) | checkbox | Não | Setor realiza avaliação |
| Falha (falha) | checkbox | Não | Setor registra falhas |
| Exame Final (examefinal) | checkbox | Não | Setor é exame final |
| Faturamento (faturamento) | checkbox | Não | Setor relacionado a faturamento |
| Expedição (expedicao) | checkbox | Não | Setor de expedição |
| Gera Baixa MP (gerabaixamp) | checkbox | Não | Gera baixa de matéria-prima |
| Valor (valor) | number | Não | Valor associado ao setor |
| Ativo (ativo) | checkbox | Não | Setor ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório. Se vazio, exibe "A descrição do setor é obrigatória." e bloqueia a gravação.
2. **Requisição**: Os dados são enviados via `POST` (novo) ou `PUT` (edição) para o endpoint `/setores/`.
3. **Pós-gravação**: A lista de setores é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Adiciona classe CSS de impressão ao `body`.
2. Aciona `window.print()` para gerar a listagem de setores.
3. Remove a classe CSS após 500ms.
