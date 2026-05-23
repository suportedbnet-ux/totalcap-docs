# Documentação: Regras de Negócio - Laudos Técnicos (Garantia)

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao fluxo da tela de **Laudos Técnicos**, ferramenta vital para gerenciar os pedidos de garantia ou recusa de carcaças feitas pelos clientes.

---

## 1. Tela Principal (Gestão de Laudos)

Esta tela é o centro de inteligência técnica. Aqui o gerente de qualidade emite os documentos de recusa (quando a carcaça do cliente não presta para reforma) ou de garantia (quando o pneu reformado falhou precocemente).

### Seleção Múltipla e Impressão em Lote
A grande particularidade desta tela é a presença forte de caixas de seleção (checkboxes) e dois grandes botões de impressão em lote no cabeçalho.

*   **Botão Azul (Solicitação Laudo)**
    *   **Regra:** Só funciona se houver laudos "ticados" na grade. 
    *   **Ação:** Ele intercepta o navegador e desenha o documento preliminar de "Solicitação de Análise", que é o papel físico que acompanha o pneu defeituoso enquanto ele aguarda a avaliação técnica da fábrica.
*   **Botão Laranja (Laudo de Garantia)**
    *   **Regra:** Também exige seleção na grade.
    *   **Ação:** Gera e imprime o documento oficial e final (com parecer técnico, origens do defeito e assinaturas) que será entregue formalmente ao cliente concedendo ou negando o ressarcimento/crédito.

### Ações Individuais (Na Linha)
Além da ação em lote, cada laudo possui seu próprio "kit" de botões na extrema direita:
*   **Impressora (Solicitação)** e **Arquivo (Garantia):** Fazem exatamente a mesma coisa que os botões do cabeçalho, mas de forma unitária, focada apenas no pneu daquela linha.
*   **Visualizar (Olho), Editar (Lápis), Excluir (Lixeira):** Padrão de manutenção de registros do sistema.

---

## 2. Tela de Edição e Criação (Modal)

Fazer um laudo técnico manual exige copiar cerca de 20 informações técnicas de um pneu (Série, DOT, Medida, Desenho, Valor do Serviço). Para evitar erro humano, a regra de negócio desse modal foca 100% na **importação de dados automáticos**.

### O Buscador Inteligente
*   **Campo "ID Pneu" & Botão Lupa (O Coração do Laudo)**
    *   **Regra de Flexibilidade:** O inspetor técnico pode digitar neste campo o ID interno, ou o Número de Série do fabricante, ou o Número de Fogo gravado a ferro quente no pneu.
    *   **Ação de Gatilho:** Ao clicar na Lupa (ou apenas sair do campo apertando TAB), o sistema trava o modal e dispara uma varredura complexa (`pneu-completo`).
    *   **O "Milagre" do Preenchimento:** Se o sistema encontrar esse pneu em alguma OS, ele vai preencher sozinho (sem intervenção do usuário):
        1. Quem é o Cliente dono do pneu.
        2. Quem foi o Vendedor que atendeu.
        3. Todos os detalhes de Engenharia (Medida, Marca, Desenho, Tipo de Recapagem).
        4. O número da Placa do Caminhão.
        5. Quantas vezes aquele pneu já foi reformado.
        6. O Valor Financeiro pago pelo serviço que está sendo reclamado.

### Abas de Classificação Técnica
Após o sistema fazer o trabalho braçal de trazer o "DNA" do pneu, caberá ao inspetor técnico apenas preencher os campos exclusivos do Laudo:
*   **Análise e Constatação:** O inspetor define a "Origem do Defeito" (Ex: Separação de Rodagem, Bolha, Fadiga de Carcaça) de acordo com uma tabela padronizada.
*   **Dados Financeiros:** O inspetor lança, de acordo com o desgaste do pneu, qual será o valor liberado de Saldo/Crédito para o cliente abater em uma próxima nota fiscal.

### Fechamento
*   **Salvar (Botão Verde/Azul)**
    *   Registra a avaliação técnica, amarrando aquele pneu defeituoso a um parecer formal e gerando o ID de laudo que será impresso para o cliente.
