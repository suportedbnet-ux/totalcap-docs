# Documentação: Regras de Negócio - Motivos de Recusa

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Motivos de Recusa e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Motivos de Recusa)

O "Motivo de Recusa" classifica o resultado de laudos técnicos quando um pneu é considerado reprovado. A tela gerencia os motivos que justificam a recusa de um pneu no processo de recapagem.

### Ações e Funcionalidades

**Novo Motivo de Recusa (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo motivo com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar motivos por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do motivo no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o motivo do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código do motivo |
| Descrição (descricao) | text | **Sim** | Descrição do motivo de recusa |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação**: Os campos `codigo` e `descricao` são obrigatórios (atributo HTML5 `required`).
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/tabrecusa/`.
3. **Pós-gravação**: A lista é recarregada e o formulário é limpo.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
