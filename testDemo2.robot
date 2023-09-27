*** Settings *** 
# Declaring a module name in a robot file.

Documentation   To validate the login form
Library     SeleniumLibrary
Library     String
Library     Collections
Test Setup      Open The Broswer With The Ecomerce Payment Url      
Test Teardown   Close Browser Session
Test Teardown   Close Browser
Resource        resource.robot

#Resource

*** Variables ***
${ErrorMessageLogin}            css:.alert-danger 

*** Test Cases ***
validate childWindow Functionality
        Select the link of Child window
        Verify the user is switched to Child window
        Grab the email id in the Child Window
        Swith to Parent window and enter the Email


*** Keywords ***
Select the link of Child window
        Click Element         css:.blinkingText
        Sleep                  5

Verify the user is switched to Child window
        Switch Window         NEW
        Element Text Should Be      css:h1      DOCUMENTS REQUEST

Grab the email id in the Child Window
        ${text} =       get text       css:.red
        @{words} =      Split String      ${text}      at
        ${text_split} =        Get From List           ${words}        1
        log       ${text_split}
        @{words_2} =      Split String      ${text_split}  
        ${email} =        Get From List           ${words_2}        0
        Set Global Variable             ${email}

Swith to Parent window and enter the Email
        Switch Window         MAIN  
        Title Should Be       LoginPage Practise | Rahul Shetty Academy
        Input Text            id:username       rahulshettyacademy     ${email} 




