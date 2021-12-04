*** Settings ***
Resource  ../selenium_library.resource
Resource  ../faker_library.resource

*** Keywords ***
 Quando estiver na página de cadastro de clientes
  Wait Until Element Is Visible  //div[@class='menu-icon-item'][contains(.,'Vendas')]  timeout=15
  Click Element  //div[@class='menu-icon-item'][contains(.,'Vendas')]
  Wait Until Element Is Visible  //a[contains(.,'Clientes')]
  Click Element  //a[contains(.,'Clientes')]
  Wait Until Element Is Visible  //p[@class='subcategory ng-scope'][contains(.,'Clientes')]

E clico em adicionar novo
  Click Button  //button[contains(.,'AdicionarNovo')]
  Wait Until Element Is Visible  //h2[contains(.,'Ficha cadastral')]
  Capture Page Screenshot  filename=ficha_cadastral.png

E informo os campos da ficha cadastral
  Wait Until Element Is Visible  //select[@ng-model='controller.currentClient.ClientType']
  Select From List By Label  //select[@ng-model='controller.currentClient.ClientType']  Padrão
  Wait Until Element Is Visible  (//input[@ng-model='controller.currentClient.OfficialName'])[1]  timeout=30
  ${NOME}  FakerLibrary.Name
  Input Text  (//input[@ng-model='controller.currentClient.OfficialName'])[1]  ${NOME}
  Set Global Variable  ${NOME}
  Wait Until Element Is Visible  //input[contains(@ng-model,'controller.currentClient.CreditLimit')]
  Input Text  //input[contains(@ng-model,'controller.currentClient.CreditLimit')]  1000,00
  Execute Javascript  window.scroll(0, 3000)
  Capture Page Screenshot  filename=preenchendo_ficha_cadastral.png

Quando clico no botão salvar
  Wait Until Element Is Visible  //label[@title='Salvar']
  Execute Javascript  window.scroll(0, 3000)
  Click Element  //label[@title='Salvar']
  Capture Page Screenshot  filename=salvar_cadastro.png

Então o sistema cadastra o cliente corretamente
  Wait Until Element Is Visible  //p[contains(.,'Dados inseridos com sucesso.')]
  Capture Page Screenshot  filename=cadastro_sucesso.png

E edito a ficha cadastral do cliente
  Wait Until Element Is Visible  (//button[contains(@title,'Editar')])[1]
  Click Element  (//button[contains(@title,'Editar')])[1]
  Wait Until Element Is Visible  (//input[contains(@type,'text')])[7]
  ${APELIDO}  FakerLibrary.Name
  Input Text  (//input[contains(@type,'text')])[7]  ${APELIDO}
  Capture Page Screenshot  filename=edição_cadastro.png

Então o sistema atualiza o cadastro do cliente 
  Wait Until Element Is Visible  //p[contains(.,'Dados alterados com sucesso.')]
  Capture Page Screenshot  filename=atualização_cadastro.png

Então o sistema apresenta a listagem dos clientes
  Wait Until Element Is Visible  //td[@title='${NOME}']
  Capture Page Screenshot  filename=listagem_clientes.png