*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://www.stella-lamour.com.br/
${browser}          chrome
${TITULO_PAGINA}    stella.lamour
${USERNAME}         New User Tester
${EMAIL_VALIDO}     teste12345@teste.com
${EMAIL_VALIDO_2}   teste4321@teste.com
${TRUE_PASS}        abcd123456
${CEP}              13477-460
${CPF_CORRETO}      188.917.550-10
${CPF_INCORRETO}    111.111.111-11
${NUM}              998
${CEL}              (19)911112224
${NASCIMENTO}       31/05/1993

*** Test Cases ***
CENARIO 1 - Cadastro Positivo
    dado que acesso o site StellaLamour
    quando clico em minha conta
    e digito o email valido para cadastrar
    e digito o email valido para confirmar
    e digito o password valido para cadastrar
    e digito o password valido para confirmar
    e digito o nome correto do usuario
    e digito o CPF correto
    e digito o celular correto
    e seleciono o sexo masculino
    e digito a data de nascimento
    e digito o endereco com o CEP e numero de residencia corretos
    e clico em criar conta
    entao devera aparecer a mensagem "Cliente criado com sucesso."
    e devera aparecer o nome do usuario na tela.

CENARIO 2 - Cadastro Negativo - Usuário existente
    dado que acesso o site StellaLamour
    quando clico em minha conta
    e digito o email existente para cadastrar
    entao devera aparecer a mensagem "Já existe um cliente cadastrado com este email."

CENARIO 3 - Cadastro Negativo - Dados incorretos
    dado que acesso o site StellaLamour
    quando clico em minha conta
    e digito outro email valido para cadastrar
    e digito outro email valido para confirmar
    e digito o password valido para cadastrar
    e digito o password valido para confirmar
    e digito o nome correto do usuario
    e digito o CPF incorreto
    e digito o celular correto
    e seleciono o sexo masculino
    e digito a data de nascimento
    e digito o endereco com o CEP e numero de residencia corretos
    e clico em criar conta
    entao devera aparecer a mensagem "Este campo é obrigatório."

*** Keywords ***
dado que acesso o site StellaLamour
    Open Browser        ${URL}  ${BROWSER}
    Maximize Browser Window
    Sleep               1
    Title Should Be     ${TITULO_PAGINA}

quando clico em minha conta
    wait until element is enabled  xpath = //a[@class="bem-vindo cor-secundaria"]
    click element  xpath = //a[@class="bem-vindo cor-secundaria"]

e digito o email valido para cadastrar
    wait until element is enabled  xpath = //input[@class = "span8"]
    input text                     xpath = //input[@class = "span8"]  ${EMAIL_VALIDO}
    click element                  xpath = //button[contains(text(),'Cadastrar')]

e digito o email valido para confirmar
    wait until element is enabled  xpath = //input[@id= "id_confirmacao_email"]
    input text                     xpath = //input[@id= "id_confirmacao_email"]  ${EMAIL_VALIDO}

e digito o password valido para cadastrar
    wait until element is enabled  xpath = //input[@id= "id_senha"]
    input text                     xpath = //input[@id= "id_senha"]  ${TRUE_PASS}

e digito o password valido para confirmar
    wait until element is enabled  xpath = //input[@id= "id_confirmacao_senha"]
    input text                     xpath = //input[@id= "id_confirmacao_senha"]  ${TRUE_PASS}

e digito o nome correto do usuario
    wait until element is enabled  xpath = //input[@id= "id_nome"]
    input text                     xpath = //input[@id= "id_nome"]  ${USERNAME}

e digito o CPF correto
    wait until element is enabled  xpath = //input[@id= "id_cpf"]
    input text                     xpath = //input[@id= "id_cpf"]  ${CPF_CORRETO}

e digito o celular correto
    wait until element is enabled  xpath = //input[@id= "id_telefone_celular"]
    input text                     xpath = //input[@id= "id_telefone_celular"]  ${CEL}

e seleciono o sexo masculino
    Select From List By value      name = sexo     m

e digito a data de nascimento
    wait until element is enabled  xpath = //input[@id= "id_data_nascimento"]
    input text                     xpath = //input[@id= "id_data_nascimento"]  ${NASCIMENTO}

e digito o endereco com o CEP e numero de residencia corretos
    wait until element is visible  xpath = //input[@id= "id_cep"]
    input text                     xpath = //input[@id= "id_cep"]  ${CEP}
    wait until element is visible  xpath = //input[@id= "id_numero"]
    input text                     xpath = //input[@id= "id_numero"]  ${NUM}

e clico em criar conta
    sleep  2
    wait until element is enabled  xpath = //button[contains(text(),'Criar Conta')]
    click button                   xpath = //button[contains(text(),'Criar Conta')]

entao devera aparecer a mensagem "Cliente criado com sucesso."
    wait until element is enabled   css = div.alert.alert-success.alert-geral   30000ms
    element should contain          css = div.alert.alert-success.alert-geral  Cliente criado com sucesso.

e devera aparecer o nome do usuario na tela.
    wait until element is enabled   xpath = //span[@class="nome-usuario titulo cor-secundaria borda-alpha"]  30000ms
    element should contain          xpath = //span[@class="nome-usuario titulo cor-secundaria borda-alpha"]  ${USERNAME}
    close browser

e digito o email existente para cadastrar
    wait until element is enabled  xpath = //input[@class = "span8"]
    input text                     xpath = //input[@class = "span8"]  ${EMAIL_VALIDO}
    click element                  xpath = //button[contains(text(),'Cadastrar')]

entao devera aparecer a mensagem "Já existe um cliente cadastrado com este email."
    wait until element is enabled  xpath = //div[@class="alert alert-danger alert-geral"]   30000ms
    element should contain         xpath = //div[@class="alert alert-danger alert-geral"]  Já existe um cliente cadastrado com este email.
    close browser

e digito outro email valido para cadastrar
    wait until element is enabled  xpath = //input[@class = "span8"]
    input text                     xpath = //input[@class = "span8"]  ${EMAIL_VALIDO_2}
    click element                  xpath = //button[contains(text(),'Cadastrar')]

e digito outro email valido para confirmar
    wait until element is enabled  xpath = //input[@id= "id_confirmacao_email"]
    input text                     xpath = //input[@id= "id_confirmacao_email"]  ${EMAIL_VALIDO_2}

e digito o CPF incorreto
    wait until element is enabled  xpath = //input[@id= "id_cpf"]
    input text                     xpath = //input[@id= "id_cpf"]  ${CPF_INCORRETO}

entao devera aparecer a mensagem "Este campo é obrigatório."
    wait until element is enabled  xpath = //div/span/ul  30000ms
    element should contain         xpath = //div/span/ul  Este campo é obrigatório.
    close browser