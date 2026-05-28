# Documentação: Regras de Negócio - Cidades

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Cidades e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Cidades)

A "Cidade" é o registro de municípios com código IBGE para referência geográfica em endereços de clientes, transportadoras e outras entidades.

### Ações e Funcionalidades

**Nova Cidade (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova cidade com nome, UF e código IBGE.

**Barra de Busca**
- **Ação**: Permite localizar cidades por nome, UF ou código IBGE. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da cidade no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a cidade do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Nome (nome) | text | **Sim** | Nome da cidade |
| UF (uf) | text | **Sim** | Sigla do estado (2 caracteres) |
| Código IBGE (codigoibge) | number | Não | Código IBGE da cidade |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome e UF**: Ambos os campos são obrigatórios. Se faltar algum, exibe "Nome e UF são obrigatórios." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/cidades/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Adiciona classe CSS de impressão ao `body`.
2. Aciona `window.print()` para gerar a listagem de cidades.
3. Remove a classe CSS após 500ms.
