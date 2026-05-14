### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Practice Form Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Click Student Submit
    [Documentation]    Click Student Submit
    Wait And Click    ${STUDENT_SUBMIT_BUTTON}

Enter Student Current Address
    [Documentation]    Enter Student Current Address
    [Arguments]    ${student_current_address}=${EMPTY}
    Input Text    ${STUDENT_CURRENT_ADDRESS_FIELD}    ${student_current_address}

Enter Student Email
    [Documentation]    Enter Student Email
    [Arguments]    ${student_email}=${EMPTY}
    Input Text    ${STUDENT_EMAIL_FIELD}    ${student_email}

Enter Student First Name
    [Documentation]    Enter Student First Name
    [Arguments]    ${student_first_name}=${EMPTY}
    Input Text    ${STUDENT_FIRST_NAME_FIELD}    ${student_first_name}

Enter Student Last Name
    [Documentation]    Enter Student Last Name
    [Arguments]    ${student_last_name}=${EMPTY}
    Input Text    ${STUDENT_LAST_NAME_FIELD}    ${student_last_name}

Enter Student Mobile
    [Documentation]    Enter Student Mobile
    [Arguments]    ${student_mobile}=${EMPTY}
    Input Text    ${STUDENT_MOBILE_FIELD}    ${student_mobile}

Navigate To Practice Form Page
    [Documentation]    Navigate To Practice Form Page
    Go To    ${DEMO_QA_PRACTICE_FORM}

Populate Student Form
    [Documentation]    Populate Student Form
    [Arguments]    ${student_first_name}=${EMPTY}    ${student_last_name}=${EMPTY}    ${student_email}=${EMPTY}    ${student_gender}=${EMPTY}
    ...    ${student_mobile}=${EMPTY}    ${student_month_of_birth}=${EMPTY}    ${student_year_of_birth}=${EMPTY}
    ...    ${student_day_of_birth}=${EMPTY}    ${subjects}=${None}    ${hobbies}=${None}    ${file_path}=${EMPTY}
    ...    ${file_name}=${EMPTY}    ${student_current_address}=${EMPTY}    ${state}=${EMPTY}    ${city}=${EMPTY}
    Enter Student First Name    ${student_first_name}
    Enter Student Last Name    ${student_last_name}
    Enter Student Email    ${student_email}
    Select Gender    ${student_gender}
    Enter Student Mobile    ${student_mobile}
    Select Student Date Of Birth From Calendar    ${student_month_of_birth}    ${student_year_of_birth}    ${student_day_of_birth}
    IF    ${subjects}!=${None}
        Select Subject    @{subjects}
    END
    IF    ${hobbies} != ${None}
        Select Hobbies    @{hobbies}
    END
    Upload Student Picture    ${file_path}    ${file_name}
    Enter Student Current Address    ${student_current_address}
    Select State    ${state}
    Select City    ${city}

Populate Student Form And Click Submit
    [Documentation]    Populate Student Form And Click Submit
    [Arguments]    ${student_first_name}=${EMPTY}    ${student_last_name}=${EMPTY}    ${student_email}=${EMPTY}    ${student_gender}=${EMPTY}
    ...    ${student_mobile}=${EMPTY}    ${student_month_of_birth}=${EMPTY}    ${student_year_of_birth}=${EMPTY}
    ...    ${student_day_of_birth}=${EMPTY}    ${subjects}=${None}    ${hobbies}=${None}    ${file_path}=${EMPTY}
    ...    ${file_name}=${EMPTY}    ${student_current_address}=${EMPTY}    ${state}=${EMPTY}    ${city}=${EMPTY}
    Populate Student Form    ${student_first_name}    ${student_last_name}    ${student_email}    ${student_gender}
    ...    ${student_mobile}    ${student_month_of_birth}    ${student_year_of_birth}    ${student_day_of_birth}
    ...    ${subjects}    ${hobbies}    ${file_path}    ${file_name}    ${student_current_address}    ${state}    ${city}
    Click Student Submit

Select City
    [Documentation]    Select City
    [Arguments]    ${city}
    Return From Keyword If    '${city}'=='${EMPTY}'
    Wait And Input Text    ${STUDENT_CITY_FIELD}    ${city}
    # Log Source
    ${locator}    Replace String    ${STUDENT_CITY_OPTION}    city_    ${city}
    Wait Until Element Is Visible   ${locator}
    Click Element    ${locator}

Select Gender
    [Documentation]    Select Gender
    [Arguments]    ${student_gender}=${EMPTY}
    IF    '${student_gender}'=='${EMPTY}'
        Log    Student Gender is blank
    ELSE
        ${is_exist}=    Run Keyword And Return Status    Select Radio Button    gender    ${student_gender}
        IF    '${is_exist}'=='${True}'
            Log    Student Gender is ${student_gender}
        ELSE
            Fail    Log    Student Gender doesn't exist!
        END
    END

