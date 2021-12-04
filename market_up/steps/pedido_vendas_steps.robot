*** Settings ***
Resource  ../selenium_library.resource

*** Keywords ***
Quando estiver na página pedido de vendas
  Wait Until Element Is Visible  //div[@class='menu-icon-item'][contains(.,'Vendas')]  timeout=30
  Click Element  //div[@class='menu-icon-item'][contains(.,'Vendas')]
  Wait Until Element Is Visible  //a[contains(.,'Pedidos')]
  Click Element  //a[contains(.,'Pedidos')]
  Wait Until Element Is Visible  //p[@class='subcategory ng-binding ng-scope']
  Capture Page Screenshot  filename=página_pedido_venda.png

E adicinar um novo pedido
  Wait Until Element Is Visible  //button[contains(.,'AdicionarNovo')]
  Click Button  //button[contains(.,'AdicionarNovo')]
  Capture Page Screenshot  filename=adicionar_pedido_venda.png

E informar os campos do pedido
  Wait Until Element Is Visible  //input[@name='clientName']
  Input Text  //input[@name='clientName']  Cliente padrão 01
  Wait Until Element Is Visible  //a[@title='Cliente Padrão 01']  timeout=5
  Click Element  //a[@title='Cliente Padrão 01']
  Execute Javascript  window.scroll(0, 3000)
  Wait Until Element Is Visible  //u[contains(.,'Clique aqui')]  timeout=10
  Click Element  //u[contains(.,'Clique aqui')]
  Wait Until Element Is Visible  //input[contains(@placeholder,'DIGITE O NOME OU CÓDIGO DO ITEM')]
  Input Text  //input[contains(@placeholder,'DIGITE O NOME OU CÓDIGO DO ITEM')]  001  
  Wait Until Element Is Visible  //a[@title='001 - PRODUTO DEMONSTRAÇÃO']  timeout=10
  Click Element  //a[@title='001 - PRODUTO DEMONSTRAÇÃO'] 
  Wait Until Element Is Visible  //span[@class='glyphicon glyphicon-plus-sign']
  Click Element  //span[@class='glyphicon glyphicon-plus-sign']
  Click Element  //b[contains(.,'Incluir')]
  Execute Javascript  window.scroll(0, 3000)
  Wait Until Element Is Visible  //div[@class='form-group'][contains(.,"Forma de pagamento")]//select  timeout=15
  Click Element  //select[@ng-model='controller.currentPaymentType']
  Wait Until Element Is Visible  (//option[contains(.,'DINHEIRO')])[1]  timeout=15
  Click Element  (//option[contains(.,'DINHEIRO')])[1]
  Wait Until Element Is Visible  //button[@type='submit'][contains(.,'Gerar contas')]
  Click Element  //button[@type='submit'][contains(.,'Gerar contas')]
  Execute Javascript  window.scroll(0, 3000)
  Capture Page Screenshot  filename=campos_pedido.png

E clicar no botão salvar
  Wait Until Element Is Visible  //button[@type='button'][contains(.,'Salvar')]
  Click Button  //button[@type='button'][contains(.,'Salvar')]
  Capture Page Screenshot  filename=salvar_pedido.png

Então o sistema cadastra o pedido de vendas corretamente
  Wait Until Element Is Visible  //p[contains(.,'Pedido Nº') and contains(.,'salvo com sucesso!')]  timeout=5
  Capture Page Screenshot  filename=cadastro_pedido_sucesso.png

E clicar no botão editar
  Wait Until Element Is Visible  (//i[contains(@class,'sprite-new-erp edit')])[1]
  Click Element  (//i[contains(@class,'sprite-new-erp edit')])[1]
  Wait Until Element Is Visible  //h2[contains(.,'Cliente')]
  Execute Javascript  window.scroll(0, 2500)
  Capture Page Screenshot  filename=edição_pedido.png

E informar os novos campos do pedido
  Sleep  10
  Wait Until Element Is Visible  //input[contains(@ng-model,'controller.currentOrder.Client.Phone')]
  Input Text  //input[contains(@ng-model,'controller.currentOrder.Client.Phone')]  46999999999
  Execute Javascript  window.scroll(0, 4000)
  Capture Page Screenshot  filename=novo_campo_pedido.png

Quando clicar no botão salvar
  Wait Until Element Is Visible  //button[contains(@class,'btn-bottom ng-scope')]
  Click Button  //button[contains(@class,'btn-bottom ng-scope')]
  Capture Page Screenshot  filename=salvar_edição_pedido.png

Então o sistema atualiza o pedido de venda do cliente 
  Wait Until Element Is Visible  //p[contains(.,'Pedido Nº') and contains(.,'salvo com sucesso!')]  timeout=5
  Capture Page Screenshot  filename=edição_salva_sucesso.png

Quando clicar no botão concluir venda
  Execute Javascript  window.scroll(0, 4000)
  Wait Until Element Is Visible  //button[contains(.,'Concluir Venda')]
  Click Button  //button[contains(.,'Concluir Venda')]
  Capture Page Screenshot  filename=concluir_venda.png

Então o sistema apresenta o status de entregue
  Wait Until Element Is Visible  //p[contains(.,'Pedido Nº') and contains(.,'concluído/faturado com sucesso!')]  timeout=30
  Capture Page Screenshot  filename=status_pedido_entregue.png

Quando clicar no botão cancelar
  Execute Javascript  window.scroll(0, 4000)
  Wait Until Element Is Visible  //button[contains(@class,'btn-bottom red ng-scope')]
  Click Element  //button[contains(@class,'btn-bottom red ng-scope')]
  Wait Until Element Is Visible  //strong[contains(.,'Deseja mesmo cancelar este pedido ?')]  timeout=30
  Click Element  //button[contains(.,'Sim')]

Então o sistema apresenta o status de cancelado
  Wait Until Element Is Visible  //p[contains(.,'Pedido Nº') and contains(.,'cancelado com sucesso!')]  timeout=15
  Capture Page Screenshot  filename=cancelamento_salvo_sucesso.png