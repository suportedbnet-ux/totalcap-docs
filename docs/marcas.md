# Documentação: Regras de Negócio - Marcas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Marcas e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Marcas)

A "Marca" representa o fabricante do pneu (ex: Michelin, Pirelli, Goodyear). A tela gerencia o catálogo de marcas utilizadas na classificação de produtos e serviços.

### Ações e Funcionalidades

**Nova Marca (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova marca com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar marcas por descrição ou código. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da marca no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a marca do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código interno |
| Descrição (descricao) | text | **Sim** | Nome da marca |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório (atributo HTML5 `required`).
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/marcas/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Chama `window.print()` para gerar a listagem de marcas.
2. Utiliza formatação CSS de impressão.
