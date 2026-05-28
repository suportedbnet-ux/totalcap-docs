# Documentação: Regras de Negócio - Áreas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Áreas e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Áreas)

A "Área" representa a segmentação geográfica ou comercial utilizada para organização de vendas e atribuição de vendedores. É um classificador hierárquico do negócio.

### Ações e Funcionalidades

**Nova Área (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova área comercial com código e nome.

**Barra de Busca**
- **Ação**: Permite localizar áreas por código ou nome. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da área no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a área do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código da área |
| Nome (nome) | text | **Sim** | Nome da área |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Código e Nome**: Ambos os campos são obrigatórios. Se faltar algum, exibe "Código e Nome são obrigatórios." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/areas/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
