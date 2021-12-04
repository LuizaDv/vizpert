*** Settings ***
Documentation  Essa suite testa o cenário da funcionalidade de pedidos de venda

Resource  ../steps/pedido_vendas_steps.robot
Resource    ../steps/login_steps.robot

Test Setup  Abrir navegador
Test Teardown  Fechar navegador

*** Test Cases ***
Caso de teste 01: Cadastro do pedido de venda
  Dado que acessei a página home do site Market Up
  Quando estiver na página pedido de vendas
  E adicinar um novo pedido
  E informar os campos do pedido
  E clicar no botão salvar
  Então o sistema cadastra o pedido de vendas corretamente

Caso de teste 02: Edição do pedido de venda
  Dado que acessei a página home do site Market Up
  Quando estiver na página pedido de vendas
  E clicar no botão editar
  E informar os novos campos do pedido
  Quando clicar no botão salvar
  Então o sistema atualiza o pedido de venda do cliente

Caso de teste 03: Entrega do pedido de venda
  Dado que acessei a página home do site Market Up
  Quando estiver na página pedido de vendas
  E adicinar um novo pedido
  E informar os campos do pedido
  Quando clicar no botão concluir venda
  Então o sistema apresenta o status de entregue

Caso de teste 04: Cancelamento do pedido de venda
  Dado que acessei a página home do site Market Up
  Quando estiver na página pedido de vendas
  E clicar no botão editar
  Quando clicar no botão cancelar
  Então o sistema apresenta o status de cancelado