# Documentação: Regras de Negócio - Tipos de Recapagem

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Tipos de Recapagem e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Tipos de Recapagem)

O "Tipo de Recapagem" classifica o processo de reforma do pneu (ex: Recapagem a Frio, Recapagem a Quente, Conserto). A tela gerencia os tipos disponíveis no sistema.

### Ações e Funcionalidades

**Novo Tipo de Recapagem (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo tipo com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar tipos por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do tipo no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o tipo do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código do tipo |
| Descrição (descricao) | text | **Sim** | Descrição (ex: Recapagem a Frio) |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Código e Descrição**: Ambos os campos são obrigatórios. Se faltar algum, exibe "Código e Descrição são obrigatórios." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/tipo-recapagem/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

#### Imprimir
1. Chama `window.print()` para gerar a listagem.
2. Utiliza formatação CSS de impressão.
