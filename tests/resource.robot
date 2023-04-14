*** Settings ***
Documentation  A resource file with reusable keywords and variables.
...  The system specific keyword created here for our
...  domain specific language . They utilize keywords provided
...  by seleniumLibrary
Library    SeleniumLibrary

*** Variables ***

${User_Name}    Situ
${Invalid_Password}     1234
${url}  https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
open the browser with mortgage url
    Create Webdriver    Chrome  executable_path=E:\\chromedriver.exe
    Go To    ${url}