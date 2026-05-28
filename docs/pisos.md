# Documentação: Regras de Negócio - Pisos

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Pisos e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Pisos)

O "Piso" representa o tipo de banda de rodagem utilizado na classificação de medidas de pneus. A tela gerencia o catálogo de pisos para composição técnica.

### Ações e Funcionalidades

**Novo Piso (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo piso com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar pisos por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do piso no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o piso do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código do piso |
| Descrição (descricao) | text | Não | Descrição |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação**: O campo `codigo` é obrigatório. Se vazio, exibe "O código do piso é obrigatório." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/pisos/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
