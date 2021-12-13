*** Settings ***
Documentation    Tests to verify that account registering succeed
Library    SeleniumLibrary      implicit_wait=3
Library     FakerLibrary
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shoplive}         https://creator-rc.shoplive.dev/customer/register
${input_user}           name=email
${input_pass}           name=password
${input_fname}          name=firstName
${input_tel}            name=tel
${btn_register}     //*[@id="app"]/span/div/div/div[1]/div/div/div[6]/button
${btn_register2}     //*[@id="app"]/span/div/div/div[1]/div/div/div[4]/button
${txt_not_me}       //*[@id="app"]/span/div/div/div[1]/div/div/p
${txt_verify}       //*[@id="app"]/span/div/div/div[1]/div/div/header
${register_verify}      //*[@id="app"]/span/div/div/nav/div/div/div[1]/div[1]/span[1]
${duplicate_email}      //*[@id="app"]/span/div/div/div[1]/div/div/p

*** Keywords ***
Verify Register page
    [Arguments]     ${txt_verify}      
    Element Should Be Visible    ${txt_verify}
Input Email
    [Arguments]      ${xpath_email}      ${email}       ${button}
    Element Should Be Visible    ${xpath_email}
    Input Text       ${xpath_email}       ${email}
    Click Element        ${button}   
Input Name
    [Arguments]      ${xpath_fname}      ${fname}
    Element Should Be Visible    ${xpath_fname}
    Input Text       ${xpath_fname}       ${fname}
Input Telephone
    [Arguments]      ${xpath_tel}      ${tel}
    Element Should Be Visible    ${xpath_tel}
    Input Text       ${xpath_tel}       ${tel}
Input Password
    [Arguments]      ${xpath_pass}      ${password}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_pass}       ${password}
    
Click Button Login
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element        ${btn}
Verify Login Fail
   [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}
# Verify Register Success
#    [Arguments]        ${xpath}
#    Element Text Should Be       ${xpath}        ${}

*** Test Cases ***
Register shoplive - fail
    [tags]    fail

    ${email_success}     FakerLibrary.email
    ${name_success}     FakerLibrary.Name
    ${tel_success}      FakerLibrary.Numerify  +%%-%%%%-%%%%
    ${password_success}     FakerLibrary.password

    Open Browser    about:blank    chrome
    Go To       ${url_shoplive}
    Verify Register page        ${txt_verify}       
    Input Email     ${input_user}      ${email_success}     ${btn_register}

    Input Name      ${input_fname}      ${name_success}
    Input Telephone     ${input_tel}        ${tel_success}
    Input Password      ${input_pass}       ${password_success}
    Click Button Login      ${btn_register2}
    Wait Until Element Contains      ${register_verify}      ${name_success}   
Register shoplive - success
    [tags]    success

    ${email_success}     FakerLibrary.email
    ${name_success}     FakerLibrary.Name
    ${tel_success}      FakerLibrary.Numerify  +%%-%%%%-%%%%
    ${password_success}     FakerLibrary.password

    Open Browser    about:blank    chrome
    Go To       ${url_shoplive}
    Verify Register page        ${txt_verify}       
    Input Email     ${input_user}      ${email_success}     ${btn_register}

    Input Name      ${input_fname}      ${name_success}
    Input Telephone     ${input_tel}        ${tel_success}
    Input Password      ${input_pass}       ${password_success}
    Click Button Login      ${btn_register2}
    Wait Until Element Contains      ${register_verify}      ${name_success}     