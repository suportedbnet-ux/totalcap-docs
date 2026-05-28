# Documentação: Regras de Negócio - Ficha Técnica

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Ficha Técnica e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Fichas Técnicas)

A "Ficha Técnica" vincula serviços a receitas padrão e matérias-primas, definindo a composição técnica completa de cada serviço executado no processo produtivo.

### Ações e Funcionalidades

**Nova Ficha Técnica (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova ficha técnica, vinculando serviço, receita padrão e lista de matérias-primas com quantidades.

**Barra de Busca**
- **Ação**: Permite localizar fichas por descrição, serviço vinculado ou receita padrão. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da ficha técnica e seus itens no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a ficha técnica do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário Principal

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Descrição (descricao) | text | **Sim** | Nome da ficha técnica |
| Serviço (id_servico) | select | **Sim** | Serviço vinculado |
| Receita Padrão (id_receita) | select | Não | Receita padrão vinculada |

### Campos do Sub-formulário de Matérias-Primas

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Produto (id_produto) | select | **Sim** | Matéria-prima |
| Quantidade (quant) | number | Não | Quantidade |
| Ordem (ordem) | number | Não | Ordem de aplicação |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório. Se vazio, exibe "A descrição da ficha é obrigatória." e bloqueia a gravação.
2. **Validação de Serviço**: O campo `id_servico` deve ser selecionado. Se vazio, exibe "Selecione um serviço associado." e bloqueia a gravação.
3. **Validação de Itens**: Pelo menos uma matéria-prima deve ser adicionada. Se vazio, exibe "Adicione pelo menos uma matéria-prima válida." e bloqueia a gravação.
4. **Requisição**: O payload completo (ficha + lista de matérias-primas) é enviado via `POST` (nova) ou `PUT` (edição) para o endpoint `/fichatecnica/`.
5. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
