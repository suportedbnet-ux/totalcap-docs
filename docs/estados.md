# Documentação: Regras de Negócio - Estados (UF)

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Estados e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Estados)

O "Estado" (UF) representa as unidades federativas do Brasil cadastradas no sistema para referência geográfica em endereços de clientes, transportadoras e demais entidades.

### Ações e Funcionalidades

**Novo Estado (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo estado com sigla (UF) e nome completo.

**Barra de Busca**
- **Ação**: Permite localizar estados por UF ou nome. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do estado no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o estado do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| UF (uf) | text | **Sim** | Sigla do estado (2 caracteres) |
| Nome (nome) | text | **Sim** | Nome completo do estado |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de UF e Nome**: Ambos os campos são obrigatórios. Se faltar algum, exibe "UF e Nome são obrigatórios." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/estados/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
