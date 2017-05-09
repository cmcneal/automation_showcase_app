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
