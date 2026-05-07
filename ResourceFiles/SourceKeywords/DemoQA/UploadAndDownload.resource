### Note: arrange alhabetically ###
*** Settings ***
Documentation    Keywords used in Upload and Download Page of Demo QA
Resource         ../../../Configurations/ImportKeyword/DemoQA.robot

*** Keywords ***
Click Download
    [Documentation]    Click Download
    Wait And Click    ${DOWNLOAD_BUTTON}

Navigate To Upload And Download Page
    [Documentation]    Navigate To Upload And Download Page
    Go To    ${DEMO_QA_UPLOAD_DOWNLOAD}

Upload Resource
    [Documentation]    Upload Resource
    [Arguments]    ${file_path}    ${file_name}
    Choose File    ${UPLOAD_FILE}    ${file_path}${file_name}

### VALIDATION ###
Validate File Is Downloaded
    [Documentation]    Validate File Is Downloaded
    [Arguments]    ${file_path}    ${file_name}
    Wait Until Keyword Succeeds    1 min    5 sec    File Should Exist         ${file_path}${file_name}
    # Wait Until File Exist    ${file_path}${file_name}    30s
    File Should Exist         ${file_path}${file_name}

Validate Resource Does Not Exist
    [Documentation]    Validate Resource Does Not Exist
    [Arguments]    ${file_path}    ${file_name}
    File Should Not Exist    ${file_path}    ${file_name}
    ${is_uploaded}=    Run Keyword And Return Status    Upload Resource    ${file_path}    ${file_name}
    IF    '${is_uploaded}'=='${False}'
        Pass Execution    File doesn't exist
    ELSE
        Fail    Log    File was uploaded (It should not be uploaded bec file is non-existing!)
    END

Validate Resource Is Uploaded
    [Documentation]    Validate Resource Is Uploaded
    [Arguments]    ${file}
    Wait Until Element Is Visible    ${UPLOADED_FILE}
    Element Should Contain    ${UPLOADED_FILE}    ${file}