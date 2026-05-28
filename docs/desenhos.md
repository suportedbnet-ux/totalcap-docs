# Documentação: Regras de Negócio - Desenhos

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Desenhos e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Desenhos)

O "Desenho" representa a banda de rodagem do pneu, classificando o padrão de pisada. A tela gerencia o catálogo de desenhos e permite filtrar por tipo de recapagem.

### Ações e Funcionalidades

**Novo Desenho (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo desenho com código, descrição e tipo de recapagem relacionado.

**Barra de Busca**
- **Ação**: Permite localizar desenhos por descrição ou código. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do desenho no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o desenho do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código interno |
| Descrição (descricao) | text | **Sim** | Nome do desenho |
| Recapagem (id_recap) | select | Não | Tipo de recapagem relacionada |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório. Se vazio, exibe "A descrição do desenho é obrigatória." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/desenhos/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Chama `window.print()` para gerar a listagem de desenhos.
2. Utiliza formatação CSS de impressão.
