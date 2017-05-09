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
