# Documentação: Regras de Negócio - Vendedores

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Vendedores e seu respectivo modal de criação/edição.

## 1. Tela Principal (Gestão de Vendedores)

O "Vendedor" é o representante comercial ou vendedor interno que atua na prospecção e atendimento de clientes. A tela permite gerenciar informações pessoais, área de atuação e metas mensais de vendas.

### Ações e Funcionalidades

**Novo Vendedor (+ Botão Azul Superior)**
- **Ação**: Abre o modal de cadastro para registrar um novo vendedor com dados pessoais, endereço e parâmetros de atuação.

**Barra de Busca**
- **Ação**: Permite localizar vendedores por nome, código ou apelido. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do vendedor no modal, incluindo suas metas cadastradas.
- **Excluir (Lixeira Vermelha)**: Remove o vendedor do sistema. O sistema exige confirmação para evitar perda acidental.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário Principal

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código do vendedor |
| Apelido (apelido) | text | Não | Apelido do vendedor |
| Nome (nome) | text | **Sim** | Nome do vendedor |
| Área (id_area) | select | Não | Área comercial |
| Região (id_regiao) | select | Não | Região de atuação |
| Endereço (endereco) | text | Não | Endereço |
| CEP (cep) | text | Não | CEP |
| Cidade (cidade) | text | Não | Cidade |
| UF (uf) | text | Não | Estado |
| Telefone (fone) | text | Não | Telefone |
| CPF/CNPJ (cpfcnpj) | text | Não | Documento |
| Cargo (cargo) | text | Não | Cargo |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Campos do Sub-formulário de Metas

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Ano (ano) | number | Não | Ano da meta |
| Mês (mes) | number (1-12) | Não | Mês da meta |
| Valor Meta (valor_meta) | number | Não | Meta em valor financeiro |
| Quantidade Meta (quantidade_meta) | number | Não | Meta em quantidade |
| Ativo (ativo) | checkbox | Não | Meta ativa |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome**: O campo `nome` é obrigatório. Se vazio, exibe "O nome é obrigatório." e bloqueia a gravação.
2. **Requisição do Vendedor**: Os dados principais são enviados via `POST` (novo) ou `PUT` (edição) para o endpoint `/vendedores/`.
3. **Salvar Metas**: As metas são salvas separadamente via `POST` ou `PUT` para o endpoint `/metas/`. Cada meta é vinculada ao vendedor pelo identificador retornado na criação.
4. **Pós-gravação**: A lista de vendedores é recarregada e o modal é fechado.

### Regras de Negócio - Botões Adicionais

- **Adicionar Meta**: Adiciona uma nova linha de meta ao grid de metas do vendedor.
- **Gerar Metas**: Gera automaticamente metas para o período, com base em histórico ou parâmetros pré-definidos.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Adiciona a classe CSS `printing-vendedores-active` ao `body`.
2. Aciona `window.print()` para gerar a listagem de vendedores.
3. Remove a classe CSS após 500ms.
