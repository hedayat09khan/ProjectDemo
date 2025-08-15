*** Keywords ***
Go To Dynamic Controls And Enable Input
    Click Element    ${DYNAMIC_CONTROLS}
    Wait Until Page Contains Element    ${ENABLE_BUTTON}
    Click Button    ${ENABLE_BUTTON}
    Wait Until Element Is Enabled    ${INPUT_FIELD}

Enter Text In Enabled Input
    [Arguments]    ${text}
    Input Text    ${INPUT_FIELD}    ${text}
    Element Attribute Value Should Be    ${INPUT_FIELD}    value    ${text}

Handle JavaScript Alert
    Go To    ${BASE_URL}
    Click Element    ${JS_ALERTS}
    Wait Until Page Contains Element    ${TRIGGER_ALERT}
    Click Button    ${TRIGGER_ALERT}
    Handle Alert    action=ACCEPT    timeout=10s
    Capture Page Screenshot
    Title Should Be    The Internet
