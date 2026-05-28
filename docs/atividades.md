# Documentação: Regras de Negócio - Atividades

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Atividades e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Atividades)

A "Atividade" é a classificação econômica utilizada para categorizar clientes conforme seu ramo de negócio (ex: Transportadora, Agronegócio, Mineração).

### Ações e Funcionalidades

**Nova Atividade (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova atividade econômica com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar atividades por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da atividade no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a atividade do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código da atividade |
| Descrição (descricao) | text | **Sim** | Descrição da atividade |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Código e Descrição**: Ambos os campos são obrigatórios. Se faltar algum, exibe "Código e Descrição são obrigatórios." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/atividades/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
