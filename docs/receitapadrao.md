# Documentação: Regras de Negócio - Receita Padrão

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Receita Padrão e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Receitas Padrão)

A "Receita Padrão" é a fórmula de composição de materiais utilizada como base para a produção. Define a lista de matérias-primas e quantidades necessárias para cada serviço ou processo.

### Ações e Funcionalidades

**Nova Receita Padrão (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova receita com descrição e sua lista de matérias-primas.

**Barra de Busca**
- **Ação**: Permite localizar receitas por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da receita e seus itens no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a receita do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário Principal

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código da receita |
| Descrição (descricao) | text | **Sim** | Nome da receita |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Campos do Sub-formulário de Itens (Matérias-Primas)

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Produto (id_produto) | select | Não | Matéria-prima |
| Quantidade (quant) | number | Não | Quantidade necessária |
| Ordem (ordem) | number | Não | Ordem de aplicação |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório (atributo HTML5 `required`).
2. **Montagem do Payload**: Os dados da receita e sua lista de matérias-primas são estruturados em um único payload e enviados via `POST` (nova) ou `PUT` (edição) para o endpoint `/receitas/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Adiciona classe CSS de impressão ao `body`.
2. Aciona `window.print()` para gerar a listagem de receitas.
3. Remove a classe CSS após 500ms.
