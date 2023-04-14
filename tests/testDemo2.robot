*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Test Setup    open the browser with mortgage url
Test Teardown   Close Browser
Resource    resource.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger  #way to create variable


*** Test Cases ***
Validate Unsucessfull login

    fill the login form
    wait until it check and displays error message
    verify the error message

*** Keywords ***
fill the login form
    Input Text        Id:username   ${User_Name}
    Input Password    Id:password   ${Invalid_Password}
    Click Button      signInBtn             #If we did not mention it as Id or xapth or css then robot treat it as ID
wait until it check and displays error message
    Wait Until Element Is Visible   ${Error_Message_Login}

verify the error message
    ${Result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${Result}    Incorrect username/password.     #builtin keyword
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.  #sort form for upper 2line