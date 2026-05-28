# Documentação: Regras de Negócio - Clientes

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de Clientes e seu respectivo modal de criação/edição.

## 1. Tela Principal (Gestão de Clientes)

O "Cliente" é o registro central de pessoas físicas ou jurídicas com as quais a empresa se relaciona comercialmente. A tela oferece gestão completa com abas segmentadas por tipo de informação.

### Ações e Funcionalidades

**Novo Cliente (+ Botão Azul Superior)**
- **Ação**: Abre o modal de cadastro com múltiplas abas (Geral, Endereços, Social, Financeiro, Referências, Contatos) para registrar um novo cliente no sistema.

**Barra de Busca**
- **Ação**: Permite localizar clientes por nome, CPF/CNPJ, ou qualquer informação cadastrada. A busca é dinâmica e atualiza a listagem conforme o usuário digita.

**Ações na Grade (Editar e Excluir)**
- **Editar (Lápis Azul)**: Carrega os dados completos do cliente no modal, preservando todas as abas e sub-registros (endereços, contatos).
- **Excluir (Lixeira Vermelha)**: Remove o cliente do sistema. O sistema exige confirmação para evitar perda acidental de dados cadastrais.

## 2. Tela de Edição e Criação (Modal)

O modal de cliente é multi-abas. Cada aba agrupa campos de uma categoria específica de informação.

### Campos do Formulário - Aba "Geral"

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Nome (nome) | text | **Sim** | Nome ou Razão Social |
| Razão Social (razaosocial) | text | Não | Razão social (PJ) |
| CPF/CNPJ (cpfcnpj) | text | **Sim** | CPF ou CNPJ com máscara automática |
| Pessoa (pessoa) | select | Não | Física (F) ou Jurídica (J) |
| RG (rg) | text | Não | RG (PF) |
| Órgão Emissor (emitenterg) | text | Não | Órgão emissor do RG |
| Inscrição Estadual (inscestadual) | text | Não | IE (PJ) |
| Inscrição Municipal (inscmunicipio) | text | Não | IM (PJ) |
| Tipo Documento (tipodoc) | text | Não | Tipo de documento |
| Caixa Postal (cxpostal) | text | Não | Caixa postal |
| Código País (codigopais) | text | Não | Código do país |
| Nome País (nomepais) | text | Não | Nome do país |

### Campos - Aba "Endereços"

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Endereço (rua) | text | Não | Logradouro |
| Número (numcasa) | text | Não | Número |
| Complemento (complemento) | text | Não | Complemento |
| Bairro (bairro) | text | Não | Bairro |
| CEP (cep) | text | Não | CEP (com consulta ViaCEP) |
| Cidade (cidade) | text | Não | Cidade |
| UF (uf) | text | Não | Estado |

### Campos - Aba "Social"

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Telefone Principal (foneprincipal) | text | Não | Telefone fixo |
| E-mail (email) | email | Não | E-mail principal |
| E-mail NF-e (emailnfe) | email | Não | E-mail para nota fiscal |
| Site (site) | url | Não | Site |
| Contato Comercial (contato_comercial) | text | Não | Nome do contato comercial |
| Celular Comercial (celular_comercial) | text | Não | Celular comercial |
| Contato Financeiro (contato_financeiro) | text | Não | Nome do contato financeiro |
| Celular Financeiro (celular_financeiro) | text | Não | Celular financeiro |
| Nome Pai (nomepai) | text | Não | Nome do pai (PF) |
| Nome Mãe (nomemae) | text | Não | Nome da mãe (PF) |
| Nome Cônjuge (nomeconjuge) | text | Não | Nome do cônjuge (PF) |
| RG Cônjuge (rgconjuge) | text | Não | RG do cônjuge (PF) |
| Data Nascimento (datanascto) | date | Não | Data de nascimento (PF) |
| Nascimento Cônjuge (nasctoconjuge) | date | Não | Nascimento do cônjuge |
| Sexo (sexo) | select | Não | Masculino/Feminino |
| Estado Civil (ecivil) | select | Não | Estado civil |

### Campos - Aba "Financeiro"

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Limite Crédito (limicredito) | number | Não | Limite de crédito |
| Prazo Máximo (prazomax) | number | Não | Prazo máximo em dias |
| Conceito (conceito) | text | Não | Conceito/classificação |
| Data 1ª Compra (datapricompra) | date | Não | Data da primeira compra |
| Data Última Compra (dataultcompra) | date | Não | Data da última compra |
| Nº Compras (numcompra) | number | Não | Número de compras realizadas |
| Valor 1ª Compra (valpricompra) | number | Não | Valor da primeira compra |
| Maior Compra (valmaicompra) | number | Não | Maior valor já comprado |
| Última Compra (valultcompra) | number | Não | Valor da última compra |
| Data Cadastro (datacad) | date | Não | Data de cadastro |
| Data SPC (dataspc) | date | Não | Data de inclusão no SPC |
| Observações (obs) | textarea | Não | Observações |

### Campos - Aba "Referências"

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Ref. SPC (ref_spc) | text | Não | Referência SPC |
| Ref. Financeira (ref_fin) | text | Não | Referência financeira |
| Ref. Comercial (ref_com) | text | Não | Referência comercial |
| Ref. Produto (ref_prod) | text | Não | Referência de produto |

### Campos - Aba "Contatos / Complementares"

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Código IBGE (codigoibge) | number | Não | Código IBGE da cidade |
| Área (id_area) | lookup | Não | Área comercial |
| Região (id_regiao) | lookup | Não | Região geográfica |
| Vendedor (id_vendedor) | lookup | Não | Vendedor responsável |
| Atividade (id_atividade) | lookup | Não | Atividade econômica |
| Banco (id_banco) | lookup | Não | Banco |
| Contribuinte (contribuinte) | checkbox | Não | É contribuinte |
| Consumidor Final (consumidor) | checkbox | Não | Consumidor final |
| É Cliente (flagcliente) | checkbox | Não | Flag de cliente |
| É Fornecedor (flagfornecedor) | checkbox | Não | Flag de fornecedor |
| É Transportadora (flagtranspotador) | checkbox | Não | Flag de transportadora |
| É Colaborador (flagcolaborador) | checkbox | Não | Flag de colaborador |
| É Vendedor (flagvendedor) | checkbox | Não | Flag de vendedor |
| Ativo (ativo) | checkbox | Não | Registro ativo |
| Endereços (enderecos) | array | Não | Lista de endereços |

### Regras de Negócio - Botão Salvar

1. **Validação de Nome e CPF/CNPJ**: Os campos `nome` e `cpfcnpj` são obrigatórios. Se faltar algum, exibe "Nome e CPF/CNPJ são obrigatórios." e bloqueia a gravação.
2. **Validação de Documento**: O sistema valida o formato do CPF ou CNPJ conforme a máscara aplicada automaticamente.
3. **Integrações**: O CNPJ pode ser consultado via BrasilAPI para preenchimento automático de dados. O CEP é consultado via ViaCEP.
4. **Requisição**: Os dados de todas as abas são estruturados e enviados via `POST` (novo) ou `PUT` (edição) para o endpoint `/clientes/`.
5. **Pós-gravação**: A lista de clientes é recarregada e o modal é fechado.

### Regras de Negócio - Botão Imprimir

#### Imprimir (handlePrint)
1. Adiciona classe CSS de impressão ao `body`.
2. Aciona `window.print()` para gerar a listagem de clientes.
3. Remove a classe CSS após 500ms.
