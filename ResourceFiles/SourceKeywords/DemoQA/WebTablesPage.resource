### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Web Tables Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Add Or Update Record
    [Documentation]    Add Or Update Record
    [Arguments]    ${first_name}=${EMPTY}    ${last_name}=${EMPTY}    ${email}=${EMPTY}    ${age}=${EMPTY}
    ...    ${salary}=${EMPTY}    ${department}=${EMPTY}
    Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${REGISTRATION_MODAL}
    Update Field If Provided    Enter First Name    ${first_name}
    Update Field If Provided    Enter Last Name    ${last_name}
    Update Field If Provided    Enter Email Address    ${email}
    Update Field If Provided    Enter Age    ${age}
    Update Field If Provided    Enter Salary    ${salary}
    Update Field If Provided    Enter Department    ${department}
    Click Submit
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${REGISTRATION_MODAL}

Add Record
    [Documentation]    Add Record
    [Arguments]    ${first_name}=${EMPTY}    ${last_name}=${EMPTY}    ${email}=${EMPTY}    ${age}=${EMPTY}
    ...    ${salary}=${EMPTY}    ${department}=${EMPTY}
    Click Add
    Add Or Update Record    ${first_name}    ${last_name}    ${email}    ${age}    ${salary}    ${department}

Click Add
    [Documentation]    Click Add
    Wait Until Element Is Visible    ${ADD_BUTTON}
    Click Element    ${ADD_BUTTON}

Click Delete
    [Documentation]    Click Delete
    Click Element    ${DELETE_ICON}

Click Edit
    [Documentation]    Click Edit
    Click Element    ${EDIT_ICON}

Click Submit
    [Documentation]    Click Submit
    Click Element    ${SUBMIT_BUTTON}

Click X
    [Documentation]    Click X
    Click Element    ${X_BUTTON}

Delete Added Record
    [Documentation]    Delete Added Record
    [Arguments]    ${searched_item}
    Enter Search Item    ${searched_item}
    Click Delete

Enter Age
    [Documentation]    Enter Age
    [Arguments]    ${age}
    Input Text    ${AGE_FIELD}    ${age}

Enter Department
    [Documentation]    Enter Department
    [Arguments]    ${department}
    Input Text    ${DEPARTMENT_FIELD}    ${department}

Enter Email Address
    [Documentation]    Enter Email Address
    [Arguments]    ${email}
    Input Text    ${EMAIL_FIELD}    ${email}

Enter First Name
    [Documentation]    Enter First Name
    [Arguments]    ${first_name}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}

Enter Last Name
    [Documentation]    Enter Last Name
    [Arguments]    ${last_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}

Enter Salary
    [Documentation]    Enter Salary
    [Arguments]    ${salary}
    Input Text    ${SALARY_FIELD}    ${salary}

Enter Search Item
    [Documentation]    Enter Search Item
    [Arguments]    ${search_item}
    Input Text    ${SEARCH_FIELD}    ${search_item}

Get Table Data
    [Documentation]    Get Table Data
    ${row_count}=    Get Table Row Count
    @{table_data}=    Create List

    FOR    ${row}    IN RANGE    1    ${row_count+1}
        ${cells}=    Get WebElements    ${TABLE_BODY}/..//../tbody/tr[${row}]/td
        ${row_data}=    Get Row Data From Cells    @{cells}
        Append To List    ${table_data}    ${row_data}
    END

    RETURN    @{table_data}

Get Table Headers
    [Documentation]    Get Table Headers
    ${is_displayed}=    Element Should Be Visible    ${TABLE_HEADER}
    ${headers}=    Get WebElements    ${TABLE_HEADER}
    @{header_texts}=    Create List
    FOR    ${header}    IN    @{headers}
        ${text}=    Get Text    ${header}
        Append To List    ${header_texts}    ${text}
    END
    RETURN    @{header_texts}

Get Table Row Count
    [Documentation]    Get Table Row Count
    ${rows}=    Get WebElements    ${TABLE_BODY_ROW}
    ${count}=    Get Length    ${rows}
    RETURN    ${count}

Get Row Data From Cells
    [Documentation]    Get Row Data From Cells
    [Arguments]    @{cells}
    ### Get cell value ###
    ${first_name}=    Get Text    ${cells}[0]
    ${last_name}=     Get Text    ${cells}[1]
    ${age}=           Get Text    ${cells}[2]
    ${email}=         Get Text    ${cells}[3]
    ${salary}=        Get Text    ${cells}[4]
    ${department}=    Get Text    ${cells}[5]
    ### Set cell value ###
    &{row_data}=    Create Dictionary
    Set To Dictionary    ${row_data}    First Name=${first_name}
    Set To Dictionary    ${row_data}    Last Name=${last_name}
    Set To Dictionary    ${row_data}    Age=${age}
    Set To Dictionary    ${row_data}    Email=${email}
    Set To Dictionary    ${row_data}    Salary=${salary}
    Set To Dictionary    ${row_data}    Department=${department}
    RETURN    ${row_data}

