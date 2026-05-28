# Documentação: Regras de Negócio - Serviços

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Serviços e seu respectivo modal de criação/edição.

## 1. Tela Principal (Catálogo de Serviços)

O "Serviço" é o catálogo de operações de recapagem que podem ser executadas nos pneus. Cada serviço pode ser vinculado a medidas, desenhos, produtos e valores específicos, compondo a base para faturamento e produção.

### Ações e Funcionalidades

**Novo Serviço (+ Botão Azul Superior)**
- **Ação**: Abre o modal de cadastro para registrar um novo serviço no catálogo, permitindo vincular parâmetros técnicos e comerciais.

**Barra de Busca**
- **Ação**: Permite localizar serviços por descrição, código ou grupo. A busca é dinâmica e filtra a listagem em tempo real.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do serviço no modal para alteração de parâmetros.
- **Excluir (Lixeira Vermelha)**: Remove o serviço do catálogo. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código do serviço |
| Descrição (descricao) | text | **Sim** | Descrição/nome do serviço |
| Medida (id_medida) | search/autocomplete | Não | Medida do pneu vinculada |
| Desenho (id_desenho) | search/autocomplete | Não | Desenho vinculado |
| Produto (id_produto) | search/autocomplete | Não | Produto relacionado |
| Recapagem (id_recap) | select | Não | Tipo de recapagem |
| Valor (valor) | number | Não | Valor do serviço |
| Grupo (grupo) | text | Não | Grupo de serviço |
| Ativo (ativo) | checkbox | Não | Serviço ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório. Se vazio, exibe "A descrição do serviço é obrigatória." e bloqueia a gravação.
2. **Requisição**: Os dados são enviados via `POST` (novo) ou `PUT` (edição) para o endpoint `/servicos/`.
3. **Pós-gravação**: A lista de serviços é recarregada e o modal é fechado.
4. **Paginação**: A lista exibe 50 registros por página.

### Regras de Negócio - Botão Imprimir

#### Imprimir
1. Chama diretamente `window.print()` para gerar a listagem de serviços.
2. Utiliza as regras CSS de `@media print` para formatação.
