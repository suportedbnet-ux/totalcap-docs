# Documentação: Regras de Negócio - Tipos de Documento

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Tipos de Documento e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Tipos de Documento)

O "Tipo de Documento" classifica os documentos fiscais e comerciais utilizados no sistema (ex: NF, Duplicata, Boleto, Contrato).

### Ações e Funcionalidades

**Novo Tipo de Documento (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo tipo de documento com código e descrição.

**Barra de Busca**
- **Ação**: Permite localizar tipos por código ou descrição. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do tipo de documento no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o tipo de documento do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | **Sim** | Código do tipo de documento |
| Descrição (descricao) | text | Não | Descrição |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Código**: O campo `codigo` é obrigatório. Se vazio, exibe "O Código é obrigatório." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/tipos-docto/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
