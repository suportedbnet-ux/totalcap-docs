# Documentação: Regras de Negócio - Empresas

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Empresas e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Empresas)

A "Empresa" representa as unidades de negócio ou filiais do grupo. A tela permite configurar dados fiscais, contato e parâmetros específicos de cada empresa do sistema.

### Ações e Funcionalidades

**Nova Empresa (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar uma nova empresa com dados fiscais, endereço e parâmetros de configuração.

**Barra de Busca**
- **Ação**: Permite localizar empresas por nome, razão social ou CNPJ. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados da empresa no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove a empresa do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Nome (nome) | text | **Sim** | Nome fantasia |
| Razão Social (razaosocial) | text | Não | Razão social |
| CNPJ (cpfcnpj) | text | Não | CNPJ da empresa |
| Inscrição Estadual (inscestadual) | text | Não | IE |
| Inscrição Municipal (inscmunicipio) | text | Não | IM |
| Endereço (endereco) | text | Não | Endereço |
| Nº (numcasa) | text | Não | Número |
| Bairro (bairro) | text | Não | Bairro |
| CEP (cep) | text | Não | CEP |
| Cidade (cidade) | text | Não | Cidade |
| UF (uf) | text | Não | Estado |
| Telefone (fone) | text | Não | Telefone |
| Telefone 2 (fone2) | text | Não | Telefone alternativo |
| E-mail (email) | email | Não | E-mail |
| Site (site) | url | Não | Site |
| Logotipo (logo) | text | Não | Caminho do logotipo |
| Token (token) | text | Não | Token de integração |
| Tabela Preço (id_preco) | select | Não | Tabela de preço padrão |
| Caixa Postal (cxpostal) | text | Não | Caixa postal |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome**: O campo `nome` é obrigatório. Se vazio, exibe "O nome é obrigatório." e bloqueia a gravação.
2. **Validação de CNPJ**: O CNPJ informado é validado quanto ao formato.
3. **Requisição**: Envia via `POST` (nova) ou `PUT` (edição) para o endpoint `/empresas/`.
4. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir
1. Chama `window.print()` diretamente para gerar a listagem de empresas.
2. Utiliza formatação CSS de impressão.
