*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Upload and Download
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_UploadAndDownload
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}    disable_password_manager=${False}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Upload And Download Page

*** Test Cases ***
Validate able to Download
    [Documentation]    Download
    [Tags]    Smoke    Regression    Positive
    Remove File    ${EXECDIR}${/}${DOWNLOAD_DIRECTORY}${/}${DOWNLOAD_FILE}
    Click Download
    Validate File Is Downloaded    ${EXECDIR}${/}${DOWNLOAD_DIRECTORY}${/}    ${DOWNLOAD_FILE}

Validate able to Upload Document
    [Documentation]    Upload Document
    [Tags]    Smoke    Regression    Positive
    Upload Resource    ${EXECDIR}${RESOURCE_FILE}${FILES}    ${PDF_FILE}
    Validate Resource Is Uploaded    ${PDF_FILE}

Validate able to Upload Image
    [Documentation]    Upload Image
    [Tags]    Regression    Positive
    Upload Resource    ${EXECDIR}${RESOURCE_FILE}${IMAGES}    ${IMAGE_FILE}
    Validate Resource Is Uploaded    ${IMAGE_FILE}

Validate able to Upload Zip File
    [Documentation]    Upload Zip file
    [Tags]    Regression    Positive
    Upload Resource    ${EXECDIR}${RESOURCE_FILE}${FILES}    ${ZIP_FILE}
    Validate Resource Is Uploaded    ${ZIP_FILE}

Validate not able to Upload Non-Existing File
    [Documentation]    Upload Non-Existing file
    [Tags]    Regression    Negative
    Validate Resource Does Not Exist    ${EXECDIR}${RESOURCE_FILE}${FILES}    ${NON_EXISTING_FILE}