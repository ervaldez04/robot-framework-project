### Note: arrange alhabetically ###
*** Settings ***
Documentation     Generic Keywords that can be used in any testing site
Resource          ../../Configurations/ImportGenericFile/GenericFile.robot

*** Keywords ***
Is Element Not Visible
    [Documentation]    Is Element Not Visible
    ${TARGET_LOCATOR}=    Set Variable    ${None}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${TARGET_LOCATOR}
    ${result}=    Set Variable    ${False}
    IF    not ${status}
        ${result}=    Set Variable    ${True}
    END
    RETURN    ${result}

Get System Date
    [Documentation]    Generate system date
    ${date}    Get Current Date    result_format=%Y-%m-%d
    Log    ${date}
    RETURN    ${date}

Open Browser With Options
    [Documentation]    Open browser with options
    [Arguments]    ${url}    ${browser}    ${headless}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ### Run Headless ###
    Run Keyword If    '${headless}'=='${True}'    Call Method    ${options}    add_argument    --headless
    ### Run in Jenkins ###
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-setuid-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Run Keyword If    '${headless}'=='${True}'    Call Method    ${options}    add_argument    --disable-gpu
    ### Set window size ###
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    ### Disable Google Password Manager ###
    Call Method    ${options}    add_argument    --disable-automation-extension
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --incognito
    Log    ${options}

    Create WebDriver    ${WEBDRIVER_CHROME}    options=${options}

    Set Timeout If Jenkins
    Open Browser    ${url}    ${browser}    options=${options}
    Run Keyword If    '${headless}'=='${False}'    Maximize Browser Window

    Run Keyword If    '${headless}'=='${True}'    Set Selenium Timeout    10s
    Run Keyword If    '${headless}'=='${True}'    Set Selenium Speed      0.5s

Set Timeout If Jenkins
    [Documentation]    Add Timeout when running in Jenkins to fix flaky test
    ${ci}=    Get Environment Variable    CI    default=${False}
    Run Keyword If    '${ci}'=='${True}'    Set Selenium Timeout    10s

### VALIDATION ###
Validate Field Type
    [Documentation]    Validate field type
    [Arguments]    ${webelement}    ${field_type}    ${value}
    Element Attribute Value Should Be    ${webelement}    ${field_type}    ${value}