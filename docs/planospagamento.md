# Documentação: Regras de Negócio - Planos de Pagamento

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Planos de Pagamento e seu respectivo modal de criação/edição.

## 1. Tela Principal (Cadastro de Planos de Pagamento)

O "Plano de Pagamento" define as condições comerciais de parcelamento oferecidas aos clientes para pagamento de faturas. A tela gerencia as regras de parcelamento, prazos e entrada.

### Ações e Funcionalidades

**Novo Plano de Pagamento (+ Botão Azul Superior)**
- **Ação**: Abre o modal para cadastrar um novo plano com descrição, forma de pagamento, parcelas, intervalo e percentual de entrada.

**Barra de Busca**
- **Ação**: Permite localizar planos por descrição ou código. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados do plano no modal para edição.
- **Excluir (Lixeira Vermelha)**: Remove o plano do cadastro. O sistema exige confirmação.

## 2. Tela de Edição e Criação (Modal)

### Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código (codigo) | text | Não | Código do plano |
| Descrição (descricao) | text | **Sim** | Nome do plano |
| Forma Pagamento (formapag) | text | **Sim** | Forma de pagamento |
| Qtd Parcelas (numparc) | number | Não | Número de parcelas |
| Intervalo (intervalo) | number | Não | Intervalo entre parcelas (dias) |
| % Entrada (entrada) | number | Não | Percentual de entrada |
| Ativo (ativo) | checkbox | Não | Registro ativo |

### Regras de Negócio - Botão Salvar

1. **Validação de Descrição**: O campo `descricao` é obrigatório. Se vazio, exibe "A Descrição do Plano é obrigatória." e bloqueia a gravação.
2. **Requisição**: Envia via `POST` (novo) ou `PUT` (edição) para o endpoint `/planos-pagamento/`.
3. **Pós-gravação**: A lista é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Chama `window.print()` para gerar a listagem de planos de pagamento.
2. Utiliza formatação CSS de impressão.
