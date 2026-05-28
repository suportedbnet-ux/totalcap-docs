# Documentação: Regras de Negócio - Origens de Defeito

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Origens de Defeito e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Origens de Defeito)

A "Origem de Defeito" classifica a causa dos problemas identificados nos pneus durante a elaboração de laudos técnicos. A tela gerencia as categorias de origem para análise de qualidade.

### Ações e Funcionalidades

**Nova Origem de Defeito (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova origem de defeito com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar origens por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da origem no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a origem do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código da origem |
| Descrição (descricao) | text | **Sim** | Descrição da origem do defeito |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação**: Os campos `codigo` e `descricao` são obrigatórios (atributo HTML5 `required`).
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/taborigdef/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
