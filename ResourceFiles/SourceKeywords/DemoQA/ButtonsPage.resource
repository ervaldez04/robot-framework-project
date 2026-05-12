### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Buttons Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Select Type Of Click for Click Me
    [Documentation]    Select Type Of Click for Click Me
    [Arguments]    ${selected_button}
    Wait Until Element Is Visible    ${CLICK_ME_BUTTON}
    Run Keyword If    '${selected_button}'=='${DOUBLE_CLICK}'    Wait And Double Click    ${CLICK_ME_BUTTON}
    ...    ELSE IF    '${selected_button}'=='${RIGHT_CLICK}'    Open Context Menu    ${CLICK_ME_BUTTON}
    ...    ELSE IF    '${selected_button}'=='${CLICK}'    Wait And Click    ${CLICK_ME_BUTTON}
    ...    ELSE    Fail    Log    ${selected_button} value is invalid!

Select Type Of Click for Double Click Me
    [Documentation]    Select Type Of Click for Double Click Me
    [Arguments]    ${selected_button}
    Wait Until Element Is Visible    ${DOUBLE_CLICK_ME_BUTTON}
    Run Keyword If    '${selected_button}'=='${DOUBLE_CLICK}'    Wait And Double Click    ${DOUBLE_CLICK_ME_BUTTON}
    ...    ELSE IF    '${selected_button}'=='${RIGHT_CLICK}'    Open Context Menu    ${DOUBLE_CLICK_ME_BUTTON}
    ...    ELSE IF    '${selected_button}'=='${CLICK}'    Wait And Click    ${DOUBLE_CLICK_ME_BUTTON}
    ...    ELSE    Fail    Log    ${selected_button} value is invalid!

Select Type Of Click for Right Click Me
    [Documentation]    Select Type Of Click for Right Click Me
    [Arguments]    ${selected_button}
    Wait Until Element Is Visible    ${RIGHT_CLICK_ME_BUTTON}
    Run Keyword If    '${selected_button}'=='${DOUBLE_CLICK}'    Wait And Double Click    ${RIGHT_CLICK_ME_BUTTON}
    ...    ELSE IF    '${selected_button}'=='${RIGHT_CLICK}'    Open Context Menu    ${RIGHT_CLICK_ME_BUTTON}
    ...    ELSE IF    '${selected_button}'=='${CLICK}'    Wait And Click    ${RIGHT_CLICK_ME_BUTTON}
    ...    ELSE    Fail    Log    ${selected_button} value is invalid!

Navigate To Buttons Page
    [Documentation]    Navigate to Buttons Page
    Go To    ${DEMO_QA_BUTTONS}

### VALIDATION ###
Validate Button Message
    [Documentation]    Validate Button Message
    [Arguments]    ${selected_button}
    Run Keyword If    '${selected_button}'=='${DOUBLE_CLICK}'    Element Text Should Be    ${DOUBLE_CLICK_MESSAGE}    ${DOUBLE_CLICK_ME_MESSAGE}
    ...    ELSE IF    '${selected_button}'=='${RIGHT_CLICK}'    Element Text Should Be    ${RIGHT_CLICK_MESSAGE}    ${RIGHT_CLICK_ME_MESSAGE}
    ...    ELSE IF    '${selected_button}'=='${CLICK}'    Element Text Should Be    ${CLICK_MESSAGE}    ${CLICK_ME_MESSAGE}
    ...    ELSE    Fail    Log    ${selected_button} value is invalid!

Validate Button Message Not Displayed
    [Documentation]    Validate Button Message Not Displayed
    Element Should Not Be Visible    ${DOUBLE_CLICK_MESSAGE}
    Element Should Not Be Visible    ${RIGHT_CLICK_MESSAGE}
    Element Should Not Be Visible    ${CLICK_MESSAGE}