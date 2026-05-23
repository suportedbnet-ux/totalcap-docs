# Documentação: Regras de Negócio - Tabela de Preço

Este documento detalha em linguagem natural as regras de negócio e funcionalidades atreladas aos botões da tela de **Tabela de Preço** e sua respectiva tela de **Edição/Criação**.

---

## 1. Tela Principal (Gestão de Tabelas)

A tela principal gerencia as listas de preços que serão amarradas aos clientes ou utilizadas em orçamentos. Diferentes clientes podem ter diferentes tabelas (Ex: Tabela Atacado, Tabela Varejo, Tabela Frota 2026).

### Ações e Funcionalidades de Grade
*   **Nova Tabela (+ Botão Azul)**
    *   **Ação:** Abre o assistente para iniciar o cadastro de uma nova lista de preços do zero.
*   **Barra de Busca**
    *   **Ação:** Filtra a listagem pelo nome da tabela em tempo real.
*   **Caixas de Seleção (Checkboxes da Grade)**
    *   **Regra de Impressão Integrada:** Ao selecionar uma ou mais tabelas através das caixas de seleção, o sistema prepara silenciosamente um relatório em segundo plano. Se o usuário disparar o atalho de impressão (Ctrl+P ou função do navegador), o sistema ignora o site visual e gera um **relatório limpo e formatado** listando todos os serviços e preços das tabelas que foram "ticadas".
*   **Ações de Linha (Visualizar, Editar, Excluir)**
    *   **Visualizar (Olho):** Permite checar os valores cadastrados em uma tabela sem o risco de alterar nada acidentalmente (bloqueio de inputs).
    *   **Editar (Lápis):** Abre o modal para reajuste de valores, adição de novos serviços ou inativação da tabela.
    *   **Excluir (Lixeira):** Deleta permanentemente a tabela de preços.

---

## 2. Tela de Edição e Criação (Modal)

Na criação e manutenção da tabela, o foco do sistema é reduzir o esforço repetitivo, visto que uma recauchutadora possui dezenas ou centenas de medidas e serviços diferentes.

### Dados da Tabela
*   **Descrição e Status (Ativo)**
    *   **Regras:** A descrição é obrigatória. O status "Ativo" define se esta tabela aparecerá como opção lá no Cadastro de Clientes ou na emissão de OS/Orçamentos.
*   **Botão "Importa Cadastro Serviço" (Acelerador Prático)**
    *   **Regra de Negócio Crítica (Carga em Massa):** Este botão existe para evitar trabalho manual. Quando clicado, o sistema vai até o Cadastro Master de Serviços, **busca todos os serviços existentes na empresa** (que ainda não estejam na tabela atual), e os injeta de uma vez só na grade, copiando o "Valor Padrão" de cada um. A partir daí, o usuário só precisa ajustar os valores que deseja aplicar desconto ou acréscimo.

### Gerenciamento de Preços
*   **Filtro "Tipos Recap" (Dropdown Select)**
    *   **Ação:** Como uma tabela pode ficar muito grande, este filtro no meio da tela permite esconder os outros pneus e mostrar apenas os preços de um segmento específico (Ex: Mostrar apenas os preços de recapagem "Carga", ou "Agricola").
*   **Botão "Novo Item de Preço (+)"**
    *   **Ação:** Abre um sub-modal para adicionar manualmente um único serviço que tenha ficado de fora ou sido criado recentemente.
*   **Grade de Edição Rápida (Input Direto)**
    *   **Regra de Negócio (Produtividade):** Diferente de outras telas onde você precisa abrir um item para editar, na tabela de preço o campo "Preço (R$)" da grade já é um campo de digitação aberto. O gestor pode clicar linha por linha e ir digitando rapidamente (150.00, Tab, 160.00, Tab) sem abrir janelas adicionais.
*   **Botão Imprimir Tabela (Ícone de Impressora no Cabeçalho do Modal)**
    *   **Ação:** Ao visualizar ou editar uma tabela específica e clicar neste botão, o sistema formata a janela e aciona a impressora entregando um relatório de preços pronto para ser entregue ao cliente daquela tabela.

### Fechamento
*   **Gravar / Salvar Alterações (Botão Verde)**
    *   **Ação:** O sistema verifica se a tabela tem um nome e se possui pelo menos um serviço. Em caso positivo, salva a tabela e todos os itens de uma vez no banco de dados, liberando-a para uso comercial.
