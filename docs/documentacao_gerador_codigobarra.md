# Documentação: Regras de Negócio - Gerador de Código de Barras

Este documento detalha em linguagem natural as regras de negócio atreladas aos botões e ao funcionamento da tela de **Gerador de Etiquetas / Códigos de Barra**.

> [!TIP]  
> **Aviso de Funcionalidade:** Diferente de todas as outras telas do sistema, o Gerador de Código de Barras é um **utilitário de memória temporária**. Ele não salva dados no banco de dados, não possui histórico e nem modais de edição. Tudo que é feito aqui serve apenas para impressão imediata.

---

## 1. Estrutura da Matriz de Digitação

Para economizar papel adesivo, o sistema não gera um código por linha. Ele usa uma **Matriz de 3 Colunas** (Conjunto 1, Conjunto 2 e Conjunto 3). 
*   **Regra de Digitação:** O usuário deve preencher o "Código" (os números que a máquina vai ler) e o "Título" (o texto amigável que o humano vai ler acima do código de barras).

## 2. Ações e Botões

*   **Adicionar Linha (+ Botão Secundário no Cabeçalho)**
    *   **Ação:** Quando a grade de 3 conjuntos estiver cheia, o usuário clica neste botão para criar uma nova linha em branco abaixo, ganhando espaço para digitar mais 3 etiquetas.
*   **Excluir Linha (Lixeira Vermelha na Grade)**
    *   **Ação:** Apaga uma linha inteira caso tenha havido erro.
    *   **Trava de Segurança:** O sistema não deixa apagar se existir apenas uma única linha na tela.
*   **Imprimir Etiquetas (Botão Azul com Impressora)**
    *   **Regra de Processamento (Code128):** Este é o botão principal do módulo. Ao ser clicado, o sistema executa uma rotina invisível que converte todos os "Códigos" digitados em desenhos matemáticos de barras (no padrão industrial CODE128). 
    *   **Regra de Layout de Impressão:** Ao acionar a impressora, o sistema esconde toda a interface gráfica (esconde botões, tabelas, menus) e "pinta" na tela exclusivamente os blocos formatados das etiquetas, garantindo que o papel adesivo saia perfeito sem sujeira visual da página web.
