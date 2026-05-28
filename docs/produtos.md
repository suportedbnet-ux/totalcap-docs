# Documentação: Regras de Negócio - Produtos

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Produtos e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Produtos)

O "Produto" representa os itens e matérias-primas utilizadas no processo produtivo e comercializados pela empresa. A tela gerencia o catálogo completo de materiais.

### Ações e Funcionalidades

**Novo Produto (+ Botão Azul Superior)**
- **Ação**: Abre o modal de cadastro para registrar um novo produto ou matéria-prima no sistema.

**Barra de Busca**
- **Ação**: Permite localizar produtos por código, descrição ou grupo. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do produto no modal para alteração.
- **Excluir (Lixeira Vermelha)**: Remove o produto do catálogo. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código Produto (codprod) | text | **Sim** | Código identificador do produto |
| Grupo (id_grupo) | select | Não | Grupo/categoria do produto |
| Descrição (descricao) | text | **Sim** | Nome/descrição do produto |
| Unidade (unidade) | text | Não | Unidade de medida |
| Preço Venda (precoven) | number | Não | Preço de venda |
| Valor Custo (vrcusto) | number | Não | Valor de custo |
| Serviço (id_servico) | select | Não | Serviço vinculado |
| Ativo (ativo) | checkbox | Não | Produto ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Código e Descrição**: Ambos os campos `codprod` e `descricao` são obrigatórios. Se faltar algum, exibe "Código e descrição são obrigatórios." e bloqueia a gravação.
2. **Requisição**: Os dados são enviados via `POST` (novo) ou `PUT` (edição) para o endpoint `/produtos/`.
3. **Pós-gravação**: A lista de produtos é recarregada e o modal é fechado.
4. **Paginação**: A lista exibe 50 registros por página.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão implementada.
