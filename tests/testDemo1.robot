*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Test Teardown   Close Browser
*** Variables ***
${Error_Message_Login}    css:.alert-danger  #way to create variable


*** Test Cases ***
Validate Unsucessfull login
    open the browser with mortgage url
    fill the login form
    wait until it check and displays error message
    verify the error message

*** Keywords ***
open the browser with mortgage url
    Create Webdriver    Chrome  executable_path=E:\\chromedriver.exe
    Go To    https://rahulshettyacademy.com/loginpagePractise/
fill the login form
    Input Text        Id:username   Situ
    Input Password    Id:password   1234
    Click Button      signInBtn             #If we did not mention it as Id or xapth or css then robot treat it as ID
wait until it check and displays error message
    Wait Until Element Is Visible   ${Error_Message_Login}

verify the error message
    ${Result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${Result}    Incorrect username/password.     #builtin keyword
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.  #sort form for upper 2line