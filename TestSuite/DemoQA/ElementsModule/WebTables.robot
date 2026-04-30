*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Web Tables
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_WebTables
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close All Browsers

*** Test Cases ***
Validate Table data by default
    [Documentation]    Data on table by default
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Validate Table Headers    @{HEADERS}
    Validate Table Row Count    3
    Validate Table Body
    Validate Page Section
    Validate Full Table Data    ${TABLE_CIERRA}    ${TABLE_ALDEN}    ${TABLE_KIERRA}

Validate able to search First Name
    [Documentation]    Search by First Name
    [Tags]    Smoke    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Enter Search Item    ${SEARCHED_FIRST_NAME}
    Validate Full Table Data    ${TABLE_ALDEN}
    Validate Table Body
    Validate Page Section
    Validate Specific Column    First Name    ${SEARCHED_FIRST_NAME}

Validate able to search Last Name
    [Documentation]    Search by Last Name
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Enter Search Item    ${SEARCHED_LAST_NAME}
    Validate Table Body
    Validate Page Section
    Validate Full Table Data    ${TABLE_CIERRA}
    Validate Specific Column    Last Name    ${SEARCHED_LAST_NAME}

Validate able to search Age
    [Documentation]    Search by Age
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Enter Search Item    ${SEARCHED_AGE}
    Validate Table Body
    Validate Page Section
    Validate Full Table Data    ${TABLE_KIERRA}
    Validate Specific Column    Age    ${SEARCHED_AGE}

Validate able to search Email
    [Documentation]    Search by Email
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Enter Search Item    ${SEARCHED_EMAIL}
    Validate Table Body
    Validate Page Section
    Validate Full Table Data    ${TABLE_CIERRA}
    Validate Specific Column    Email    ${SEARCHED_EMAIL}

Validate able to search Salary
    [Documentation]    Search by Salary
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Enter Search Item    ${SEARCHED_SALARY}
    Validate Table Body
    Validate Page Section
    Validate Full Table Data    ${TABLE_ALDEN}
    Validate Specific Column    Salary    ${SEARCHED_SALARY}

Validate able to search Department
    [Documentation]    Search by Department
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Enter Search Item    ${SEARCHED_DEPARTMENT}
    Validate Table Body
    Validate Page Section
    Validate Full Table Data    ${TABLE_CIERRA}
    Validate Specific Column    Department    ${SEARCHED_DEPARTMENT}

Validate if non-existing item is searched
    [Documentation]    Search invalid data
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Enter Search Item    ${SEARCHED_INVALID_ITEM}
    Validate Table Body
    Validate Page Section

Validate if able to update First Name
    [Documentation]    Update First Name
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Update Record    ${ADDED_LAST_NAME}    ${UPDATED_FIRST_NAME}
    Validate Record    ${ADDED_LAST_NAME}    ${UPDATED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}
    ...    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_LAST_NAME}

Validate if able to update Last Name
    [Documentation]    Update Last Name
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Update Record    ${ADDED_FIRST_NAME}    last_name=${UPDATED_LAST_NAME}
    Validate Record    ${ADDED_FIRST_NAME}    ${ADDED_FIRST_NAME}    ${UPDATED_LAST_NAME}    ${ADDED_EMAIL}
    ...    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_FIRST_NAME}

Validate if able to update Email
    [Documentation]    Update Email
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Update Record    ${ADDED_FIRST_NAME}    email=${UPDATED_EMAIL}
    Validate Record    ${ADDED_FIRST_NAME}    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${UPDATED_EMAIL}
    ...    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_FIRST_NAME}

Validate if able to update Age
    [Documentation]    Update Age
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Update Record    ${ADDED_FIRST_NAME}    age=${UPDATED_AGE}
    Validate Record    ${ADDED_FIRST_NAME}    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}
    ...    ${UPDATED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_FIRST_NAME}

Validate if able to update Salary
    [Documentation]    Update Salary
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Update Record    ${ADDED_FIRST_NAME}    salary=${UPDATED_SALARY}
    Validate Record    ${ADDED_FIRST_NAME}    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}
    ...    ${ADDED_AGE}    ${UPDATED_SALARY}    ${ADDED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_FIRST_NAME}

Validate if able to update Department
    [Documentation]    Update Department
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Update Record    ${ADDED_FIRST_NAME}    department=${UPDATED_DEPARTMENT}
    Validate Record    ${ADDED_FIRST_NAME}    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}
    ...    ${ADDED_AGE}    ${ADDED_SALARY}    ${UPDATED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_FIRST_NAME}

