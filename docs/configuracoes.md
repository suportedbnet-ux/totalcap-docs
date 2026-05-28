# TELA DE CONFIGURAÇÕES

## Descrição
Tela de configurações do sistema. Permite alterar a senha do usuário logado e alternar entre temas claro/escuro.

## Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Senha Atual (oldPassword) | password | **Sim** | Senha atual |
| Nova Senha (newPassword) | password | **Sim** | Nova senha |
| Confirmar Senha (confirmPassword) | password | **Sim** | Confirmação da nova senha |
| Tema (theme) | clickable card | Não | Alterna entre Dark e Light |

## Regras de Negócio - Botão Salvar

### Alterar Senha (handlePasswordChange)
1. **Validação de Coincidência**: O sistema verifica se `newPassword` é igual a `confirmPassword`. Se não coincidirem, a alteração é bloqueada.
2. **Validação de Tamanho**: A nova senha deve ter pelo menos 4 caracteres.
3. **Requisição**: Envia via `PUT` para o endpoint `/usuarios/me/password` com os campos `old_password` e `new_password`.
4. **Pós-gravação**: Em caso de sucesso, exibe mensagem de confirmação. Em caso de erro, exibe mensagem de erro.

### Alterar Tema
1. O usuário clica no card "Dark" ou "Light".
2. O tema é alterado imediatamente no frontend e armazenado no estado/localStorage.
3. Não há gravação em servidor para a preferência de tema.

## Botão Imprimir
- Esta tela não possui funcionalidade de impressão.
