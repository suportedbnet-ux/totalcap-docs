# Documentação: Regras de Negócio - Medidas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Medidas e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Medidas)

A "Medida" representa a dimensão do pneu (ex: 295/75R22.5, 315/80R22.5). A tela gerencia o catálogo de medidas utilizadas na composição de serviços, produtos e fichas técnicas.

### Ações e Funcionalidades

**Nova Medida (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova medida com código, descrição e tipo de piso relacionado.

**Barra de Busca**
- **Ação**: Permite localizar medidas por descrição ou código. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da medida no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a medida do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código interno da medida |
| Descrição (descricao) | text | **Sim** | Descrição da medida |
| Piso (id_piso) | select | Não | Tipo de piso relacionado |
| Tipo (tipo) | text | Não | Tipo de medida |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório. Se vazio, exibe "A descrição é obrigatória." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/medidas/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.
4. **Paginação**: A lista exibe 15 registros por página.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Chama `window.print()` para gerar a listagem de medidas.
2. Utiliza formatação CSS de impressão.
