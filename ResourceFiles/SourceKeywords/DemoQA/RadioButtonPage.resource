### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Radio Button Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Navigate To Radio Button Page
    [Documentation]    Navigate to Radio Button Page
    Go To    ${DEMO_QA_RADIO_BUTTON}

Select Impressive Radio Button
    [Documentation]    Select Impressive Radio Button
    ...    There is no "value" attribute so 'Select Radio Button' cannot be used
    ...    HTML: <input id="impressiveRadio" class="form-check-input" type="radio" name="like">
    Wait And Click    ${IMPRESSIVE_RADIO_BUTTON}

Select No Radio Button
    [Documentation]    Select No Radio Button
    ...    There is no "value" attribute so 'Select Radio Button' cannot be used
    ...    HTML: <input id="yesRadio" class="form-check-input" type="radio" name="like">
    ...    Radio Button is disabled
    ${is_clickable}=    Run Keyword And Return Status    Wait And Click    ${NO_RADIO_BUTTON}
    ${is_clickable}=    Convert To String    ${is_clickable}
    RETURN    ${is_clickable}

Select Yes Radio Button
    [Documentation]    Select Yes Radio Button
    ...    There is no "value" attribute so 'Select Radio Button' cannot be used
    ...    HTML: <input id="noRadio" disabled="" class="form-check-input disabled" type="radio" name="like">
    Wait And Click    ${YES_RADIO_BUTTON}

### VALIDATION ###
Validate No Radio Button Is Disabled
    [Documentation]    Validate No Radio Button Is Disabled
    [Arguments]    ${is_clickable}
    Should Be Equal    ${is_clickable}    False
    Element Should Be Disabled    ${NO_RADIO_BUTTON}

Validate Result
    [Documentation]    Validate Result
    [Arguments]    ${should_display}=${True}
    Run Keyword If    '${should_display}'=='${True}'    Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${OUTPUT_MESSAGE}
    ...    ELSE    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${OUTPUT_MESSAGE}

Validate Result Message
    [Documentation]    Validate Result Message
    [Arguments]    ${selected_radio_button}
    Element Text Should Be    ${OUTPUT_MESSAGE}    You have selected${SPACE}${selected_radio_button}

Validate State of Radio Buttons
    [Documentation]    Validate State of Radio Buttons
    [Arguments]    ${yes_state}=${None}    ${impressive_state}=${None}    ${no_state}=${None}
    ${is_yes_checked}=    Get Element Attribute    ${YES_RADIO_BUTTON}    checked
    IF    '${yes_state}'=='${None}'
        Log    Yes is not selected
    ELSE
        ${is_yes_checked}=    Convert To Boolean    ${is_yes_checked}
    END
    Run Keyword And Continue On Failure    Should Be Equal    ${is_yes_checked}    ${yes_state}
    ${is_impressive_checked}=    Get Element Attribute    ${IMPRESSIVE_RADIO_BUTTON}    checked
    IF    '${impressive_state}'=='${None}'
        Log    Impressive is not selected
    ELSE
        ${is_impressive_checked}=    Convert To Boolean    ${is_impressive_checked}
    END
    Run Keyword And Continue On Failure    Should Be Equal    ${is_impressive_checked}    ${impressive_state}
    ${is_no_checked}=    Get Element Attribute    ${NO_RADIO_BUTTON}    checked
    IF    '${no_state}'=='${None}'
        Log    No is not selected
    ELSE
        ${is_no_checked}=    Convert To Boolean    ${is_no_checked}
    END
    Run Keyword And Continue On Failure    Should Be Equal    ${is_no_checked}    ${no_state}