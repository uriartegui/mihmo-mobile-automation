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
Open App
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    newCommandTimeout=300

    Sleep    2s
    Tratar Permissoes Android

Close App
    Close Application

Click Login Button
    Wait Until Element Is Visible    ${ACCESS_ACCOUNT}    10s
    Click Element    ${ACCESS_ACCOUNT}

Tratar Permissoes Android
    FOR    ${i}    IN RANGE    5
        Run Keyword And Ignore Error    Click Element    ${ALLOW_PERMISSION_BUTTON}
        Run Keyword And Ignore Error    Click Element    ${ALLOW_WHILE_USING_BUTTON}
    END

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

Ask For Credentials
    ${cpf}=     Get Value From User    Digite o CPF:
    ${senha}=   Get Value From User    Digite a Senha:

    Should Not Be Empty    ${cpf}
    Should Not Be Empty    ${senha}

    Set Suite Variable    ${CPF_USER}    ${cpf}
    Set Suite Variable    ${SENHA_USER}  ${senha}



    


