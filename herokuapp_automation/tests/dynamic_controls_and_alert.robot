*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Variables ***
${BASE_URL}    https://the-internet.herokuapp.com/
${DYNAMIC_CONTROLS}    xpath=//a[text()='Dynamic Controls']
${ENABLE_BUTTON}    xpath=//button[text()='Enable']
${INPUT_FIELD}    xpath=//form[@id='input-example']//input
${JS_ALERTS}    xpath=//a[text()='JavaScript Alerts']
${TRIGGER_ALERT}    xpath=//button[text()='Click for JS Alert']

*** Test Cases ***
Dynamic Controls And JS Alert End-to-End
    [Documentation]    Modular, robust test for enabling input, entering text, and handling JS alert.
    Open Browser    ${BASE_URL}    Chrome
    Maximize Browser Window

    Go To Dynamic Controls And Enable Input
    Enter Text In Enabled Input    Hello Sheila
    Handle JavaScript Alert

    [Teardown]    Close Browser
