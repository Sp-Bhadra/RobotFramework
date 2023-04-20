*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
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
    Hello World
    select the card  Blackberry

Select the form and Navigate to child page
    Fill the login details and select the user option       ${Valid_UserName}    ${Valid_Password}


*** Keywords ***
fill the login form

    [Arguments]    ${Username}  ${Password}    #generalize input value we can now use it for valid and invalid inputs
    #buitin keyword
    Input Text        Id:username   ${User_Name}  #selenium library
    Input Password    Id:password   ${Password}     #selenium Library
    Click Button      signInBtn             #If we did not mention it as Id or xapth or css then robot treat it as ID

wait until element is located in page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}     #selenium library

verify the error message
    ${Result}=  Get Text    ${Error_Message_Login}      #selenium library
    Should Be Equal As Strings    ${Result}    Incorrect username/password.     #builtin keyword
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.  #sort form for upper 2line
    #selenium library

verify card titles in shop page
    @{expectedlist} =    Create List     iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =     Get Webelements     css:.card-title
    @{actualList} =      Create List
    FOR    ${element}   IN    @{elements}
        Log    ${element.text}
        Append To List      ${actualList}       ${element.text}
    END
    Lists Should Be Equal       ${actualList}       ${expectedList}

select the card
    [Arguments]   ${Cardname}
     ${elements}=     Get Webelements     css:.card-title
     ${index}=      Set Variable    1
     FOR    ${element}   IN    @{elements}
        Exit For Loop If    '${Cardname}'=='${element.text}'
        ${index}=   Evaluate     ${index} + 1
     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    Sleep	10 seconds

Fill the login details and select the user option
    [Arguments]    ${Username}  ${Password}    #generalize input value we can now use it for valid and invalid inputs
    #buitin keyword
    Input Text        Id:username   ${User_Name}  #selenium library
    Input Password    Id:password   ${Password}
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    okayBtn
    Click Button      okayBtn
    Click Button      okayBtn
    Wait Until Element Is Not Visible    okayBtn
    Select From List By Label   css:select.form-control     Teacher
    Select Checkbox     terms
    Sleep	10 seconds