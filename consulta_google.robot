*** Settings ***
Documentation    Teste de consulta no buscador Google
...  abre o navegador Chrome
...  e raliza a consulta

Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***
${browser}      Chrome
${url}          https://www.google.com.br

*** Test Cases ***
Consulta Google
    [Tags]    rapido
    Acessar o Chrome na pagina <https://www.google.com.br>
    Digitar "Ovos de Páscoa" na pesquisa
    Validar se aparece no titulo da guia o resultado esperado
    Fechar o browser

*** Keywords ***
Setup chromedriver
    set Environment Variable  webdriver.chrome.driver  C:\Users\Particular\PycharmProjects\133petsRobotFrameWork\venv\Scripts\chromedriver.exe

Acessar o ${browser} na pagina <${url}>
    open browser  ${url}  ${browser}

Digitar "${palavra_chave}" na pesquisa
    set Test variable    ${palavra_chave}
    input text           name = q            ${palavra_chave}
    press keys           name = q            ENTER

Validar se aparece no titulo da guia o resultado esperado
    ${title} =          get title
    should contain       ${title}           ${palavra_chave}

Fechar o browser
    close browser
