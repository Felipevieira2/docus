---
title: API de SMS
description: Refêrencias dos Endpoints para consultar seu saldo e disparar mensagens SMS.
---

# API de SMS

A **API de SMS da FCATI** foi desenvolvida para oferecer uma integração rápida e totalmente confiável aos seus sistemas. Através do nosso *webhook* principal, você pode não apenas enviar mensagens de texto de forma ágil, mas também monitorar o quantitativo de créditos da sua conta em tempo real.

Siga os passos abaixo, copiando as referências em `cURL` para realizar seus testes iniciais.

## Introdução: Autenticação

A segurança das suas requisições é fundamental. Todas as chamadas para o *webhook* da nossa API devem ser obrigatoriamente autenticadas utilizando um *Token* **Bearer** por meio do cabeçalho (*Header*) HTTP:

```http
Authorization: Bearer <SEU_TOKEN_AQUI>
```

::alert{type="info"}
Certifique-se de não compartilhar o seu *Token*, pois ele garante o acesso à base de créditos e envios da sua aplicação.
::

---

## Consultar Saldo

Utilize este *endpoint* para verificar a quantidade atual de créditos disponíveis para envio na sua conta. É fortemente recomendado monitorar o seu saldo através de rotinas agendadas para garantir a prestação contínua da sua operação.

### Estruturanto sua Requisição

Para consultar, você deve enviar o parâmetro `acao` com o valor definido como `saldo` direto no corpo da sua requisição (`body`):

```bash
curl -X POST 'https://n8n.fcati.com.br/webhook/api-sms' \
-H 'Authorization: Bearer eyJzdWIiOiIxMjM0NTY3ODkwIi..' \
-H 'Content-Type: application/json' \
-d '{
  "acao": "saldo"
}'
```

::callout{icon="i-lucide-check-circle" color="green"}
**Resposta da API**
Caso autenticado, nossa solução retornará o seu saldo na variável `balance`:
```json
{
  "balance": 998
}
```
::

---

## Envio de Mensagens

Este processo inicializa o envio das suas mensagens SMS diretamente para o destinatário a partir da sua plataforma. É indispensável estruturar corretamente o *payload* (informações como número e texto).

### Estruturando sua Requisição

*(A estrutura completa do payload de envio será interpretada conforme as regras de negócio alinhadas previamente no momento da integração webhook. Abaixo listamos as rotas e tipos de cabeçalho mandatórios.)*

```bash
curl -X POST 'https://n8n.fcati.com.br/webhook/api-sms' \
-H 'Authorization: Bearer eyJzdWIiOiIxMjM0NTY...' \
-H 'Content-Type: application/json' \
-d '{
  "acao": "saldo"
}'
```

::callout{icon="i-lucide-smartphone" color="blue"}
**Resposta do Envio**
A API confirmará os detalhes do processamento caso a sua mensagem seja inserida na fila, sinalizando sucesso (`messageId`) juntamente com o recálculo do seu novo saldo após o abatimento do custo do SMS (`remaining_balance`):
```json
{
  "messageId": "227336587",
  "message": "Mensagem enviada com sucesso!",
  "remaining_balance": 998
}
```
::

---

## Suporte Técnico

Encontrou algum problema durante a integração ou possui dúvidas adicionais? Entre em contato com nossa equipe técnica abrindo um chamado.

::u-button
---
to: https://fcati.com.br/helpdesk/assistencia-ao-cliente-1
target: _blank
icon: i-lucide-life-buoy
color: primary
size: md
---
Abrir Ticket de Suporte
::
