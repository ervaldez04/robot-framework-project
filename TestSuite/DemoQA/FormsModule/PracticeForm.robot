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

# Validate if Name is blank
# Validate if Email is blank
# Validate if Gender is blank
# Validate if Mobile is blank
# Validate if Subjects is blank
# Validate if Hobbies is blank
# Validate if Picture is blank
# Validate if Current Address is blank
# Validate if State is blank
# Validate if City is blank
# Validate default value of Date of Birth
# Validate if Mobile is alphanumeric
# Validate if Mobile is more than 10
# Validate if Mobile is less than 10