Navigate To Web Tables Page
    [Documentation]    Navigate to Web Tables Page
    Go To    ${DEMO_QA_WEB_TABLES}

Navigate To Web Tables Page And Add New Record
    [Documentation]    Navigate To Web Tables Page And Add New Record
    Navigate To Web Tables Page

Navigate To Web Tables Page And Create Record
    [Documentation]    Navigate To Web Tables Page And Create Record
    [Arguments]    ${first_name}=${EMPTY}    ${last_name}=${EMPTY}    ${email}=${EMPTY}    ${age}=${EMPTY}
    ...    ${salary}=${EMPTY}    ${department}=${EMPTY}
    Navigate To Web Tables Page
    Add Record    ${first_name}    ${last_name}    ${email}    ${age}    ${salary}    ${department}

Update Record
    [Documentation]    Update Record
    [Arguments]    ${searched_item}    ${first_name}=${EMPTY}    ${last_name}=${EMPTY}    ${email}=${EMPTY}
    ...    ${age}=${EMPTY}    ${salary}=${EMPTY}    ${department}=${EMPTY}
    Enter Search Item    ${searched_item}
    Click Edit
    Add Or Update Record    ${first_name}    ${last_name}    ${email}    ${age}    ${salary}    ${department}

### VALIDATION ###
Validate Age
    [Documentation]    Validate Age
    [Arguments]    ${expected_age}
    Validate Cell Value    Age    ${expected_age}

Validate Age In Registration Form
    [Documentation]    Validate Age In Registration Form
    [Arguments]    ${age}
    ${max_length}=   Set Variable    2
    Element Attribute Value Should Be    ${AGE_FIELD}    maxlength    2
    ${trimmed_value}=    Strip Text To Max Length    ${age}    ${max_length}
    Validate Input Field Value    ${AGE_FIELD}    ${trimmed_value}

Validate Cell Value
    [Arguments]    ${column_to_validate}    ${expected_value}
    ${locator}    Run Keyword If    '${column_to_validate}'=='First Name'    Replace String    ${TABLE_BODY_CELL}    column    1
    ...    ELSE IF    '${column_to_validate}'=='Last Name'    Replace String    ${TABLE_BODY_CELL}    column    2
    ...    ELSE IF    '${column_to_validate}'=='Age'    Replace String    ${TABLE_BODY_CELL}    column    3
    ...    ELSE IF    '${column_to_validate}'=='Email'    Replace String    ${TABLE_BODY_CELL}    column    4
    ...    ELSE IF    '${column_to_validate}'=='Salary'    Replace String    ${TABLE_BODY_CELL}    column    5
    ...    ELSE IF    '${column_to_validate}'=='Department'    Replace String    ${TABLE_BODY_CELL}    column    6
    ...    ELSE    Fail    Log    ${column_to_validate} value is invalid!
    ${actual}=     Get Text    ${locator}
    Should Be Equal    ${actual}    ${expected_value}

Validate Department
    [Documentation]    Validate Department
    [Arguments]    ${expected_department}
    Validate Cell Value    Department    ${expected_department}

Validate Department In Registration Form
    [Documentation]    Validate Department In Registration Form
    [Arguments]    ${department}
    ${max_length}=   Set Variable    25
    Element Attribute Value Should Be    ${DEPARTMENT_FIELD}    maxlength    25
    ${trimmed_value}=    Strip Text To Max Length    ${department}    ${max_length}
    Validate Input Field Value    ${DEPARTMENT_FIELD}    ${trimmed_value}

Validate Email
    [Documentation]    Validate Email
    [Arguments]    ${expected_email}
    Validate Cell Value    Email    ${expected_email}

Validate First
    [Documentation]   Validate First
    [Arguments]    ${enabled}=${True}
    Run Keyword If    '${enabled}'=='${True}'    Element Should Be Enabled    ${FIRST_BUTTON}
    ...    ELSE    Element Should Be Disabled    ${FIRST_BUTTON}

Validate First Name
    [Documentation]    Validate First Name
    [Arguments]    ${expected_first_name}
    Validate Cell Value    First Name    ${expected_first_name}

Validate First Name In Registration Form
    [Documentation]    Validate First Name In Registration Form
    [Arguments]    ${first_name}
    ${max_length}=   Set Variable    25
    Element Attribute Value Should Be    ${FIRST_NAME_FIELD}    maxlength    25
    ${trimmed_value}=    Strip Text To Max Length    ${first_name}    ${max_length}
    Validate Input Field Value    ${FIRST_NAME_FIELD}    ${trimmed_value}

Validate Full Table Data
    [Documentation]    Validate Full Table Data
    [Arguments]    @{expected_table_value}
    ${actual}=    Get Table Data
    Log    ${actual}
    @{expected}=    Create List    @{expected_table_value}
    Should Be Equal    ${actual}    ${expected}

Validate Last
    [Documentation]   Validate Last
    [Arguments]    ${enabled}=${True}
    Run Keyword If    '${enabled}'=='${True}'    Element Should Be Enabled    ${PREVIOUS_BUTTON}
    ...    ELSE    Element Should Be Disabled    ${PREVIOUS_BUTTON}

