# Documentação: Regras de Negócio - Falhas (Cadastro)

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Falhas e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Tipos de Falha)

A "Falha" é a classificação de não conformidades utilizada no controle de qualidade. A tela gerencia os tipos de falha que podem ser associados a registros de produção e laudos técnicos.

### Ações e Funcionalidades

**Nova Falha (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo tipo de falha com código, descrição e valor associado.

**Barra de Busca**
- **Ação**: Permite localizar falhas por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da falha no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a falha do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código da falha |
| Descrição (descricao) | text | **Sim** | Descrição da falha |
| Valor (valor) | number | Não | Valor associado |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação**: Os campos `codigo` e `descricao` são obrigatórios (atributo HTML5 `required`). Se algum estiver vazio, o navegador bloqueia a gravação.
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/falhas/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
