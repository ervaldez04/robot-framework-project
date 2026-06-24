*** Settings ***
Documentation     Test Case for Demo QA - Forms Module - Practice Form
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Forms_PracticeForm
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Practice Form Page

*** Test Cases ***
Validate if all fields are populated
    [Documentation]    Ceate new student record when all fields are populated
    [Tags]    Smoke    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate when all Mandatory Fields are populated
    [Documentation]    Ceate new student record when all mandatory fields are populated
    [Tags]    Smoke    Regression    Positive
    Populate Student Form And Click Submit    student_first_name=${STUDENT_FIRST_NAME}    student_last_name=${STUDENT_LAST_NAME}
    ...    student_gender=${STUDENT_GENDER}    student_mobile=${STUDENT_MOBILE}
    Validate Student Modal
    Validate Student Record    student_first_name=${STUDENT_FIRST_NAME}    student_last_name=${STUDENT_LAST_NAME}
    ...    student_gender=${STUDENT_GENDER}    student_mobile=${STUDENT_MOBILE}

Validate if all fields are blank
    [Documentation]    All fields are empty
    Populate Student Form And Click Submit
    Validate Student Modal    ${False}

Validate if First Name is blank
    [Documentation]    Ceate new student record when First Name is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${EMPTY}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal    ${False}

Validate if Last Name is blank
    [Documentation]    Ceate new student record when Last Name is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${EMPTY}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal    ${False}

Validate if Email is blank
    [Documentation]    Ceate new student record when Email is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${EMPTY}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${EMPTY}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate if Gender is blank
    [Documentation]    Ceate new student record when Gender is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${EMPTY}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal    ${False}

Validate if Mobile is blank
    [Documentation]    Ceate new student record when Mobile is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${EMPTY}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal    ${False}

Validate if Date of Birth is blank
    [Documentation]    Ceate new student record when Date of Birth is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate if Subject is blank
    [Documentation]    Ceate new student record when Subject is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${None}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${None}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate if Hobby is blank
    [Documentation]    Ceate new student record when Hobby is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${None}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${None}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate if Picture is blank
    [Documentation]    Ceate new student record when Picture is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    student_current_address=${STUDENT_CURRENT_ADDRESS}    state=${STUDENT_STATE}    city=${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${EMPTY}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate if Current Address is blank
    [Documentation]    Ceate new student record when Current Address is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${EMPTY}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${EMPTY}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate if State is blank
    [Documentation]    Ceate new student record when State is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${EMPTY}    ${STUDENT_CITY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${EMPTY}    ${STUDENT_CITY}

Validate if City is blank
    [Documentation]    Ceate new student record when City is empty
    [Tags]    Regression    Positive
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${EMPTY}
    Validate Student Modal
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${EMPTY}

Validate default value of Date of Birth
    [Documentation]    Default value of Date of Birth
    [Tags]    Regression    Positive
    Validate Default Value Of Date Of Birth

Validate if Mobile is alphanumeric
    [Documentation]    Ceate new student record when Mobile is alphanumeric
    [Tags]    Regression    Negative
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_INVALID_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal    ${False}

Validate if Mobile is more than 10
    [Documentation]    Ceate new student record when Mobile is more than 10 digits
    [Tags]    Regression    Negative
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE_EXTRA}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Record    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_TRUNC_MOBILE}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}    ${STUDENT_PICTURE}
    ...    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}

Validate if Mobile is less than 10
    [Documentation]    Ceate new student record when Mobile is alphanumeric
    [Tags]    Regression    Negative
    Populate Student Form And Click Submit    ${STUDENT_FIRST_NAME}    ${STUDENT_LAST_NAME}    ${STUDENT_EMAIL}    ${STUDENT_GENDER}    ${STUDENT_MOBILE_MIN}
    ...    ${STUDENT_MOB}    ${STUDENT_YOB}    ${STUDENT_DOB}    ${STUDENT_SUBJECTS}    ${STUDENT_HOBBIES}
    ...    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${STUDENT_PICTURE}    ${STUDENT_CURRENT_ADDRESS}    ${STUDENT_STATE}    ${STUDENT_CITY}
    Validate Student Modal    ${False}