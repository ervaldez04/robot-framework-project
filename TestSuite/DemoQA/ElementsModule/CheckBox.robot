*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Check Box
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_CheckBox    Blocked
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${True}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Check Box Page

*** Test Cases ***
Validate if Home Check Box is checked
    [Documentation]    Home Check Box is checked
    [Tags]    Smoke    Regression    Positive
    [Setup]    Navigate To Check Box Page
    Expand And Set Checkbox    ${HOME_CHECKBOX}
    Validate Display Result
    Validate Display Result Message    ${PARENT_CHECKED_OUTPUT}

Validate if Home Check Box is unchecked
    [Documentation]    Home Check Box is unchecked
    [Tags]    Smoke    Regression    Negative
    [Setup]    Navigate To Check Box Page And Set Check Box    ${HOME_CHECKBOX}
    Expand And Set Checkbox    ${HOME_CHECKBOX}    ${False}
    Validate Display Result    ${False}

Validate if Desktop Check Box is checked
    [Documentation]    Desktop Check Box is checked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Check Box Page
    Expand And Set Checkbox    ${DESKTOP_CHECKBOX}
    Validate Display Result
    Validate Display Result Message    ${DESKTOP_CHECKED_OUTPUT}

Validate if Desktop Check Box is unchecked
    [Documentation]    Desktop Check Box is unchecked
    [Tags]    Regression    Negative
    [Setup]    Navigate To Check Box Page And Set Check Box    ${DESKTOP_CHECKBOX}
    Expand And Set Checkbox    ${DESKTOP_CHECKBOX}    ${False}
    Validate Display Result    ${False}

Validate if Notes Check Box is checked
    [Documentation]    Notes Check Box is checked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Check Box Page
    Expand And Set Checkbox    ${NOTES_CHECKBOX}
    Validate Display Result
    Validate Display Result Message    ${NOTES_CHECKED_OUTPUT}

Validate if Notes Check Box is unchecked
    [Documentation]    Notes Check Box is unchecked
    [Tags]    Regression    Negative
    [Setup]    Navigate To Check Box Page And Set Check Box    ${NOTES_CHECKBOX}
    Expand And Set Checkbox    ${NOTES_CHECKBOX}    ${False}
    Validate Display Result    ${False}

Validate if Commands Check Box is checked
    [Documentation]    Commands Check Box is checked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Check Box Page
    Expand And Set Checkbox    ${COMMANDS_CHECKBOX}
    Validate Display Result
    Validate Display Result Message    ${COMMANDS_CHECKED_OUTPUT}

Validate if Commands Check Box is unchecked
    [Documentation]    Commands Check Box is unchecked
    [Tags]    Regression    Negative
    [Setup]    Navigate To Check Box Page And Set Check Box    ${COMMANDS_CHECKBOX}
    Expand And Set Checkbox    ${COMMANDS_CHECKBOX}    ${False}
    Validate Display Result    ${False}

Validate if Documents Check Box is checked
    [Documentation]    Documents Check Box is checked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Check Box Page
    Expand And Set Checkbox    ${DOCUMENTS_CHECKBOX}
    Validate Display Result
    Validate Display Result Message    ${DOCUMENTS_CHECKED_OUTPUT}

Validate if Documents Check Box is unchecked
    [Documentation]    Documents Check Box is unchecked
    [Tags]    Regression    Negative
    [Setup]    Navigate To Check Box Page And Set Check Box    ${DOCUMENTS_CHECKBOX}
    Expand And Set Checkbox    ${DOCUMENTS_CHECKBOX}    ${False}
    Validate Display Result    ${False}

Validate if Workspace Check Box is checked
    [Documentation]    Workspace Check Box is checked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Check Box Page
    Expand And Set Checkbox    ${WORKSPACE_CHECKBOX}
    Validate Display Result
    Validate Display Result Message    ${WORKSPACE_CHECKED_OUTPUT}

Validate if Workspace Check Box is unchecked
    [Documentation]    Workspace Check Box is unchecked
    [Tags]    Regression    Negative
    [Setup]    Navigate To Check Box Page And Set Check Box    ${WORKSPACE_CHECKBOX}
    Expand And Set Checkbox    ${WORKSPACE_CHECKBOX}    ${False}
    Validate Display Result    ${False}

# Validate if React Check Box is checked
# Validate if React Check Box is unchecked
# Validate if Angular Check Box is checked
# Validate if Angular Check Box is unchecked
# Validate if Veu Check Box is checked
# Validate if Veu Check Box is unchecked
# Validate if Office Check Box is checked
# Validate if Office Check Box is unchecked
# Validate if Public Check Box is checked
# Validate if Public Check Box is unchecked
# Validate if Private Check Box is checked
# Validate if Private Check Box is unchecked
# Validate if Classified Check Box is checked
# Validate if Classified Check Box is unchecked
# Validate if General Check Box is checked
# Validate if General Check Box is unchecked
# Validate if Downloads Check Box is checked
# Validate if Downloads Check Box is unchecked
# Validate if Word File Check Box is checked
# Validate if Word File Check Box is unchecked
# Validate if Excel File Check Box is checked
# Validate if Excel File Check Box is unchecked