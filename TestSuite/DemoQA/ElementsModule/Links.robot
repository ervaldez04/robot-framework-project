*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Links
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_Link
Suite Setup       Open Browser With Options    ${DEMO_QA}    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close All Browsers

*** Test Cases ***
Validate when Home link is clicked
    [Documentation]    Home link is clicked
    [Tags]    Smoke    Regression    Positive
    [Setup]    Navigate To Links Page And Set Main Tab
    Click Link And Switch To New Tab
    Validate Redirected To New Tab
    [Teardown]    Close Opened Tab

Validate when Dynamic Home link is clicked
    [Documentation]    Dynamic Home link is clicked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Links Page And Set Main Tab
    Click Link And Switch To New Tab    ${DYNAMIC_HOME}
    Validate Redirected To New Tab
    [Teardown]    Close Opened Tab

Validate when Created link is clicked
    [Documentation]    Created link is clicked
    [Tags]    Smoke    Regression    Positive
    [Setup]    Navigate To Links Page
    Click Link To Send API Call    ${CREATED}
    Validate Link Response Message    ${CREATED}

Validate when No Content link is clicked
    [Documentation]    No Content link is clicked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Links Page
    Click Link To Send API Call    ${NO_CONTENT}
    Validate Link Response Message    ${NO_CONTENT}

Validate when Moved link is clicked
    [Documentation]    Moved link is clicked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Links Page
    Click Link To Send API Call    ${MOVED}
    Validate Link Response Message    ${MOVED}

Validate when Bad Request link is clicked
    [Documentation]    Bad Request link is clicked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Links Page
    Click Link To Send API Call    ${BAD_REQUEST}
    Validate Link Response Message    ${BAD_REQUEST}

Validate when Unauthorized link is clicked
    [Documentation]    Unauthorized link is clicked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Links Page
    Click Link To Send API Call    ${UNAUTHORIZED}
    Validate Link Response Message    ${UNAUTHORIZED}

Validate when Forbidden link is clicked
    [Documentation]    Forbidden link is clicked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Links Page
    Click Link To Send API Call    ${FORBIDDEN}
    Validate Link Response Message    ${FORBIDDEN}

Validate when Not Found link is clicked
    [Documentation]    Not Found link is clicked
    [Tags]    Regression    Positive
    [Setup]    Navigate To Links Page
    Click Link To Send API Call    ${NOT_FOUND}
    Validate Link Response Message    ${NOT_FOUND}