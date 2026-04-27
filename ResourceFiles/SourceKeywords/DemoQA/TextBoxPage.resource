### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Text Box Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Click Submit Button
    [Documentation]    Click Submit Button
    [Arguments]
    Click Button    ${SUBMIT_BUTTON}

Enter Current Address
    [Documentation]    Enter Current Address
    [Arguments]    ${current_address}
    Input Text    ${CURRENT_ADDRESS_FIELD}    ${current_address}

Enter Email
    [Documentation]    Enter Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_FIELD}    ${email}

Enter Full Name
    [Documentation]    Enter Full Name
    [Arguments]    ${full_name}
    Input Text    ${FULL_NAME_FIELD}    ${full_name}

Enter Permanent Address
    [Documentation]    Enter Permanent Address
    [Arguments]    ${permanent_address}
    Input Text    ${PERMANENT_ADDRESS_FIELD}    ${permanent_address}

Populate User Form Fields
    [Documentation]    Populate User Form Fields
    [Arguments]    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    Enter Full Name    ${full_name}
    Enter Email    ${email}
    Enter Current Address    ${current_address}
    Enter Permanent Address    ${permanent_address}

Populate User Form Fields And Click Submit
    [Documentation]    Populate User Form Fields And Click Submit
    [Arguments]    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    Populate User Form Fields    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    Click Submit Button

Navigate To Text Box Page
    [Documentation]    Navigate to Text Box Page
    Go To    ${DEMO_QA_TEXT_BOX}

### VALIDATION ###
Validate Name
    [Documentation]    Validate Name
    [Arguments]    ${expected_name}
    Run Keyword If    '${expected_name}'=='${EMPTY}'    Element Should Not Be Visible    ${FULL_NAME_TEXT}
    ...    ELSE    Element Text Should Be    ${FULL_NAME_TEXT}    Name:${expected_name}

Validate Current Address
    [Documentation]    Validate Current Address
    [Arguments]    ${expected_current_address}
    Run Keyword If    '${expected_current_address}'=='${EMPTY}'    Element Should Not Be Visible    ${CURRENT_ADDRESS_TEXT}
    ...    ELSE    Element Text Should Be    ${CURRENT_ADDRESS_TEXT}    Current Address${SPACE}:${expected_current_address}

Validate Email
    [Documentation]    Validate Email
    [Arguments]    ${expected_email}
    Run Keyword If    '${expected_email}'=='${EMPTY}'    Element Should Not Be Visible    ${EMAIL_TEXT}
    ...    ELSE    Element Text Should Be    ${EMAIL_TEXT}    Email:${expected_email}

Validate User Form Outbox Fields
    [Documentation]    Validate User Form Outbox Fields
    [Arguments]    ${expected_name}    ${expected_email}    ${expected_current_address}    ${expected_permanent_address}
    Validate Name    ${expected_name}
    Validate Email    ${expected_email}
    Validate Current Address    ${expected_current_address}
    Validate Permanent Address    ${expected_permanent_address}

Validate Output Box
    [Documentation]    Validate Output Box
    [Arguments]    ${should_display}=${True}
    Run Keyword If    '${should_display}'=='${True}'    Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${OUTPUT_BOX}
    ...    ELSE    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${OUTPUT_BOX}

Validate Permanent Address
    [Documentation]    Validate Permanent Address
    [Arguments]    ${expected_permanent_address}
    Run Keyword If    '${expected_permanent_address}'=='${EMPTY}'    Element Should Not Be Visible    ${PERMANENT_ADDRESS_TEXT}
    ...    ELSE    Element Text Should Be    ${PERMANENT_ADDRESS_TEXT}    Permananet Address${SPACE}:${expected_permanent_address}