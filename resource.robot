*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...               
...              The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary
Library          SeleniumLibrary

*** Variables ***
${SERVER}    www.saucedemo.com
${BROWSER}    Chrome
${DELAY}      0
${VALID USER}    standard_user
${VALID PASSWORD}    secret_sauce
${LOCKED OUT USER}    locked_out_user
${LOGIN URL}            https://${SERVER}/
${HOME URL}            https://${SERVER}/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open
    
Login Page Should Be Open
    Page Should Contain Element    login-button

Product Page Should Be Open
    Element Text Should Be    class:title    Products

Submit Credentials
    Click Button    login-button

Input Username
    [Arguments]    ${username}
    Input Text        user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}
