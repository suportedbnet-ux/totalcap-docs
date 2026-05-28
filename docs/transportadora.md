# Documentação: Regras de Negócio - Transportadoras

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Transportadoras e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Transportadoras)

A "Transportadora" é a empresa responsável pela logística de coleta e entrega de pneus. A tela gerencia o cadastro completo das transportadoras parceiras.

### Ações e Funcionalidades

**Nova Transportadora (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova transportadora com dados cadastrais e de contato.

**Barra de Busca**
- **Ação**: Permite localizar transportadoras por nome, código ou CNPJ. A busca é dinâmica e atualiza a listagem em tempo real.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da transportadora no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a transportadora do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código da transportadora |
| Nome/Razão Social (nome) | text | **Sim** | Nome da transportadora |
| CPF/CNPJ (cpfcnpj) | text | Não | Documento |
| Endereço (endereco) | text | Não | Endereço |
| CEP (cep) | text | Não | CEP |
| Cidade (cidade) | text | Não | Cidade |
| UF (uf) | text | Não | Estado |
| Telefone (fone) | text | Não | Telefone |
| Fax (fax) | text | Não | Fax |
| Inscrição (inscricao) | text | Não | Inscrição estadual |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome**: O campo `nome` é obrigatório. Se vazio, exibe "O nome/razão social é obrigatório." e bloqueia a gravação.
2. **Requisição**: Os dados são enviados via `POST` (nova) ou `PUT` (edição) para o endpoint `/transportadoras/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão implementada.
