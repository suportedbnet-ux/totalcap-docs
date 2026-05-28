# Documentação: Regras de Negócio - Usuários IA (WhatsApp)

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Usuários IA e seu respectivo modal de criação/edição.

## 1. Tela Principal (Gestão de Usuários IA)

O "Usuário IA" é o contato autorizado a interagir com o sistema via WhatsApp (WhatsFone/assistente virtual). A tela gerencia os números de telefone que podem se comunicar com o sistema por mensagens.

### Ações e Funcionalidades

**Novo Usuário IA (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo contato de WhatsApp autorizado, com número, nome e tipo (Interno/Externo).

**Barra de Busca**
- **Ação**: Permite localizar usuários IA por número, nome ou CPF/CNPJ. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do usuário IA no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o usuário IA do cadastro, revogando seu acesso via WhatsApp. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Número (numero) | text | **Sim** | Número de WhatsApp |
| Nome (nome) | text | **Sim** | Nome do contato |
| Apelido (apelido) | text | Não | Apelido |
| CPF/CNPJ (cpfcnpj) | text | Não | Documento |
| Tipo (tipo) | select | Não | Interno ou Externo |
| Cliente (id_contato) | select | Não | Cliente vinculado |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Número**: O campo `numero` é obrigatório. Se vazio, exibe "Número é obrigatório." e bloqueia a gravação.
2. **Validação de Nome**: O campo `nome` é obrigatório (atributo HTML5 `required`).
3. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/usuarios-ia/`.
4. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
