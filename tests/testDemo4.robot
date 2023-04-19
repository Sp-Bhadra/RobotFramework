*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Test Template    Validate Unsucessfull login


*** Variables ***
${Error_Message_Login}    css:.alert-danger


*** Test Cases ***      username        password
Invalid Username    sarada  learning
Invalid Password    rahulshett      adsd
Special Charectors  @#          learning

*** Keywords ***
Validate Unsucessfull login
    [Arguments]    ${Username}  ${Password}
    open the browser with mortgage url
    fill the login form     ${username}     ${password}
    wait until it check and displays error message
    verify the error message

open the browser with mortgage url
    Create Webdriver    Chrome  executable_path=E:\\chromedriver.exe
    Go To    https://rahulshettyacademy.com/loginpagePractise/

fill the login form
    [Arguments]    ${Username}  ${Password}
    Input Text        Id:username   ${User_Name}
    Input Password    Id:password   ${Password}
    Click Button      signInBtn
wait until it check and displays error message
    Wait Until Element Is Visible   ${Error_Message_Login}

verify the error message
    ${Result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${Result}    Incorrect username/password.     #builtin keyword