*** Settings ***
Documentation    A test suite with two tests for invalid login
...
...              This test has a workflow that is created using keywords
...              from a resource file
Resource        resource.robot

*** Test Cases ***
Locked Out User
    Open Browser To Login Page
    Input Username    locked_out_user
    Input Password    secret_sauce
    Submit Credentials
    Login Page Should Be Open
    Error Message Shown    Epic sadface: Sorry, this user has been locked out.
    [Teardown]    Close Browser

*** Keywords ***
Error Message Shown
    [Arguments]    ${error}
    Element Text Should Be    css:*[data-test="error"]    ${error}