*** Settings ***
Documentation  Essa suite testa o cenário da funcionalidade de cadastro de clientes

Resource  ../steps/cadastro_clientes_steps.robot
Resource  ../steps/login_steps.robot

Test Setup  Abrir navegador
Test Teardown  Fechar navegador

*** Test Cases ***
Caso de teste 01: Cadastro de cliente
  Dado que acessei a página home do site Market Up
  Quando estiver na página de cadastro de clientes
  E clico em adicionar novo
  E informo os campos da ficha cadastral
  Quando clico no botão salvar
  Então o sistema cadastra o cliente corretamente

Caso de teste 02: Edição do cadastro de cliente
  Dado que acessei a página home do site Market Up
  Quando estiver na página de cadastro de clientes
  E edito a ficha cadastral do cliente
  Quando clico no botão salvar
  Então o sistema atualiza o cadastro do cliente 

Caso de teste 03: Listagem dos clientes
  Dado que acessei a página home do site Market Up
  Quando estiver na página de cadastro de clientes
  Então o sistema apresenta a listagem dos clientes
