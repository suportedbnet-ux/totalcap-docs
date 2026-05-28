# Documentação: Regras de Negócio - Regiões

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Regiões e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Regiões)

A "Região" é o classificador geográfico utilizado para segmentação de mercado, agrupamento de clientes e definição de regras de comissão. Complementa a segmentação por área.

### Ações e Funcionalidades

**Nova Região (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova região geográfica com código e nome.

**Barra de Busca**
- **Ação**: Permite localizar regiões por código ou nome. A busca é dinâmica e atualiza a listagem em tempo real.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da região no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a região do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código da região |
| Nome (nome) | text | **Sim** | Nome da região |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Código e Nome**: Ambos os campos são obrigatórios. Se faltar algum, exibe "Código e Nome são obrigatórios." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/regioes/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
