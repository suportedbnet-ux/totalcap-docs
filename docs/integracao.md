# TELA DE INTEGRAÇÃO

## Descrição
Tela de importação e exportação de dados via arquivos XLSX (Excel). Permite transferir dados entre o sistema Totalcap e sistemas externos.

## Campos do Formulário

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| Tabela para Importar (tabelaSelecionada) | select | **Sim** | Tabela do banco de dados alvo |
| Arquivo XLSX (arquivoSelecionado) | file | **Sim** | Arquivo Excel para importação |
| Tabela para Exportar (tabelaExportar) | select | **Sim** | Tabela a ser exportada |

## Regras de Negócio - Botão Importar

1. **Validação**: Uma tabela deve ser selecionada e um arquivo deve ser carregado.
2. **Leitura do Arquivo**: O sistema utiliza a biblioteca SheetJS (XLSX) para ler o arquivo Excel no navegador.
3. **Mapeamento de Colunas**: As colunas do arquivo XLSX são mapeadas para os campos da tabela do banco de dados.
4. **Salvamento**: Cada linha é processada individualmente:
   - Se a linha possui um ID, é feita uma requisição `PUT` (atualização).
   - Se não possui ID, é feita uma requisição `POST` (criação).
5. **Pós-importação**: Exibe resumo com quantidade de registros importados.

## Regras de Negócio - Botão Exportar

1. **Validação**: Uma tabela deve ser selecionada para exportação.
2. **Requisição**: O sistema busca todos os registros da tabela via `GET` no endpoint correspondente.
3. **Geração do Arquivo**: Os dados são estruturados em formato XLSX utilizando a biblioteca SheetJS.
4. **Download**: O arquivo é disponibilizado para download via criação de URL de Blob no navegador.

## Botão Imprimir
- Esta tela não possui funcionalidade de impressão.

## Observações
- A tela suporta mais de 30 tabelas do sistema para importação/exportação.
- Ideal para migração de dados e integração com sistemas legados.
