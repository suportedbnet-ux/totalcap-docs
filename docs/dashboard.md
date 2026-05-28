# TELA DE DASHBOARD

## Descrição
Tela principal do sistema que exibe indicadores-chave de desempenho (KPIs) do processo de recapagem de pneus. Apresenta cards com métricas consolidadas em tempo real.

## Campos / Indicadores Exibidos

| Indicador | Descrição |
|-----------|-----------|
| Pneus em Produção | Quantidade de pneus atualmente em processo produtivo |
| Faturamento Mês | Valor total faturado no mês corrente |
| Garantias Abertas | Número de garantias/laudos em aberto |
| Capacidade Produtiva | Percentual da capacidade produtiva utilizada |

## Funcionalidades

- A tela é exclusivamente de visualização (read-only), sem formulários de entrada.
- Não há botão Salvar ou Imprimir.
- Os dados são carregados automaticamente ao montar o componente através de requisição `GET` ao endpoint `/dashboard/stats/`.
- Não há campos obrigatórios, pois não existem campos de entrada nesta tela.

## Regras de Negócio

1. A tela carrega automaticamente os dados ao ser acessada, exibindo um indicador de carregamento enquanto a requisição não é concluída.
2. Se a requisição falhar, os valores padrão (zero) são mantidos para todos os indicadores.
3. Não há interatividade além da visualização dos dados.
