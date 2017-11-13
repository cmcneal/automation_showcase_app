# Robot Framework
> Generic test automation framework for acceptance testing and ATDD

|         |     |
|---------|-----|
|Website  | http://robotframework.org/ |
|Language | python                     |
|Drivers  | too many to list           |

## Installation
*

## Running the test
*

## Config/folder structure
```
.
project
\---tests
        invalid_login.robot
        resource.robot
        valid_login.robot
```

## Example
`resource.robot`
```python
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
```

`invalid_login.robot`
```python
*** Settings ***
Documentation     A test suite with a single test for invalid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    error
    Submit Credentials
    Error Page Should Be Open
    Verify Message    Username was incorrect.
    Logout
    [Teardown]    Close Browser

```

'valid_login.robot`
```python
*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    alpha
    Submit Credentials
    Welcome Page Should Be Open
    Verify Message    You are now signed
    Logout
    Login Page Should Be Open
    Input Username    ${SPACE}test${SPACE}
    Submit Credentials
    Welcome Page Should Be Open
    Verify Message    You are now signed
    Logout
    [Teardown]    Close Browser

```
