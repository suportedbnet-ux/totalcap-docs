# Documentação: Regras de Negócio - Usuários do Sistema

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Usuários do Sistema e seu respectivo modal de criação/edição.

## 1. Tela Principal (Gestão de Usuários)

O "Usuário" é a conta de acesso ao sistema ERP Totalcap. A tela gerencia as credenciais e permissões de acesso dos colaboradores que utilizam o sistema web.

### Ações e Funcionalidades

**Novo Usuário (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo usuário com nome, e-mail, senha e permissões de acesso.

**Barra de Busca**
- **Ação**: Permite localizar usuários por nome ou e-mail. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do usuário no modal para edição (a senha não é exibida por segurança).
- **Excluir (Lixeira Vermelha)**: Remove o usuário do sistema. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Nome (nome) | text | **Sim** | Nome do usuário |
| E-mail (email) | email | **Sim** | E-mail de login |
| Senha (password) | password | **Sim** (criação) | Senha de acesso |
| Ativo (is_active) | checkbox | Não | Usuário ativo |
| Superusuário (is_superuser) | checkbox | Não | Acesso administrativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome e E-mail**: Ambos são obrigatórios. Se faltar algum, exibe "Nome e E-mail são obrigatórios." e bloqueia a gravação.
2. **Validação de Senha**: No momento da criação, a senha é obrigatória (mínimo 4 caracteres). Na edição, se a senha for deixada em branco, a senha existente é mantida.
3. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/usuarios/`.
4. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão.