Validate when no update made in Register Modal
    [Documentation]    No update made in Register Modal
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Update Record    ${ADDED_FIRST_NAME}
    Validate Record    ${ADDED_FIRST_NAME}    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}
    ...    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_FIRST_NAME}

Validate if able to delete existing data
    [Documentation]    Delete existing data
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page And Create Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Delete Added Record    ${ADDED_FIRST_NAME}
    Validate Record Deleted    ${ADDED_FIRST_NAME}

Validate if able to create new record
    [Documentation]    Ceate new record
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}
    ...    ${ADDED_EMAIL}    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record    ${ADDED_FIRST_NAME}    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}
    ...    ${ADDED_AGE}    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    [Teardown]    Delete Added Record    ${ADDED_FIRST_NAME}

Validate if able to create when First Name is blank
    [Documentation]    Ceate new record when First Name is blank
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${EMPTY}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}    ${ADDED_AGE}
    ...    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_LAST_NAME}

Validate if able to create when Last Name is blank
    [Documentation]    Ceate new record when Last Name is blank
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${EMPTY}    ${ADDED_EMAIL}    ${ADDED_AGE}
    ...    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_FIRST_NAME}

Validate if able to create when Email is blank
    [Documentation]    Ceate new record when Email is blank
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${EMPTY}    ${ADDED_AGE}
    ...    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_FIRST_NAME}

Validate if able to create when Age is blank
    [Documentation]    Ceate new record when Age is blank
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}    ${EMPTY}
    ...    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_FIRST_NAME}

Validate if able to create when Salary is blank
    [Documentation]    Ceate new record when Salary is blank
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}    ${ADDED_AGE}
    ...    ${EMPTY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_FIRST_NAME}

Validate if able to create when Department is blank
    [Documentation]    Ceate new record when Department is blank
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}    ${ADDED_AGE}
    ...    ${ADDED_SALARY}    ${EMPTY}
    Validate Record Not Created    ${ADDED_FIRST_NAME}

Validate Buttons when record is less than 10
    [Documentation]    Ceate new record when Department is blank
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Validate First    ${False}
    Validate Next    ${False}
    Validate Previous    ${False}
    Validate Last    ${False}

Validate Maximum Length of First Name
    [Documentation]    Maximum length of First Name (25 char)
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Click Add
    Enter First Name    ${MAXIMUM_FIRST_NAME}
    Validate First Name In Registration Form    ${MAXIMUM_FIRST_NAME}

Validate Maximum Length of Last Name
    [Documentation]    Maximum length of Last Name (25 char)
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Click Add
    Enter Last Name    ${MAXIMUM_LAST_NAME}
    Validate Last Name In Registration Form    ${MAXIMUM_LAST_NAME}

Validate Maximum Length of Age
    [Documentation]    Maximum length of Age (2 int)
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Click Add
    Enter Age    ${MAXIMUM_AGE}
    Validate Age In Registration Form    ${MAXIMUM_AGE}

Validate Maximum Length of Salary
    [Documentation]    Maximum length of Salary (10 int)
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Click Add
    Enter Salary    ${MAXIMUM_SALARY}
    Validate Salary In Registration Form    ${MAXIMUM_SALARY}

Validate Maximum Length of Department
    [Documentation]    Maximum length of Department (25 char)
    [Tags]    Regression    Positive
    [Setup]    Navigate To Web Tables Page
    Click Add
    Enter Department    ${MAXIMUM_DEPARTMENT}
    Validate Department In Registration Form    ${MAXIMUM_DEPARTMENT}

Validate if Email entered is invalid value
    [Documentation]    Email entered is invalid (format: name@example.com)
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${INVALID_EMAIL}    ${ADDED_AGE}
    ...    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_FIRST_NAME}

Validate if Age entered is invalid value
    [Documentation]    Age entered is invalid (only accepts int)
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}    ${INVALID_AGE}
    ...    ${ADDED_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_FIRST_NAME}

Validate if Salary entered is invalid value
    [Documentation]    Salary entered is invalid (only accepts int)
    [Tags]    Regression    Negative
    [Setup]    Navigate To Web Tables Page
    Add Record    ${ADDED_FIRST_NAME}    ${ADDED_LAST_NAME}    ${ADDED_EMAIL}    ${ADDED_AGE}
    ...    ${INVALID_SALARY}    ${ADDED_DEPARTMENT}
    Validate Record Not Created    ${ADDED_FIRST_NAME}