### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Links Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Click Bad Request
    [Documentation]    Click Bad Request
    Wait And Click    ${BAD_REQUEST_LINK}

Click Created
    [Documentation]    Click Created
    Wait And Click    ${CREATED_LINK}

Click Dynamic Home
    [Documentation]    Click Dynamic Home
    Wait And Click    ${DYNAMIC_HOME_LINK}

Click Forbidden
    [Documentation]    Click Forbidden
    Wait And Click    ${FORBIDDEN_LINK}

Click Home
    [Documentation]    Click Home
    Wait And Click    ${HOME_LINK}

Click Link To Send API Call
    [Documentation]    Click Link To Send API Call
    [Arguments]    ${api_call}
    IF    '${api_call}'=='${CREATED}'
        Wait Until Element Is Visible    ${CREATED_LINK}
        Click Created
    ELSE IF    '${api_call}'=='${NO_CONTENT}'
        Wait Until Element Is Visible    ${NO_CONTENT_LINK}
        Click No Content
    ELSE IF    '${api_call}'=='${MOVED}'
        Wait Until Element Is Visible    ${MOVED_LINK}
        Click Moved
    ELSE IF    '${api_call}'=='${BAD_REQUEST}'
        Wait Until Element Is Visible    ${BAD_REQUEST_LINK}
        Click Bad Request
    ELSE IF    '${api_call}'=='${UNAUTHORIZED}'
        Wait Until Element Is Visible    ${UNAUTHORIZED_LINK}
        Click Unauthorized
    ELSE IF    '${api_call}'=='${FORBIDDEN}'
        Wait Until Element Is Visible    ${FORBIDDEN_LINK}
        Click Forbidden
    ELSE IF    '${api_call}'=='${NOT_FOUND}'
        Wait Until Element Is Visible    ${NOT_FOUND_LINK}
        Click Not Found
    ELSE
        Fail    Log    Invalid link!
    END

Click Link And Switch To New Tab
    [Documentation]    Click Link And Switch To New Tab
    [Arguments]    ${link}=${HOME}
    @{handles_before}=    Get Window Handles
    Run Keyword If    '${link}'=='${HOME}'    CLick Home
    ...    ELSE IF    '${link}'=='${DYNAMIC_HOME}'    Click Dynamic Home
    ...    ELSE    Fail    Log    Invalid link set!
    Wait Until Keyword Succeeds    5s    500ms    New Tab Should Open    @{handles_before}

Click Moved
    [Documentation]    Click Moved
    Wait And Click    ${MOVED_LINK}

Click No Content
    [Documentation]    Click No Content
    Wait And Click    ${NO_CONTENT_LINK}

Click Not Found
    [Documentation]    Click Not Found
    Wait And Click    ${NOT_FOUND_LINK}

Click Unauthorized
    [Documentation]    Click Unauthorized
    Wait And Click    ${UNAUTHORIZED_LINK}

Close Opened Tab
    [Documentation]    Close Opened Tab
    ${main_tab}=    Get Window Handles
    Run Keyword And Ignore Error    Switch Window   NEW
    Close Window
    Switch Window   ${main_tab}[0]

Navigate To Links Page
    [Documentation]    Navigate to Links Page
    Go To    ${DEMO_QA_LINKS}

Navigate To Links Page And Set Main Tab
    [Documentation]    Navigate To Links Page And Set Main Tab
    Navigate To Links Page
    ${main_tab}=    Get Window Handles
    Set Global Variable    ${main_tab}

### VALIDATION ###
Validate Link Response Message
    [Documentation]    Validate Link Response Message
    [Arguments]    ${clicked_link}
    Wait Until Element Is Visible    ${LINK_RESPONSE}
    IF    '${clicked_link}'=='${CREATED}'
        ${status_code}=    Set Variable    201
        ${status_text}=    Set Variable    Created
    ELSE IF    '${clicked_link}'=='${NO_CONTENT}'
        ${status_code}=    Set Variable    204
        ${status_text}=    Set Variable    No Content
    ELSE IF    '${clicked_link}'=='${MOVED}'
        ${status_code}=    Set Variable    301
        ${status_text}=    Set Variable    Moved Permanently
    ELSE IF    '${clicked_link}'=='${BAD_REQUEST}'
        ${status_code}=    Set Variable    400
        ${status_text}=    Set Variable    Bad Request
    ELSE IF    '${clicked_link}'=='${UNAUTHORIZED}'
        ${status_code}=    Set Variable    401
        ${status_text}=    Set Variable    Unauthorized
    ELSE IF    '${clicked_link}'=='${FORBIDDEN}'
        ${status_code}=    Set Variable    403
        ${status_text}=    Set Variable    Forbidden
    ELSE IF    '${clicked_link}'=='${NOT_FOUND}'
        ${status_code}=    Set Variable    404
        ${status_text}=    Set Variable    Not Found
    ELSE
        Fail    Log    Invalid link!
    END
    Element Text Should Be    ${LINK_RESPONSE}
    ...    ${LINK_STATUS_CODE} ${status_code} ${LINK_STATUS_TEXT} ${status_text}

Validate Redirected To New Tab
    [Documentation]    Validate Redirected To New Tab
    Location Should Be    ${DEMO_QA}
    Title Should Be    demosite