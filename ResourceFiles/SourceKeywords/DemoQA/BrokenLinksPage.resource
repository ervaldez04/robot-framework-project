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
    IF    '${is_valid}'=='${True}'
        Wait Until Location Is    ${DEMO_QA}
        Location Should Be    ${DEMO_QA}
        Wait Until Keyword Succeeds    1 min    10 sec    Title Should Be    demosite
    ELSE IF    '${is_valid}'=='${False}'
        ${is_option1}=    Run Keyword And Return Status    Wait Until Location Is    ${INVALID_LINK_URL}
        IF    '${is_option1}'=='${True}'
            Wait Until Location Is    ${INVALID_LINK_URL1}
            Location Should Be    ${INVALID_LINK_URL1}
            Wait Until Keyword Succeeds    1 min    10 sec    Title Should Be    Application Error
        ELSE
            Wait Until Location Is    ${INVALID_LINK_URL2}
            Location Should Be    ${INVALID_LINK_URL2}
            Wait Until Keyword Succeeds    1 min    10 sec    Title Should Be    The Internet
        END
    ELSE
        Fail    Incorrect argument used!
    END