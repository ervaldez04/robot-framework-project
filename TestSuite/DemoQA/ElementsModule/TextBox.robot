*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Text Box
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_TextBox
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Text Box Page

*** Test Cases ***
Validate if all fields are populated
    [Documentation]    All fields are populated
    [Tags]    Smoke    Regression    Positive
    Populate User Form Fields And Click Submit    @{ALL_FIELDS_POPULATED}
    Validate Output Box
    Validate User Form Outbox Fields    @{ALL_FIELDS_POPULATED}

Validate if all fields are blank
    [Documentation]    All fields are empty
    Populate User Form Fields And Click Submit    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Validate Output Box    ${False}

Validate if Full Name is blank
    [Documentation]    Full Name is empty
    Populate User Form Fields And Click Submit    ${EMPTY}    ${EMAIL}    ${CURRENT_ADDRESS}    ${PERMANENT_ADDRESS}
    Validate Output Box
    Validate User Form Outbox Fields    ${EMPTY}    ${EMAIL}    ${CURRENT_ADDRESS}    ${PERMANENT_ADDRESS}

Validate if Email is blank
    [Documentation]    Email is empty
    Populate User Form Fields And Click Submit    ${NAME}    ${EMPTY}    ${CURRENT_ADDRESS}    ${PERMANENT_ADDRESS}
    Validate Output Box
    Validate User Form Outbox Fields    ${NAME}    ${EMPTY}    ${CURRENT_ADDRESS}    ${PERMANENT_ADDRESS}

Validate if Current Address is blank
    [Documentation]    Current Address is empty
    Populate User Form Fields And Click Submit    ${NAME}    ${EMAIL}    ${EMPTY}    ${PERMANENT_ADDRESS}
    Validate Output Box
    Validate User Form Outbox Fields    ${NAME}    ${EMAIL}    ${EMPTY}    ${PERMANENT_ADDRESS}

Validate if Permanent Address is blank
    [Documentation]    Permanent Address is empty
    Populate User Form Fields And Click Submit    ${NAME}    ${EMAIL}    ${CURRENT_ADDRESS}    ${EMPTY}
    Validate Output Box
    Validate User Form Outbox Fields    ${NAME}    ${EMAIL}    ${CURRENT_ADDRESS}    ${EMPTY}

Validate if only Full Name is populated
    [Documentation]    Full Name is only populated
    Populate User Form Fields And Click Submit    ${NAME}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Validate Output Box
    Validate User Form Outbox Fields    ${NAME}    ${EMPTY}    ${EMPTY}    ${EMPTY}

Validate if only Email is populated
    [Documentation]    Email is only populated
    Populate User Form Fields And Click Submit    ${EMPTY}    ${EMAIL}    ${EMPTY}    ${EMPTY}
    Validate Output Box
    Validate User Form Outbox Fields    ${EMPTY}    ${EMAIL}    ${EMPTY}    ${EMPTY}

Validate if only Current Address is populated
    [Documentation]    Current Address is only populated
    Populate User Form Fields And Click Submit    ${EMPTY}    ${EMPTY}    ${CURRENT_ADDRESS}    ${EMPTY}
    Validate Output Box
    Validate User Form Outbox Fields    ${EMPTY}    ${EMPTY}    ${CURRENT_ADDRESS}    ${EMPTY}

Validate if only Permanent Address is populated
    [Documentation]    Permanent Address is only populated
    Populate User Form Fields And Click Submit    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${PERMANENT_ADDRESS}
    Validate Output Box
    Validate User Form Outbox Fields    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${PERMANENT_ADDRESS}

Validate if Email is not in correct format
    Populate User Form Fields And Click Submit    ${NAME}    ${INVALID_EMAIL}    ${CURRENT_ADDRESS}    ${PERMANENT_ADDRESS}
    Validate Output Box    ${False}