### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Broken Links Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Click Invalid Link
    [Documentation]    Click Invalid Link
    Wait And Click    ${INVALID_LINK}

Click Valid Link
    [Documentation]    Click Valid Link
    Wait And Click    ${VALID_LINK}

Navigate To Broken Links Page
    [Documentation]    Navigate to Broken Links Page
    Go To    ${DEMO_QA_BROKEN_LINKS}

### VALIDATION ###
Validate Redirected To Certain Page
    [Documentation]    Validate Redirected To Certain Page
    [Arguments]    ${is_valid}=${True}
    Run Keyword If    '${is_valid}'=='${True}'    Location Should Be    ${DEMO_QA}
    ...    ELSE IF    '${is_valid}'=='${False}'    Location Should Be    ${INVALID_LINK_URL}
    ...    ELSE    Fail    Incorrecrt argument used!
    Run Keyword If    '${is_valid}'=='${True}'    Title Should Be    demosite
    ...    ELSE IF    '${is_valid}'=='${False}'    Title Should Be    The Internet
    ...    ELSE    Fail    Incorrecrt argument used!