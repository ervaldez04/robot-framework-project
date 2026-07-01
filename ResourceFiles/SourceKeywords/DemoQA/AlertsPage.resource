### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Alerts Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Click Alert
    [Documentation]    Click Alert
    Wait And Click    ${ALERT_BUTTON}

Click Confirm
    [Documentation]    Click Confirm
    Wait And Click    ${CONFIRM_BUTTON}

Click Prompt
    [Documentation]    Click Prompt
    Wait And Click    ${PROMPT_BUTTON}

Click Timer
    [Documentation]    Click Timer
    Wait And Click    ${TIMER_ALERT_BUTTON}

Handle Alert Message
    [Documentation]    Handle Alert Message
    [Arguments]    ${action}
    Handle Alert    ${action}

Handle Prompt Alert
    [Documentation]    Handle Prompt Alert
    [Arguments]    ${text}=${EMPTY}    ${action}=${ALERT_ACCEPT}
    IF    '${text}'!='${EMPTY}'
        Input Text Into Alert    ${text}
    ELSE
        Handle Alert    ${action}
    END

Navigate To Alerts Page
    [Documentation]    Navigate To Alerts Page
    Go To    ${DEMO_QA_ALERTS}

### VALIDATION ###
Validate Alert Displayed
    [Documentation]    Validate Alert Displayed
    [Arguments]    ${message}
    Wait Until Keyword Succeeds    5 times    2 seconds    Alert Should Be Present    ${message}

Validate Confirm Box Text
    [Documentation]    Validate Confirm Box Text
    [Arguments]    ${expected_text}
    Element Text Should Be    ${CONFIRM_RESULT}    ${expected_text}

Validate Prompt Box Text
    [Documentation]    Validate Prompt Box Text
    [Arguments]    ${expected_text}=${EMPTY}
    IF    '${expected_text}'=='${EMPTY}'
        Element Should Not Be Visible    ${PROMPT_RESULT}
    ELSE
        Element Text Should Be    ${PROMPT_RESULT}    ${expected_text}
    END