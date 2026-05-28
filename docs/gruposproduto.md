# Documentação: Regras de Negócio - Grupos de Produto

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Grupos de Produto e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Grupos de Produto)

O "Grupo de Produto" categoriza e classifica os materiais e produtos do sistema por tipo ou família (ex: Borracha, Câmara, Protetor). A tela gerencia as categorias de agrupamento.

### Ações e Funcionalidades

**Novo Grupo de Produto (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo grupo com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar grupos por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do grupo no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o grupo do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código do grupo |
| Descrição (descricao) | text | **Sim** | Nome do grupo |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório (atributo HTML5 `required`).
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/grupos-produto/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Chama `window.print()` para gerar a listagem de grupos de produto.
2. Utiliza formatação CSS de impressão.
