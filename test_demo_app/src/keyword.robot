*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  common.robot
Resource  Pageobject.robot

*** Keywords ***
Launch Demo App  
    Open Browser   ${URL}    ${BROWSER}

Enter Username
    [Arguments]         ${username}
    Input Text          ${USER_NAME_INPUT}      ${username}

Enter Password
    [Arguments]         ${password}
    Input Text          ${PASSWORD_INPUT}      ${password}

Enter Firstname
    [Arguments]         ${firstname}
    Input Text          ${FIRST_NAME_INPUT}      ${firstname}
Enter Lastname
    [Arguments]         ${lastname}
    Input Text          ${LAST_NAME_INPUT}      ${lastname}

Enter Phone Number
    [Arguments]         ${phone}
    Input Text          ${PHONE_NUMBER_INPUT}       ${phone}



Page Should Contain Username
    [Arguments]         ${username}
    ${locator} =     Replace String       //td[@id="username"][text()=' {usernames}']    {usernames}    ${username}
    Wait Until Element Is Visible       ${locator}
    Page Should Contain Element         ${locator}
Page Should Contain First Name
    [Arguments]         ${firstname}
    ${locator} =     Replace String    //table[@id="content"]//td[@id="firstname"][text()=" {firstnames} " ]   {firstnames}    ${firstname}
    Wait Until Element Is Visible       ${locator}
    Page Should Contain Element         ${locator}
Page Should Contain Last Name
    [Arguments]         ${lastname}
    ${locator} =     Replace String    //table[@id="content"]//td[@id="lastname"][text()=" {lastnames} "]   {lastnames}    ${lastname}
    Wait Until Element Is Visible       ${locator}
    Page Should Contain Element         ${locator}
Page Should Contain Phone Number
    [Arguments]         ${phonenumber}
    ${locator} =     Replace String    //table[@id="content"]//td[@id="phone"][text()=" {phonenumbers}"]   {phonenumbers}    ${phonenumber}
    Wait Until Element Is Visible       ${locator}
    Page Should Contain Element         ${locator}
     




 