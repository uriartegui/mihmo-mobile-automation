*** Settings ***
Library    AppiumLibrary
Library    Dialogs

*** Variables ***
${REMOTE_URL}        http://localhost:4723
${PLATFORM_NAME}     Android
${DEVICE_NAME}       4d73cef8
${AUTOMATION_NAME}   UiAutomator2
${APP_PACKAGE}       br.com.mihmo.saude
${APP_ACTIVITY}      br.com.mihmo.saude.MainActivity

${ACCESS_ACCOUNT}      accessibility_id=Acessar minha conta

${CPF_LOGIN}     android=new UiSelector().className("android.widget.EditText").instance(0)
${PASS_LOGIN}    android=new UiSelector().className("android.widget.EditText").instance(1)
${CONFIRM_LOGIN}    accessibility_id=Confirmar
${ENTER_LOGIN}    accessibility_id=Entrar

${CPF_USER}
${SENHA_USER}

${ALLOW_PERMISSION_BUTTON}    id=com.android.packageinstaller:id/permission_allow_button
${ALLOW_WHILE_USING_BUTTON}   id=com.android.permissioncontroller:id/permission_allow_foreground_only_button

*** Keywords ***
##################################################
Open App Clean
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=false

    Sleep    2s
    Tratar Permissoes Android
##################################################
Open App With Session
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true
    ...    newCommandTimeout=300

    Wait Until Page Contains Element
    ...    xpath=//*[contains(@content-desc,"Bem-vindo de volta")]
    ...    20s

    Click Element    accessibility_id=Entrar

    Wait Until Element Is Visible
    ...    xpath=//*[contains(@content-desc,"Olá")]
    ...    20s
##################################################
Close App
    Close Application
##################################################
Close App Safely
    Run Keyword And Ignore Error    Terminate Application    ${APP_PACKAGE}
    Run Keyword And Ignore Error    Close Application
##################################################
Click Login Button
    Wait Until Element Is Visible    ${ACCESS_ACCOUNT}    10s
    Click Element    ${ACCESS_ACCOUNT}
##################################################
Tratar Permissoes Android
    FOR    ${i}    IN RANGE    5
        Run Keyword And Ignore Error    Click Element    ${ALLOW_PERMISSION_BUTTON}
        Run Keyword And Ignore Error    Click Element    ${ALLOW_WHILE_USING_BUTTON}
    END
##################################################
Login With Credentials
    Wait Until Element Is Visible    ${CPF_LOGIN}    10s
    Click Element    ${CPF_LOGIN}
    Clear Text    ${CPF_LOGIN}
    Input Text    ${CPF_LOGIN}    ${CPF_USER}
    Hide Keyboard

    ${cpf_digitado}=    Get Text    ${CPF_LOGIN}

    Wait Until Element Is Visible    ${PASS_LOGIN}    10s
    Click Element    ${PASS_LOGIN}
    Clear Text    ${PASS_LOGIN}
    Input Text    ${PASS_LOGIN}    ${SENHA_USER}
    Hide Keyboard

    ${senha_digitada}=    Get Text    ${PASS_LOGIN}

    Wait Until Element Is Visible    ${CONFIRM_LOGIN}    10s
    Click Element    ${CONFIRM_LOGIN}

    Wait Until Element Is Visible    ${ENTER_LOGIN}    10s
    Click Element    ${ENTER_LOGIN}
##################################################
Handle Daily Feeling Screen
    ${sentimento}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    accessibility_id=Como você está se sentindo hoje?
    ...    5s

    IF    ${sentimento}
        Wait Until Element Is Visible    accessibility_id=Bem    5s
        Click Element    accessibility_id=Bem

        Wait Until Element Is Visible    accessibility_id=Confirmar    5s
        Click Element    accessibility_id=Confirmar
    END

    ${tutorial}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    accessibility_id=Iniciar
    ...    5s

    IF    ${tutorial}
        Press Keycode    4
    END


    Wait Until Element Is Visible
    ...    xpath=//android.widget.ImageView[contains(@content-desc,"Olá")]
    ...    15s
##################################################
Ask For Credentials
    ${cpf}=     Get Value From User    Digite o CPF:
    ${senha}=   Get Value From User    Digite a Senha:

    Should Not Be Empty    ${cpf}
    Should Not Be Empty    ${senha}

    Set Suite Variable    ${CPF_USER}    ${cpf}
    Set Suite Variable    ${SENHA_USER}  ${senha}
##################################################
First Access Button

    Wait Until Element Is Visible
    ...    xpath=//android.widget.Button[contains(@content-desc,"Primeiro acesso")]
    ...    10s

    Click Element
    ...    xpath=//android.widget.Button[contains(@content-desc,"Primeiro acesso")]

    Wait Until Element Is Visible
    ...    accessibility_id=Próximo
    ...    10s

    ${cpf_field}=    Set Variable    android=new UiSelector().className("android.widget.EditText").instance(0)

    Wait Until Element Is Visible    ${cpf_field}    10s
    Click Element    ${cpf_field}
    Clear Text       ${cpf_field}
    Input Text       ${cpf_field}    00000011100

    Press Keycode    4

    ${cpf_value}=    Get Text    ${cpf_field}
    Should Not Be Empty    ${cpf_value}

    Wait Until Element Is Visible
    ...    xpath=//*[contains(@content-desc,"concordo")]
    ...    5s

    Click Element
    ...    xpath=//*[contains(@content-desc,"concordo")]

    Click Element    accessibility_id=Próximo

    Wait Until Element Is Visible
    ...    xpath=//*[contains(@content-desc,"CPF incorreto")]
    ...    10s
##################################################