Select Hobbies
    [Documentation]    Select Hobbies
    [Arguments]    @{hobbies}
    ### Check if hobby is empty ###
    ${count}=    Get Length    ${hobbies}
    IF    ${count}==0
        Log    No hobbies provided
        RETURN
    ELSE
        Log    Num of Hobbiesjects: ${count}
    END
    ### Select hobby ###
    FOR    ${hobby}    IN    @{hobbies}
        ${locator}    Replace String    ${STUDENT_HOBBIES_FIELD}    hobbies_    ${hobby}
        ${is_valid_hobby}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
        IF    '${is_valid_hobby}'=='${True}'
            Click Element    ${locator}/..${STUDENT_HOBBIES_CHECK_BOX}
        ELSE
            Run Keyword And Continue On Failure    Fail    Log    Hobby is not valid!
        END
    END

Select State
    [Documentation]    Select State
    [Arguments]    ${state}
    Return From Keyword If    '${state}'=='${EMPTY}'
    Wait And Input Text    ${STUDENT_STATE_FIELD}    ${state}
    # Log Source    # For debug
    ${locator}    Replace String    ${STUDENT_STATE_OPTION}    state_    ${state}
    Wait Until Element Is Visible   ${locator}
    Click Element    ${locator}

Select Student Date Of Birth From Calendar
    [Documentation]    Select Student Date Of Birth From Calendar
    [Arguments]    ${student_month_of_birth}=${EMPTY}    ${student_year_of_birth}=${EMPTY}    ${student_day_of_birth}=${EMPTY}
    Return From Keyword If    '${student_month_of_birth}'=='${EMPTY}' and '${student_year_of_birth}'=='${EMPTY}'
    ...    and '${student_day_of_birth}'=='${EMPTY}'
    Wait And Click    ${STUDENT_DATE_OF_BIRTH_FIELD}
    ### Select month ###
    Select From List By Label    ${STUDENT_MONTH_OF_BIRTH_OPTION}    ${student_month_of_birth}
    ### Select year ###
    Select From List By Label    ${STUDENT_YEAR_OF_BIRTH_OPTION}    ${student_year_of_birth}
    ### Select day ###
    ${locator}    Replace String    ${STUDENT_DAY_OF_BIRTH_FIELD}    day_of_birth    ${student_day_of_birth}
    Wait And Click    ${locator}

Select Subject
    [Documentation]    Select Subject
    [Arguments]    @{subjects}
    ### Check if subject is empty ###
    IF    len(@{subjects})==0
        Log    No subjects provided
        RETURN
    ELSE
        ${count}=    Get Length    ${subjects}
        Log    Num of Subjects: ${count}
        FOR    ${subject}    IN    @{subjects}
            Input Text    ${STUDENT_SUBJECTS_FIELD}    ${subject}
            ${locator}    Replace String    ${STUDENT_SUBJECTS_OPTION}    subject_    ${subject}
            Wait Until Element Is Visible   ${locator}
            Click Element    ${locator}
        END
    END
    
Upload Student Picture
    [Documentation]    Upload Student Picture
    [Arguments]    ${file_path}    ${file_name}
    Return From Keyword If    '${file_name}'=='${EMPTY}'
    Choose File    ${UPLOAD_PICTURE}    ${file_path}${file_name}

### VALIDATION ###
Validate Student Address
    [Documentation]    Validate Student Address
    [Arguments]    ${student_address}
    IF    '${student_address}'=='${EMPTY}'
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Address
        ${actual}=     Get Text    ${locator}
        Should Be Empty    ${actual}
        Log    Student Address is empty
    ELSE
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Address
        ${actual}=     Get Text    ${locator}
        Should Be Equal    ${actual}    ${student_address}
    END

Validate Student Date Of Birth
    [Documentation]    Validate Student Date Of Birth
    [Arguments]    ${student_month_of_birth}    ${student_year_of_birth}    ${student_day_of_birth}
    ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Date of Birth
    ${actual}=     Get Text    ${locator}
    IF    '${student_month_of_birth}'=='${EMPTY}' and '${student_year_of_birth}'=='${EMPTY}' and '${student_day_of_birth}'=='${EMPTY}'
        ${current_date}=    Get System Date    %d    %B,%Y    separator=${SPACE}
        Should Be Equal    ${actual}    ${current_date}
        Log    Since Date of Birth is empty, current date is used instead
    ELSE
        ${day_len}=    Get Length    ${student_day_of_birth}
        IF    ${day_len}==1
            ${student_day_of_birth}=    Set Variable    0${student_day_of_birth}
        END
        Should Be Equal    ${actual}    ${student_day_of_birth}${SPACE}${student_month_of_birth},${student_year_of_birth}
    END

Validate Student Email
    [Documentation]    Validate Student Email
    [Arguments]    ${student_email}
    IF    '${student_email}'=='${EMPTY}'
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Student Email
        ${actual}=     Get Text    ${locator}
        Should Be Empty    ${actual}
        Log    Student Email is empty
    ELSE
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Student Email
        ${actual}=     Get Text    ${locator}
        Should Be Equal    ${actual}    ${student_email}
    END

Validate Student Gender
    [Documentation]    Validate Student Gender
    [Arguments]    ${student_gender}
    IF    '${student_gender}'=='${EMPTY}'
        Log    Student Gender is empty
    ELSE
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Gender
        ${actual}=     Get Text    ${locator}
        Should Be Equal    ${actual}    ${student_gender}
    END

