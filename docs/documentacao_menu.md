# Documentação do Menu do Sistema TotalCAP

Esta documentação detalha a estrutura de navegação do menu lateral do sistema, com todos os seus módulos, submódulos e respectivas rotas de acesso.

O menu principal é composto pelos seguintes agrupamentos e itens:

## 📊 Dashboard
- **Dashboard Principal** (`/dashboard`)

## 🚛 Operacional
- [**Coleta de Pneus**](documentacao_coleta_pneus.md)
- [**Ordem de Serviço**](documentacao_ordem_servico.md)

## 💳 Faturamento
- [**Informe de Serviços**](documentacao_informe_servicos.md)
- [**Fatura de Serviço**](documentacao_fatura_servicos.md)
- [**Fatura NF Retorno**](documentacao_fatura_retorno.md)
- [**Fatura NF Entrada**](documentacao_fatura_entrada.md)
- [**Tabela de Preço**](documentacao_tabela-preco.md)
- [**Contratos**](documentacao_contratos.md)

## 🧮 Orçamento
- **Orçamento** (`/orcamento`)

## 🏭 Chão de Fábrica
- **Localização** (`/localizacao`)
- **Apontamento** (`/apontamento`)
- **Registro de Falhas** (`/falhas`)
- **Consumo de Mat.Prima** (`/consumo-materia`)
- **Laudos** (`/laudos`)
- **Gerador Código de Barra** (`/gerador-etiquetas`)
- **PCP - Programação** (`/pcp`)

## 🧾 Despesas
- **Despesas C/ Vendas** (`/lacto-despesas`)

## 📈 Relatórios
Agrupados por área de negócio:

### Faturamento
- **Rel. Vendas** (`/rel-vendas-servico`)
- **Rel. Comissões** (`/rel-comissoes`)
- **Rel. Metas** (`/rel-metas`)

### Produção
- **Rel. Produtividade** (`/rel-produtividade`)
- **Rel. Falhas** (`/rel-falhas`)
- **Rel. Consumo Mat.Prima** (`/rel-consumo-materia`)
- **Rel. Laudos** (`/rel-laudos`)
- **Rel. Ordens de Serviço** (`/rel-ordem-servico`)

## 👥 Cadastros
Área central de registros do sistema, dividida em subcategorias:

### Clientes
- **Clientes** (`/clientes`)

### Auxiliares
- **Áreas** (`/areas`)
- **Regiões** (`/regioes`)
- **Atividades** (`/atividades`)
- **Vendedores** (`/vendedores`)
- **Transportadoras** (`/transportadoras`)
- **Cidades** (`/cidades`)
- **Estados** (`/estados`)
- **Veículos** (`/veiculos`)
- **Bancos** (`/bancos`)
- **Formas de Pagamento** (`/planos-pagamento`)
- **Tipo de Docto** (`/tipos-docto`)
- **Tipos de Falha** (`/cad-falhas`)
- **Regras Comissão** (`/comissoes`)
- **Origens Defeito** (`/origens-defeito`)
- **Motivos Recusa** (`/motivos-recusa`)

### Produção
- **Medidas** (`/medidas`)
- **Desenhos** (`/desenhos`)
- **Marcas** (`/marcas`)
- **Tipo Recapagem** (`/tipo-recapagem`)
- **Produto** (`/produtos`)
- **Grupos Produto** (`/grupos-produto`)
- **Pisos** (`/pisos`)
- **Serviços** (`/servicos`)
- **Receita Padrão** (`/receita-padrao`)
- **Ficha Técnica** (`/fichatecnica`)
- **Setores** (`/setores`)
- **Operadores** (`/operadores`)
- **Falhas** (`/cad-falhas`)

### Sistema
- **Empresa** (`/empresas`)
- **Usuarios ERP** (`/usuarios`) *— Acesso restrito a administradores*
- **Usuarios IA** (`/usuarios-ia`)

## 🔌 Integração e Configurações
- **Integração** (`/integracao`)
- **Configuração** (`/configuracoes`)

---
> [!NOTE]
> O menu é responsivo (esconde/recolhe no mobile e desktop) e a opção "Usuarios ERP" só fica visível se o usuário logado for administrador.
