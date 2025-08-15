*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}         https://the-internet.herokuapp.com/
${DYNAMIC_CONTROLS} xpath=//a[text()='Dynamic Controls']
${ENABLE_BUTTON}    xpath=//button[text()='Enable']
${INPUT_FIELD}      xpath=//form[@id='input-example']//input
${JS_ALERTS}        xpath=//a[text()='JavaScript Alerts']
${TRIGGER_ALERT}    xpath=//button[text()='Click for JS Alert']
${SUCCESS_MSG}      xpath=//p[@id='result']

*** Test Cases ***
Validate Dynamic Controls And JS Alert
    [Documentation]    Validate enabling input, entering text, and handling JS alert on HerokuApp.
    Open Browser    ${BASE_URL}    Chrome
    Maximize Browser Window

    # Step 2: Go to Dynamic Controls
    Click Element    ${DYNAMIC_CONTROLS}
    Wait Until Page Contains Element    ${ENABLE_BUTTON}

    # Step 3: Enable input field
    Click Button    ${ENABLE_BUTTON}
    Wait Until Element Is Enabled    ${INPUT_FIELD}

    # Step 4: Enter text
    Input Text    ${INPUT_FIELD}    Hello World
    Element Attribute Value Should Be    ${INPUT_FIELD}    value    Hello World

    # Step 5: Handle JavaScript Alert
    Go To    ${BASE_URL}
    Click Element    ${JS_ALERTS}
    Wait Until Page Contains Element    ${TRIGGER_ALERT}
    Click Button    ${TRIGGER_ALERT}
    Alert Should Be Present
    Handle Alert    action=ACCEPT

    # Assert success message (if any)
    # (HerokuApp JS Alert just shows a browser alert, no success message on page)
    # Optionally, check page still loaded
    Title Should Be    The Internet

    Close Browser