Validate Last Name
    [Documentation]    Validate Last Name
    [Arguments]    ${expected_last_name}
    Validate Cell Value    Last Name    ${expected_last_name}

Validate Last Name In Registration Form
    [Documentation]    Validate Last Name In Registration Form
    [Arguments]    ${last_name}
    ${max_length}=   Set Variable    25
    Element Attribute Value Should Be    ${LAST_NAME_FIELD}    maxlength    25
    ${trimmed_value}=    Strip Text To Max Length    ${last_name}    ${max_length}
    Validate Input Field Value    ${LAST_NAME_FIELD}    ${trimmed_value}

Validate Next
    [Documentation]   Validate Next
    [Arguments]    ${enabled}=${True}
    Run Keyword If    '${enabled}'=='${True}'    Element Should Be Enabled    ${NEXT_BUTTON}
    ...    ELSE    Element Should Be Disabled    ${NEXT_BUTTON}

Validate Page Section
    [Documentation]    Validate Page Section
    ${row_count}=    Get Element Count    ${TABLE_BODY_ROW}
    Run Keyword If    ${row_count}==0    Element Text Should Be    ${PAGE_SECTION}    1 of 0
    ...    ELSE    Element Text Should Not Be    ${PAGE_SECTION}    1 of 0

Validate Previous
    [Documentation]   Validate Previous
    [Arguments]    ${enabled}=${True}
    Run Keyword If    '${enabled}'=='${True}'    Element Should Be Enabled    ${PREVIOUS_BUTTON}
    ...    ELSE    Element Should Be Disabled    ${PREVIOUS_BUTTON}

Validate Record
    [Documentation]    Validate Record
    [Arguments]    ${searched_item}    ${expected_first_name}    ${expected_last_name}    ${expected_email}
    ...    ${expected_age}    ${expected_salary}    ${expected_department}
    Enter Search Item    ${searched_item}
    Validate First Name    ${expected_first_name}
    Validate Last Name    ${expected_last_name}
    Validate Email    ${expected_email}
    Validate Age    ${expected_age}
    Validate Salary    ${expected_salary}
    Validate Department    ${expected_department}

Validate Record Deleted
    [Documentation]    Validate Record Deleted
    [Arguments]    ${searched_item}
    Enter Search Item    ${searched_item}
    Validate Table Body
    Validate Page Section

Validate Record Not Created
    [Documentation]    Validate Record Not Created
    [Arguments]    ${searched_item}
    Element Should Be Visible    ${REGISTRATION_MODAL}
    Click X
    Enter Search Item    ${searched_item}
    Validate Table Body
    Validate Page Section

Validate Salary
    [Documentation]    Validate Salary
    [Arguments]    ${expected_salary}
    Validate Cell Value    Salary    ${expected_salary}

Validate Salary In Registration Form
    [Documentation]    Validate Salary In Registration Form
    [Arguments]    ${salary}
    ${max_length}=   Set Variable    10
    Element Attribute Value Should Be    ${SALARY_FIELD}    maxlength    10
    ${trimmed_value}=    Strip Text To Max Length    ${salary}    ${max_length}
    Validate Input Field Value    ${SALARY_FIELD }    ${trimmed_value}

Validate Specific Column
    [Documentation]    Validate Specific Column
    [Arguments]    ${column}    @{column_value}
    IF    '${column}'=='First Name'
        ${column_name}=    Set Variable    First Name
    ELSE IF    '${column}'=='Last Name'
        ${column_name}=    Set Variable    Last Name
    ELSE IF    '${column}'=='Age'
        ${column_name}=    Set Variable    Age
    ELSE IF    '${column}'=='Email'
        ${column_name}=    Set Variable    Email
    ELSE IF    '${column}'=='Salary'
        ${column_name}=    Set Variable    Salary
    ELSE IF    '${column}'=='Department'
        ${column_name}=    Set Variable    Department
    ELSE
        Fail    Column not found! Pls check.
    END
    ${table}=    Get Table Data

    FOR    ${row}    IN    @{table}
        List Should Contain Value    ${column_value}    ${row}[${column_name}]
    END

Validate Table Body
    [Documentation]    Validate Table Body
    ${row_count}=    Get Element Count    ${TABLE_BODY_ROW}/tr
    Run Keyword If    ${row_count}==0    Should Be Equal As Integers    ${row_count}    0
    ...    ELSE    Should Not Be Equal As Integers    ${row_count}    0

Validate Table Headers
    [Documentation]    Validate Table Headers
    [Arguments]    @{expected_headers}
    @{actual_headers}=    Get Table Headers
    Should Be Equal    ${actual_headers}    ${expected_headers}

Validate Table Row Count
    [Documentation]    Validate Table Row Count
    [Arguments]    ${expected_length}
    ${table}=    Get Element Count    ${TABLE_HEADER}/..//../../tbody/tr
    Should Be Equal As Integers   ${table}    ${expected_length}