Validate Student Hobbies
    [Documentation]    Validate Student Hobbies
    [Arguments]    @{hobbies}
    ### Check if hobby is empty ###
    ${count}=    Get Length    ${hobbies}
    IF    ${count}==0
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Hobbies
        ${actual}=     Get Text    ${locator}
        Should Be Empty    ${actual}
        Log    No hobbies provided
    ELSE
        Log    Num of Hobbies: ${count}
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Hobbies
        ${actual}=     Get Text    ${locator}
        FOR    ${hobby}    IN    @{hobbies}
            Should Contain    ${actual}    ${hobby}
        END
    END

Validate Student Mobile
    [Documentation]    Validate Student Mobile
    [Arguments]    ${student_mobile}
    IF    '${student_mobile}'=='${EMPTY}'
        Log    Student Mobile is empty
    ELSE
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Mobile
        ${actual}=     Get Text    ${locator}
        Should Be Equal    ${actual}    ${student_mobile}
    END

Validate Student Modal
    [Documentation]    Validate Student Modal
    [Arguments]    ${should_display}=${True}
    IF    '${should_display}'=='${True}'
        Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${STUDENT_FORM_MODAL}
    ELSE
        Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${STUDENT_FORM_MODAL}
    END

Validate Student Name
    [Documentation]    Validate Student Name
    [Arguments]    ${student_first_name}    ${student_last_name}
    IF    '${student_first_name}'=='${EMPTY}' or '${student_last_name}'=='${EMPTY}'
        Log    Student Name is empty
    ELSE
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Student Name
        ${actual}=     Get Text    ${locator}
        Should Be Equal    ${actual}    ${student_first_name}${SPACE}${student_last_name}
    END

Validate Student Picture
    [Documentation]    Validate Student Picture
    [Arguments]    ${student_picture}
    IF    '${student_picture}'=='${EMPTY}'
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Picture
        ${actual}=     Get Text    ${locator}
        Should Be Empty    ${actual}
        Log    Student Picture is empty
    ELSE
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Picture
        ${actual}=     Get Text    ${locator}
        Should Be Equal    ${actual}    ${student_picture}
    END

Validate Student Record
    [Documentation]    Validate Student Record
    [Arguments]    ${student_first_name}=${EMPTY}    ${student_last_name}=${EMPTY}    ${student_email}=${EMPTY}    ${student_gender}=${EMPTY}
    ...    ${student_mobile}=${EMPTY}    ${student_month_of_birth}=${EMPTY}    ${student_year_of_birth}=${EMPTY}
    ...    ${student_day_of_birth}=${EMPTY}    ${subjects}=${None}    ${hobbies}=${None}    ${student_picture}=${EMPTY}
    ...    ${student_address}=${EMPTY}    ${student_state}=${EMPTY}    ${student_city}=${EMPTY}
    Run Keyword And Continue On Failure    Validate Student Name    ${student_first_name}    ${student_last_name}
    Run Keyword And Continue On Failure    Validate Student Email    ${student_email}
    Run Keyword And Continue On Failure    Validate Student Gender    ${student_gender}
    Run Keyword And Continue On Failure    Validate Student Mobile    ${student_mobile}
    Run Keyword And Continue On Failure    Validate Student Date Of Birth    ${student_month_of_birth}    ${student_year_of_birth}    ${student_day_of_birth}
    IF    ${subjects}!=${None}
        Run Keyword And Continue On Failure    Validate Student Subjects    @{subjects}
    END
    IF    ${hobbies}!=${None}
        Run Keyword And Continue On Failure    Validate Student Hobbies    @{hobbies}
    END
    Run Keyword And Continue On Failure    Validate Student Picture    ${student_picture}
    Run Keyword And Continue On Failure    Validate Student Address    ${student_address}
    Run Keyword And Continue On Failure    Validate Student State And City    ${student_state}    ${student_city}

Validate Student State And City
    [Documentation]    Validate Student State And City
    [Arguments]    ${student_state}    ${student_city}
    IF    '${student_state}'=='${EMPTY}' or '${student_city}'=='${EMPTY}'
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    State and City
        ${actual}=     Get Text    ${locator}
        Should Be Empty    ${actual}
        Log    Student State or City is empty
    ELSE
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    State and City
        ${actual}=     Get Text    ${locator}
        Should Be Equal    ${actual}    ${student_state}${SPACE}${student_city}
    END

Validate Student Subjects
    [Documentation]    Validate Student Subjects
    [Arguments]    @{subjects}
    ### Check if subject is empty ###
    ${count}=    Get Length    ${subjects}
    IF    ${count}==0
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Subjects
        ${actual}=     Get Text    ${locator}
        Should Be Empty    ${actual}
        Log    No subjects provided
    ELSE
        Log    Num of Subjects: ${count}
        ${locator}    Replace String    ${STUDENT_RECORD_DATA}    label_name    Subjects
        ${actual}=     Get Text    ${locator}
        FOR    ${subject}    IN    @{subjects}
            Should Contain    ${actual}    ${subject}
        END
    END