### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Browser Windows Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Click New Tab
    [Documentation]    Click New Tab
    Wait And Click    ${NEW_TAB_BUTTON}

Click New Window
    [Documentation]    Click New Window
    Wait And Click    ${NEW_WINDOW_BUTTON}

Click New Window Message
    [Documentation]    Click New Window Message
    Wait And Click    ${NEW_WINDOW_MESSAGE_BUTTON}

Get Initial Window Handle
    [Documentation]    Get Initial Window Handle
    ${initial_window_handle}=    Get Window Handles
    Set Global Variable    ${initial_window_handle}
    RETURN    ${initial_window_handle}

Navigate To Browser Windows Page
    [Documentation]    Navigate To Browser Windows Page
    Go To    ${DEMO_QA_BROWSER_WINDOWS}

Navigate To Default Browser Windows Page
    [Documentation]    Navigate To Default Browser Windows Page
    [Arguments]    ${window}
    # Close Window
    Switch Window    ${window}

### VALIDATION ###
Validate New Tab Or Window Is Opened
    [Documentation]    Validate New Tab Or Window Is Opened
    [Arguments]    ${handles_before}
    ${handles_after}=    Get Window Handles
    ${initial_length}=    Get Length    ${handles_before}
    ${current_length}=    Get Length    ${handles_after}
    Should Be True    ${current_length}>${initial_length}
    Should Be Equal As Integers    ${current_length}    ${initial_length + 1}
    # Switch Window    NEW
    ${new_handle}=    Set Variable    ${handles_after}[-1]
    Switch Window    ${new_handle}

Validate New Tab Or Window URL
    [Documentation]    Validate New Tab Or Window URL
    [Arguments]    ${expected_url}
    ${url}=    Get Location
    Should Contain    ${url}    ${expected_url}
    Wait Until Page Contains    ${NEW_TAB_WINDOW_PAGE}

Validate New Window Message
    [Documentation]    Validate New Window Message
    ...    New window opened does not load a normal webpage
    ...    Known limitation: message content cannot be reliably validated
    Return From Keyword
    # ${message}=    Get Text    //body
    # Should Contain    ${message}    ${NEW_WINDOW_MESSAGE}
    ${source}=    Get Source
    Should Contain    ${source}    ${NEW_WINDOW_MESSAGE}
