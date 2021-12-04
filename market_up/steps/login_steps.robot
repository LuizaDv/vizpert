*** Settings ***
Resource  ../selenium_library.resource

*** Variables ***
${URL}  https://administradorqa.marketup.com/
${BROWSER}  chrome

*** Keywords ***
Abrir navegador
  Open Browser  url=${URL}  browser=${BROWSER}
  Maximize Browser Window

Fechar navegador
  Close Browser

Dado que acessei a página home do site Market Up
  Wait Until Element Is Visible  //input[@type='text'][contains(@id,'login')]
  Input Text  //input[@type='text'][contains(@id,'login')]  testerqa
  Wait Until Element Is Visible  //input[@type='password'][contains(@id,'password')]
  Input Text  //input[@type='password'][contains(@id,'password')]  testerqa123
  Click Button  //button[contains(.,'entrar')]
  Wait Until Element Is Visible  //h2[contains(.,'EMPRESA DO TESTER QA')]  timeout=15