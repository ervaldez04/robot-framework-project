*** Settings ***
Documentation     Test Case for Demo QA - Alerts, Frames & Windows Module - Alerts
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_AlertsFramesWindows_Alerts
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}    disable_password_manager=${False}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Alerts Page

*** Test Cases ***
Validate if Alert is clicked
    [Documentation]    Alert button is clicked
    [Tags]    Smoke    Regression    Positive
    Click Alert
    Validate Alert Displayed    ${ALERT_MESSAGE}

Validate if Timer Alert is clicked
    [Documentation]    Timer Alert button is clicked
    [Tags]    Smoke    Regression    Positive
    Click Timer
    Validate Alert Displayed    ${TIMER_ALERT_MESSAGE}

Validate if Confirm Box is clicked
    [Documentation]    Confirm Box button is clicked
    [Tags]    Smoke    Regression    Positive
    Click Confirm
    Validate Alert Displayed    ${CONFIRM_ALERT_MESSAGE}
    Validate Confirm Box Text    ${CONFIRM_YES_MESSAGE}

Validate if Prompt Box is clicked
    [Documentation]    Prompt Box button is clicked
    [Tags]    Smoke    Regression    Positive
    Click Prompt
    Handle Prompt Alert    ${ALERT_NAME}
    Validate Prompt Box Text    ${PROMPT_MESSAGE}

Validate if Cancel button is clicked in Confirm Box
    [Documentation]    Cancel button is clicked in Confirm Box
    [Tags]    Regression    Negative
    Click Confirm
    Handle Alert Message    ${ALERT_DISMISS}
    Validate Confirm Box Text    ${CONFIRM_CANCEL_MESSAGE}

Validate if Cancel button is clicked in Prompt Box
    [Documentation]    Cancel button is clicked in Prompt Box
    [Tags]    Regression    Negative
    Click Prompt
    Handle Alert Message    ${ALERT_DISMISS}
    Validate Prompt Box Text

Validate if no message is entered in Prompt Box
    [Documentation]    No message is entered in Prompt Box
    [Tags]    Regression    Negative
    Click Prompt
    Handle Prompt Alert
    Validate Prompt Box Text