# Documentação: Regras de Negócio — Relatório de Falhas de Produção

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao comportamento da tela de **Relatório de Falhas de Produção**.

Diferente das telas de operação (como Faturamento ou OS), esta é uma tela puramente **Analítica**. Não existem botões para salvar, editar ou excluir dados.

---

## 1. O Painel de Filtros

Esta tela é o "Raio-X" da qualidade na fábrica. Enquanto a produção aponta o que foi produzido, esta tela registra **o que deu errado** no caminho.

*   **Campos de Filtro:**
    *   O usuário seleciona um **período** (padrão: mês corrente) e pode refinar por **Setor** (onde aconteceu), **Operador** (quem fez) e **Falha** (qual o tipo de problema — ex: "Bolha", "Descolamento", "Vazamento").
*   **Carregamento Automático:**
    *   Os dados carregam sozinhos ao entrar na tela. Ajustou o filtro? A consulta é refeita na hora.

---

## 2. Abas de Visão (Como os dados são agrupados)

O sistema permite enxergar as falhas de quatro perspectivas diferentes. O objetivo principal é responder: *"O que está quebrando, onde está quebrando e quem está quebrando?"*

1.  **Geral Detalhado (O Livro de Ocorrências):**
    *   Exibe **todos os registros de falhas** individuais, em ordem cronológica. Cada linha mostra: a data e hora exata em que a falha foi registrada, em qual setor, qual operador estava envolvido, qual o tipo de falha, o número do pneu/OS e uma observação (motivo).
    *   **Total no Rodapé:** O sistema exibe o total de falhas registradas no período.
    *   **Para que serve?** O supervisor ou engenheiro de qualidade quer "abrir o detalhamento" e investigar cada ocorrência.

2.  **Resumo por Falha (Ranking de Problemas):**
    *   O sistema agrupa todas as falhas pelo **tipo de falha** (ex: "Bolha", "Descolamento", "Sujidade"). Para cada tipo, mostra quantas vezes aquela falha aconteceu e o **percentual** que ela representa em relação ao total de falhas do período.
    *   **Ordenação Inteligente:** As falhas são ordenadas da mais frequente para a menos frequente.
    *   **Para que serve?** Responder à pergunta: *"Qual é o problema número 1 da fábrica esse mês?"* Se "Bolha" representa 40% das falhas, a engenharia sabe onde focar.

3.  **Resumo por Setor (Onde está pegando?):**
    *   Agrupa as falhas pelo **setor** onde ocorreram. Mostra quantas falhas cada setor teve e o percentual em relação ao total.
    *   **Para que serve?** Identificar qual setor da fábrica está com mais problemas de qualidade. Se o setor de "Pintura" tem 50% das falhas, algo está errado na pintura.

4.  **Resumo por Operador (Quem precisa de apoio?):**
    *   Agrupa as falhas pelo **operador** que as cometeu (ou estava envolvido). Mostra quantas falhas cada operador registrou e o percentual.
    *   **Para que serve?** Identificar operadores que podem precisar de reciclagem ou treinamento. Importante: o objetivo não é punir, mas sim direcionar ações corretivas.

---

## 3. Fechamento e Documentação

*   **Imprimir Relatório (Botão Verde no Cabeçalho)**
    *   **Regra de Fidelidade Visual:** O sistema imprime exatamente o que está sendo visto na tela. Se estiver no "Resumo por Setor", o relatório impresso trará os setores com seus percentuais.
    *   **Capa Oficial:** O sistema insere automaticamente o Logotipo da Empresa, a Razão Social, o título "RELATÓRIO DE FALHAS DE PRODUÇÃO" e o período selecionado, gerando um documento formal para arquivo do setor de qualidade.
