*** Settings ***
Resource  ../src/keyword.robot
Resource  ../src/common.robot
Resource  ../src/Pageobject.robot
Test Setup  Launch Demo App
Test Teardown  Close Browser

*** Test Cases ***
Verity User Can Register Through The UI Web Portal
    [Documentation]  This test can shows that user can register through the UI web portal
    [Tags]  Functional

    Click Element               ${REGISTER}
    Page Should Contain          Register
    Enter Username             ${USER_NAME}
    Enter Password               ${PASSWORD}
    Enter Firstname              ${FIRST_NAME}
    Enter Lastname             ${LAST_NAME} 
    Enter Phone Number           ${PHONE} 
    Click Button                Register


Verify User Can Review Own Information From Main View
    [Documentation]  This test case shows that user can review their own information with valid infromation from the view
    [Tags]  Functional
    Click Element          ${LOG_IN_TAB} 
    Page Should Contain      Log In
    Enter Username     ${USER_NAME}
    Enter Password      ${PASSWORD}
    Click Button              ${LOG_IN_BUTTON}
    Page Should Contain Username    ${USER_NAME}
    Page Should Contain First Name          ${FIRST_NAME}
    Page Should Contain Last Name           ${LAST_NAME} 
    Page Should Contain Phone Number          ${PHONE}

Verity User Can Not Login With An Invalid Credentials 
    [Documentation]  This test case shows that user can not log in with invalid credentials
    [Tags]  Functional

    Click Element                      ${LOG_IN_TAB}  
    Page Should Contain                Log In
    Enter Username                     ${INVALID_USERNAME}
    Enter Password                     ${INVALID_PASSWORD}
    Click Button                       ${LOG_IN_BUTTON}
    Page Should Contain                ${INVALID_LOGIN_WARNING} 
    



