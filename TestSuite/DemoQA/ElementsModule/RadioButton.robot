*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Radio Button
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_RadioButton
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Radio Button Page

*** Test Cases ***
Validate no Radio Button is selected by default
    [Documentation]    Default State of all Radio Buttons
    [Tags]    Regression    Positive
    Validate State of Radio Buttons

Validate if Yes Radio Button is selected
    [Documentation]    Yes Radio Button is selected
    [Tags]    Smoke    Regression    Positive
    Select Yes Radio Button
    Validate State of Radio Buttons    yes_state=${True}
    Validate Result
    Validate Result Message    ${YES_TEXT}

Validate if Impressive Radio Button is selected
    [Documentation]    Impressive Radio Button is selected
    [Tags]    Regression    Positive
    Select Impressive Radio Button
    Validate State of Radio Buttons    impressive_state=${True}
    Validate Result
    Validate Result Message    ${IMPRESSIVE_TEXT}

Validate No Radio Button is disabled
    [Documentation]    No Radio Button is selected
    [Tags]    Regression    Positive
    ${no_state}    Select No Radio Button
    Validate No Radio Button Is Disabled    ${no_state}
    Validate Result    ${FALSE}