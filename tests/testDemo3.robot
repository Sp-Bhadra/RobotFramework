*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    String
Test Setup    open the browser with mortgage url
Test Teardown   Close Browser
Resource    resource.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger  #way to create variable
${Shop_page_load}       css:.nav-link.btn.btn-primary

*** Test Cases ***
Validate child window functionality
    Select the link of child window
    Verify the user is switched to child window
    Grab the email id in the child window
    Switch to parent window and enter the email

*** Keywords ***
Select the link of child window
    Click Element    css:.blinkingText
    Sleep       5 seconds

Verify the user is switched to child window
    Switch Window   NEW
    Element Text Should Be    css:h1     DOCUMENTS REQUEST

Grab the email id in the child window
    ${Text}=    Get Text    css:.im-para.red
    @{Words}=   Split String    ${Text}     at
    ${text_split}=  Get From List    ${Words}   1
    @{Word_2}=  Split String    ${text_split}}
    ${email}=   Get From List    ${Word_2}      0
    Set Global Variable    ${email}

Switch to parent window and enter the email
   Switch Window   MAIN
   Title Should Be  LoginPage Practise | Rahul Shetty Academy
   Input Text        Id:username    ${email}

