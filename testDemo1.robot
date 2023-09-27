*** Settings *** 
# Declaring a module name in a robot file.

Documentation   To validate the login form
Library     SeleniumLibrary
Library     Collections
Test Setup      Open The Broswer With The Ecomerce Payment Url      
Test Teardown   Close Browser Session
Resource        resource.robot

#Resource

*** Variables ***
${ErrorMessageLogin}            css:.alert-danger 
${ShopPageLoad}                 css:.nav-link

*** Test Cases ***
# validate UnSuccessful login
        # Fill the login Form     ${InvalidUsername}      ${InvalidPassword}       
        # wait until Element is located in the page       ${ErrorMessageLogin} 
        # verify error message is correct

# Validate Cards displayed in the Shopping Page
#         Fill the login Form     ${username}     ${password}
#         wait until Element is located in the page       ${ShopPageLoad}  
#         Verify Card Titles in the Shop page 
#         Select the Card         Blackberry  

Select the Form and Navigate to Child window  
         Fill the login Details and select the User option      ${username}     ${password}


*** Keywords ***

Fill the Login Form
        [Arguments]     ${username}     ${password}
        Input Text      id:username      ${username}
        Input Password  id:password      ${password}
        Click Button    id:signInBtn

wait until Element is located in the page
        [Arguments]     ${element}
        Wait Until Element Is Visible           ${element}

 verify error message is correct
      ${result} =  Get Text       ${ErrorMessageLogin}  
      Should Be Equal As Strings        ${result}       Incorrect username/password.

Verify Card Titles in the Shop page
        @{expectedList} =       Create List     iphone X        Samsung Note 8          Nokia Edge      Blackberry    
        ${elements} =           Get WebElements         CSS:.card-title
        @{actualList} =         Create List 

        FOR     ${element}         IN       @{elements}
            Log    ${element.text}
            Append To List      ${actualList}           ${element.text}
        END
        Lists Should Be Equal          ${expectedList}          ${actualList} 

Select the Card 
        [Arguments]     ${cardName}
        ${elements} =           Get WebElements         CSS:.card-title
        ${index} =      Set Variable        1
         FOR     ${element}         IN       @{elements}
                 Exit For Loop If       '${cardName}' == '${element.text}'
                 ${index} =     Evaluate        ${index} + 1
        END
        Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login Details and select the User option
         [Arguments]     ${username}     ${password}
         Input Text      id:username      ${username}
         Input Password  id:password      ${password}
         Click Element   CSS: input[value='user']
         Wait Until Element Is Visible    CSS:.modal-body
         Click Button     id:okayBtn
         Click Button     id:okayBtn
         Wait Until Element Is Not Visible   CSS:.modal-body
         Select From List By Value      CSS:select.form-control     teach  #There is a bug in this line
         Select Checkbox      terms 
         Checknox Should Be Selected    terms