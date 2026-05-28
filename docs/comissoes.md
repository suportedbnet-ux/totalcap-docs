# Documentação: Regras de Negócio - Comissões

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Comissões e seu respectivo modal de criação/edição.

## 1. Tela Principal (Regras de Comissão)

A "Comissão" define as regras de comissionamento para vendedores. A tela gerencia alíquotas e critérios (vendedor, região, cliente, recapagem, serviço) para cálculo automático de comissões.

### Ações e Funcionalidades

**Nova Regra de Comissão (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova regra de comissão, definindo alíquota e critérios de elegibilidade.

**Barra de Busca**
- **Ação**: Permite localizar regras por descrição, vendedor ou cliente vinculado. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da regra no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a regra de comissão. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código da regra |
| Descrição (descricao) | text | Não | Nome da regra de comissão |
| Vendedor (id_vendedor) | lookup | Não | Vendedor alvo |
| Região (id_regiao) | lookup | Não | Região alvo |
| Cliente (id_contato) | lookup | Não | Cliente alvo |
| Recapagem (id_recap) | lookup | Não | Tipo de recapagem alvo |
| Serviço (id_servico) | lookup | Não | Serviço alvo |
| Alíquota (aliquota) | number | **Sim** | Percentual de comissão |
| Tipo (tipo) | select | Não | Tipo de comissão |
| Ativo (ativo) | checkbox | Não | Regra ativa |

### Regras de Negócio - Botão Salvar

1. **Validação**: O campo `aliquota` é obrigatório (atributo HTML5 `required`). Se vazio, o navegador bloqueia a gravação.
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/comissoes/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir
1. Chama `window.print()` diretamente para gerar a listagem de regras de comissão.
2. Utiliza formatação CSS de impressão.
