# Documentação: Regras de Negócio - Operadores

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Operadores e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Operadores)

O "Operador" é o colaborador do chão de fábrica responsável pela execução dos serviços nos setores produtivos. A tela registra informações profissionais, setor de atuação e parâmetros de produtividade.

### Ações e Funcionalidades

**Novo Operador (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo operador na fábrica, vinculando-o a um setor e definindo seus parâmetros de custo e meta.

**Barra de Busca**
- **Ação**: Permite localizar operadores por nome, código ou cargo. A busca é dinâmica e atualiza a listagem em tempo real.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do operador no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o operador do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código do operador |
| Nome (nome) | text | **Sim** | Nome do operador |
| Cargo (cargo) | text | Não | Cargo/função |
| Setor (id_setor) | select | Não | Setor principal de atuação |
| Departamento (id_depto) | select | Não | Departamento |
| Valor Hora (vhora) | number | Não | Valor da hora trabalhada |
| Qtd Meta (qmeta) | number | Não | Quantidade meta de produção |
| Ativo (ativo) | checkbox | Não | Operador ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome**: O campo `nome` é obrigatório. Se vazio, exibe "O nome do operador é obrigatório." e bloqueia a gravação.
2. **Requisição**: Os dados são enviados via `POST` (novo) ou `PUT` (edição) para o endpoint `/operadores/`.
3. **Pós-gravação**: A lista de operadores é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Adiciona classe CSS de impressão ao `body`.
2. Aciona `window.print()` para gerar a listagem de operadores.
3. Remove a classe CSS após 500ms.
