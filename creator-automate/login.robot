*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shoplive}        https://creator-rc.shoplive.dev/
${title_shoplive}      ShopLIVE Creator
${to_login_button}     //*[@id="app"]/span/div/div/nav/div/div/div[1]/div[1]/span
${input_user}          //*[@id="app"]/span/div/div/div[1]/div/div/div[3]/div[1]/div/div[2]/input
${input_pass}          //*[@id="app"]/span/div/div/div[1]/div/div/div[3]/div[2]/div/div[2]/input
${btn_login}           //*[@id="app"]/span/div/div/div[1]/div/div/div[4]/button
${txt_not_me}          //*[@id="app"]/span/div/div/div[1]/div/div/p
${txt_message}         //*[@id="app"]/span/div/div/nav/div/div/div[1]/div[1]/span[1]
${username_fail}            xxxxx@xxxxx.com
${password_fail}            12345678
${username_success}            demo@shoplive.dev
${password_success}            Password

*** Keywords ***
Verify Shoplive page
    [Arguments]     ${title}     ${button} 
    Title Should Be     ${title}
    Click Element        ${button}   
Input Username and Password
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}      ${password} 
    Element Should Be Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}
Click Button Login
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element        ${btn}
Verify Login Fail
   [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}
Verify Login Success
   [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}

*** Test Cases ***
Login facebook - Fail
    [tags]    fail
    Open Browser    about:blank    chrome
    Go To           ${url_shoplive}
    Verify Shoplive page        ${title_shoplive}       ${to_login_button}
    Input Username and Password    ${input_user}     ${input_pass}       ${username_fail}      ${password_fail}
    Click Button Login          ${btn_login}
    Verify Login Fail           ${txt_not_me}
Login facebook - success
    [tags]    success
    Open Browser    about:blank    chrome
    Go To           ${url_shoplive}
    Verify Shoplive page        ${title_shoplive}       ${to_login_button}
    Input Username and Password    ${input_user}     ${input_pass}       ${username_success}      ${password_success}
    Click Button Login          ${btn_login}
    Verify Login Success           ${txt_message}