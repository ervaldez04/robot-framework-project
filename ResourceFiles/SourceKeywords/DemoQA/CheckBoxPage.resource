### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Check Box Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Expand And Set Checkbox
    [Documentation]    Expand And Set Checkbox
    [Arguments]    ${label}    ${check}=${True}
    ### Build dynamic locator for menu and store in global variable ###
    Set Suite Variable    ${TARGET_LOCATOR}    //span[@class="rc-tree-title" and text()="${label}"]
    ### Expand multiple collapsed menus until the target menu is visible ###
    FOR    ${index}    IN RANGE    1    5
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${TARGET_LOCATOR}
        Exit For Loop If    ${is_visible}
        Log    Attempt ${index}: Target not visible yet, expanding next collapsed menu...
        ### Get locator total count ###
        ${count}=    Get Element Count    xpath=//*[contains(@class,"rc-tree-switcher") and not(contains(@class,"rc-tree-switcher_open"))]
        Log    Found ${count} collapsed tree switchers
        FOR    ${index}    IN RANGE    ${count}
            ${index}=    Evaluate    ${index}+1
            Wait And Click    xpath=(//*[contains(@class,"rc-tree-switcher") and not(contains(@class,"rc-tree-switcher_open"))])[${index}]
            Sleep    0.5s
        END
        Wait And Click    xpath=(//*[contains(@class,"rc-tree-switcher") and not(contains(@class,"rc-tree-switcher_open"))])[1]
        Sleep    0.5s
    END
    ### Final check after loop ###
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${TARGET_LOCATOR}
    Run Keyword If    not ${visible}    Fail    Target label '${label}' not visible after 10 expansion attempts!
    ### Build dynamic locator for check box ###
    ${locator}=    Set Variable    ${TARGET_LOCATOR}/../preceding-sibling::span[contains(@class, "rc-tree-checkbox")]
    ### Check if check box is checked or unchecked ###
    ${is_checked}=    Get Element Attribute    ${locator}    aria-checked
    ### Set check box of label ###
    Run Keyword If    '${is_checked}'=='${FALSE}' and '${check}'=='${True}'    Wait And Click    ${locator}
    ...    ELSE IF    '${is_checked}'=='${TRUE}' and '${check}'=='${True}'    Log    Check Box is already checked
    ...    ELSE IF    '${is_checked}'=='${FALSE}' and '${check}'=='${False}'    Log    Check Box is already unchecked
    ...    ELSE IF    '${is_checked}'=='${TRUE}' and '${check}'=='${False}'    Wait And Click    ${locator}
    ...    ELSE    Fail    Choose either True or False!

Navigate To Check Box Page
    [Documentation]    Navigate to Check Box Page
    Go To    ${DEMO_QA_CHECK_BOX}

Navigate To Check Box Page And Set Check Box
    [Documentation]    Navigate To Check Box Page And Set Check Box
    [Arguments]    ${label}    ${check}=${True}
    Navigate To Check Box Page
    Expand And Set Checkbox    ${label}    ${check}

Set Home Check Box
    [Documentation]    Set Home Check Box
    [Arguments]    ${home_check}=${True}
    ### Check if check box is checked or unchecked ###
    ${is_checked}=    Get Element Attribute    ${HOME_CHECK_BOX}    aria-checked
    Run Keyword If    '${is_checked}'=='${FALSE}' and '${home_check}'=='${True}'    Wait And Click    ${HOME_CHECK_BOX}
    ...    ELSE IF    '${is_checked}'=='${TRUE}' and '${home_check}'=='${True}'    Log    Check Box is already checked
    ...    ELSE IF    '${is_checked}'=='${FALSE}' and '${home_check}'=='${False}'    Log    Check Box is already unchecked
    ...    ELSE IF    '${is_checked}'=='${TRUE}' and '${home_check}'=='${False}'    Wait And Click    ${HOME_CHECK_BOX}
    ...    ELSE    Fail    Choose either True or False!

### VALIDATION ###
Validate Display Result
    [Documentation]    Validate Output Box
    [Arguments]    ${should_display}=${True}
    Run Keyword If    '${should_display}'=='${True}'    Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${DISPLAY_RESULT}
    ...    ELSE    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${DISPLAY_RESULT}

Validate Display Result Message
    [Documentation]    Validate Display Result
    [Arguments]    ${expected_output}
    ${actual}=    Get Text    ${DISPLAY_RESULT}
    ${actual_normalized}=    Replace String    ${actual}    \n    ${SPACE}
    Should Be Equal    ${actual_normalized}    You have selected${SPACE}:${SPACE}${expected_output}
