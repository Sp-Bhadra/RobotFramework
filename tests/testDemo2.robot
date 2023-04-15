*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Test Setup    open the browser with mortgage url
Test Teardown   Close Browser
Resource    resource.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger  #way to create variable
${Shop_page_load}       css:.nav-link.btn.btn-primary

*** Test Cases ***
Validate Unsucessfull login

    fill the login form    ${Invalid_Username}     ${Invalid_Password}
    wait until element is located in page       ${Error_Message_Login}
    verify the error message

Validate cards display in shopping page
    fill The Login Form    ${Valid_UserName}    ${Valid_Password}
    wait until element is located in page    ${Shop_page_load}
    verify card titles in shop page

*** Keywords ***
fill the login form

    [Arguments]    ${Username}  ${Password}    #generalize input value we can now use it for valid and invalid inputs
    Input Text        Id:username   ${User_Name}
    Input Password    Id:password   ${Password}
    Click Button      signInBtn             #If we did not mention it as Id or xapth or css then robot treat it as ID

wait until element is located in page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify the error message
    ${Result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${Result}    Incorrect username/password.     #builtin keyword
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.  #sort form for upper 2line

verify card titles in shop page
    @{expectedlist}=    Create List     iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}     Get Webelements     css:.card-title
    FOR    ${element}   IN    @{elements}
        Log    ${element.text}
    END