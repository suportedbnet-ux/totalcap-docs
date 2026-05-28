# Documentação: Regras de Negócio - Veículos

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Veículos e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Veículos)

O "Veículo" representa os veículos da frota própria ou de terceiros utilizados no transporte de pneus e materiais. A tela gerencia informações completas de registro, documentação e financiamento.

### Ações e Funcionalidades

**Novo Veículo (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo veículo com dados de documento, modelo e situação financeira.

**Barra de Busca**
- **Ação**: Permite localizar veículos por placa, descrição ou RENAVAM. A busca é dinâmica e atualiza a listagem em tempo real.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do veículo no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o veículo do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Placa (placa) | text | **Sim** | Placa do veículo |
| Descrição (descricao) | text | Não | Descrição/modelo |
| Cód. Vendedor (codven) | text | Não | Código do vendedor |
| Tipo (tipo) | text | Não | Tipo de veículo |
| Combustível (comb) | text | Não | Tipo de combustível |
| Plaqueta (plaqueta) | number | Não | Número da plaqueta |
| UF (uf) | text | Não | Estado de registro |
| Cód. Modelo (codmod) | text | Não | Código do modelo |
| RENAVAM (renavam) | text | Não | RENAVAM |
| Chassi (chassi) | text | Não | Número do chassi |
| Ano (ano) | text | Não | Ano de fabricação |
| Alienado (alienado) | checkbox | Não | Veículo alienado |
| Banco Financiador (bancofin) | text | Não | Banco do financiamento |
| Sinistro (sinistro) | checkbox | Não | Veículo com sinistro |
| Seguradora (seguradora) | text | Não | Seguradora |
| ANTT (antt) | text | Não | Registro ANTT |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Placa**: O campo `placa` é obrigatório (atributo HTML5 `required`). Se vazio, a gravação é bloqueada pelo navegador.
2. **Requisição**: Os dados são enviados via `POST` (novo) ou `PUT` (edição) para o endpoint `/veiculos/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

- Esta tela não possui funcionalidade de impressão implementada.
