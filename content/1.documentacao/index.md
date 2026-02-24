---
title: API Reference
description: Endpoints para consultar saldo e enviar SMS
---

# API de SMS

A API de SMS permite integrar comunicações de texto rápidas aos seus sistemas. Você pode utilizar o webhook principal para envio de SMS ou para verificar os créditos vigentes.

## Autenticação

Para realizar chamadas ao webhook, é necessário autenticação através de um Token Bearer via cabeçalho HTTP:

```http
Authorization: Bearer <SEU_TOKEN_AQUI>
```

---

## Consultar Saldo de SMS

O endpoint possibilita consultar a quantidade de créditos disponíveis atualmente na sua conta.

### Requisição

Envie o parâmetro `acao` com o valor `saldo` no corpo da sua requisição (`body`):

```bash
curl -X POST 'https://n8n.fcati.com.br/webhook/api-sms' \
-H 'Authorization: Bearer eyJzdWIiOiIxMjM0NTY3ODkwIi..' \
-H 'Content-Type: application/json' \
-d '{
  "acao": "saldo"
}'
```

### Resposta

Como resposta, a API retornará um JSON com a chave `balance` refletindo os créditos.

```json
{
  "balance": 998
}
```

---

## Envio de SMS

Este é o payload para inicializar a rotina de envio de SMS a partir do seu sistema. 

### Requisição

(*O payload exato será interpretado conforme as definições documentadas no webhook destino*)

```bash
curl -X POST 'https://n8n.fcati.com.br/webhook/api-sms' \
-H 'Authorization: Bearer eyJzdWIiOiIxMjM0NTY...' \
-H 'Content-Type: application/json' \
-d '{
  "acao": "saldo"
}'
```

### Resposta do envio de SMS

A API retornará os detalhes do processamento caso sua mensagem seja encaminhada com sucesso, refletindo seu novo saldo.

```json
{
  "messageId": "227336587",
  "message": "Mensagem enviada com sucesso!",
  "remaining_balance": 998
}
```
