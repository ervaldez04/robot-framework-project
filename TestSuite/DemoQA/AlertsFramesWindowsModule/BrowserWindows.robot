*** Settings ***
Documentation     Test Case for Demo QA - Alerts, Frames & Windows Module - Browser Windows
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_AlertsFramesWindows_BrowserWindows
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}    disable_password_manager=${False}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Browser Windows Page

*** Test Cases ***
Validate if New Tab button is clicked
    [Documentation]    New Tab button is clicked
    [Tags]    Smoke    Regression    Positive
    ${initial_window}=    Get Initial Window Handle
    Click New Tab
    Validate New Tab Or Window Is Opened    ${initial_window}
    Validate New Tab Or Window URL    ${DEMO_QA_SAMPLE}
    [Teardown]    Navigate To Default Browser Windows Page    ${initial_window}

Validate if New Window button is clicked
    [Documentation]    New Window button is clicked
    [Tags]    Smoke    Regression    Positive
    ${initial_window}=    Get Initial Window Handle
    Click New Window
    Validate New Tab Or Window Is Opened    ${initial_window}
    Validate New Tab Or Window URL    ${DEMO_QA_SAMPLE}
    [Teardown]    Navigate To Default Browser Windows Page    ${initial_window}

Validate if New Window Message button is clicked
    [Documentation]    New Window Message button is clicked
    [Tags]    Regression    Positive
    ${initial_window}=    Get Initial Window Handle
    Click New Window Message
    Validate New Tab Or Window Is Opened    ${initial_window}
    Validate New Window Message
    [Teardown]    Navigate To Default Browser Windows Page    ${initial_window}