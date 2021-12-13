*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Login shoplive - Fail
    [tags]    fail
    Open Browser    about:blank    chrome
    Go To           ${url_shoplive}
    Verify Shoplive page        ${title_shoplive}       ${to_login_button}
    Input Username and Password    ${input_user}     ${input_pass}       ${username_fail}      ${password_fail}
    Click Button Login          ${btn_login}
    Verify Login Fail           ${txt_not_me}
    [Teardown]    Close Browser
