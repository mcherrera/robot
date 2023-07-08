*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords
...               directly from SeleniumLibrary
Library           SeleniumLibrary

*** Test Cases ***
Valid Login
    Open Browser     https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    Set Selenium Speed    0
    Page Should Contain Element    login-button
    Input Text    user-name    standard_user
    Input Text    password    secret_sauce
    Click Button    login-button
    Element Text Should Be    class:title    Products
    [Teardown]    Close Browser

