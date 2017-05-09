*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         automation-showcase-app.herokuapp.com
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     alpha
${LOGIN URL}      http://${SERVER}/
${HOME URL}      http://${SERVER}/home
${ERROR URL}      http://${SERVER}/error

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Test App

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Submit Credentials
    Click Button    login

Logout
    Click Link    logout

Verify Message
    [Arguments]   ${text}
    Element Should Contain   message  ${text}

Welcome Page Should Be Open
    Location Should Be    ${HOME URL}
    Title Should Be    Test App

Error Page Should Be Open
    Location Should Be    ${ERROR URL}
    Title Should Be    Test App
