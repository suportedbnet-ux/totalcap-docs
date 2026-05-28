# Documentação: Regras de Negócio - Bancos

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Bancos e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Bancos)

O "Banco" representa as instituições financeiras cadastradas no sistema, utilizadas para recebimento de faturas, pagamentos e referência em registros financeiros de clientes.

### Ações e Funcionalidades

**Novo Banco (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova instituição bancária com dados cadastrais e de agência/conta.

**Barra de Busca**
- **Ação**: Permite localizar bancos por código, nome ou CNPJ. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do banco no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o banco do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código do banco |
| Nome (nome) | text | **Sim** | Nome do banco |
| Razão Social (razaosocial) | text | Não | Razão social |
| Agência (agencia) | text | Não | Número da agência |
| Conta (conta) | text | Não | Número da conta |
| Endereço (endereco) | text | Não | Endereço |
| CEP (cep) | text | Não | CEP |
| Cidade (cidade) | text | Não | Cidade |
| UF (uf) | text | Não | Estado |
| Contato (contato) | text | Não | Nome do contato |
| Telefone (fone) | text | Não | Telefone |
| CNPJ (cnpj) | text | Não | CNPJ |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome**: O campo `nome` é obrigatório. Se vazio, exibe "O Nome do Banco é obrigatório." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/bancos/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
