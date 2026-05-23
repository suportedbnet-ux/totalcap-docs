# Documentação: Regras de Negócio - Localização (Rastreabilidade)

Este documento detalha em linguagem natural as regras de negócio da tela de **Localização**. 

> [!IMPORTANT]  
> Diferente das demais telas do sistema, a tela de "Localização" **não é um cadastro** de lugares físicos (prateleiras ou depósitos). Ela é, na verdade, um painel de **Rastreabilidade e Auditoria** para descobrir exatamente onde um pneu específico está dentro da fábrica. Por conta dessa natureza consultiva, **não existem botões de "Nova Localização", "Editar" ou "Excluir"**.

---

## 1. Painel de Busca (Rastreio Rápido)

O foco total da tela inicial é permitir que o operador bip com um leitor de código de barras ou digite o número do pneu rapidamente.

*   **Campo de Busca (Entrada de Dados)**
    *   **Regra de Gatilho Automático (Debounce):** Não existe um botão "Pesquisar" tradicional para ser clicado. A regra de negócio assume que o operador está usando um leitor de código de barras. Assim que o número é inserido e há uma pausa de uma fração de segundo na digitação, o sistema toma a iniciativa e faz a varredura em todo o banco de dados.
    *   **Ação de Resgate Duplo:** Ao localizar o pneu pelo ID, o sistema busca os dados da engenharia atual (Status Produção, Faturamento, Cliente) e executa uma segunda busca para trazer todo o histórico (Apontamentos) daquele pneu.

## 2. Visão do Pneu e Botões de Ação

Uma vez que o pneu é encontrado, a tela exibe um grande "Raio-X" da vida dele dentro da recauchutadora.

*   **Indicadores Visuais (Status)**
    *   **Regra de Leitura:** O sistema cruza os dados do pneu para exibir imediatamente a OS em que ele está amarrado, se ele ainda está "Em Produção" (StatusPro) e se ele já virou dinheiro, ou seja, se já foi "Faturado" (StatusFat).
*   **Grade de Histórico de Rastreabilidade (Apontamentos)**
    *   **Regra de Auditoria:** O sistema lista linha por linha todos os setores fabris que aquele pneu já passou (ex: Raspagem, Conserto, Vulcanização), mostrando quem foi o operador responsável, que horas ele começou e terminou, e o tempo exato de serviço. Como é auditoria pura, nenhuma dessas linhas pode ser alterada ou apagada por esta tela.
*   **Nova Pesquisa (Botão Cinza/Branco com Lupa)**
    *   **Ação:** Este é o único botão clicável de fato na tela após um rastreio bem-sucedido. Ele reseta (limpa) a tela inteira, esconde o histórico do pneu anterior e devolve o cursor piscando no campo de busca inicial, deixando o sistema pronto para o próximo "bip" de código de barras.
