*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary

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
    Wait Until Element Is Not Visible   css:.alert-danger

verify the error message
    ${Result}=  Get Text    css:.alert-danger
    Should Be Equal As Strings    ${Result}    Incorrect username/password.     #builtin keyword