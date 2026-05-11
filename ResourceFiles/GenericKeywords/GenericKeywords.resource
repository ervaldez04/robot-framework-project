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

New Tab Should Open
    [Documentation]    New Tab Should Open
    [Arguments]    @{old_handles}
    @{handles}=    Get Window Handles
    IF    len(@{handles}) > len(@{old_handles})
        Log    New tab opened successfully
    ELSE
        Fail    New tab did not open
    END
    ${new_tab}=    Set Variable    ${handles}[-1]
    Switch Window    ${new_tab}
    Set Global Variable    ${new_tab}

Open Browser With Options
    [Documentation]    Open Browser With Options
    [Arguments]    ${url}    ${browser}    ${headless}    ${disable_password_manager}=${True}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ### For Download ###
    Create Directory    ${DOWNLOAD_DIRECTORY}
    ${prefs}=    Create Dictionary    download.default_directory=${EXECDIR}${/}${DOWNLOAD_DIRECTORY}    download.prompt_for_download=${False}
    ...    download.directory_upgrade=${True}    plugins.always_open_pdf_externally=${True}    safebrowsing.enabled=${True}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    ### For Headless ###
    IF    '${headless}'=='${True}'
        Call Method    ${options}    add_argument    --headless\=new
        Call Method    ${options}    add_argument    --remote-allow-origins
        Call Method    ${options}    add_argument    --disable-gpu
    END
    ### Run in Continuous Integration ###
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-setuid-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    ### Set window size ###
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    ### Disable Google Password Manager ###
    IF    '${disable_password_manager}'=='${True}'
        Call Method    ${options}    add_argument    --disable-automation-extension
        Call Method    ${options}    add_argument    --disable-infobars
        Call Method    ${options}    add_argument    --incognito
    END
    Log    ${options}
    Set Timeout If Jenkins
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(log_output="chromedriver.log")
    ...    sys
    Open Browser    ${url}    ${browser}    options=${options}    service=${service}
    Run Keyword If    '${headless}'=='${False}'    Maximize Browser Window
    Run Keyword If    '${headless}'=='${True}'    Set Selenium Timeout    10s
    Run Keyword If    '${headless}'=='${True}'    Set Selenium Speed      0.5s

Set Timeout If Jenkins
    [Documentation]    Add Timeout when running in Jenkins to fix flaky test
    ${ci}=    Get Environment Variable    CI    default=${False}
    Run Keyword If    '${ci}'=='${True}'    Set Selenium Timeout    10s

Set Extension If Jenkins
    [Documentation]    Set Extension If Jenkins
    ${ci}=    Get Environment Variable    CI    default=${False}
    IF    '${ci}'=='${True}'
        Call Method    ${options}    add_argument    --disable-extensions-except=${CURDIR}/extensions/ublock
        Call Method    ${options}    add_argument    --load-extension=${CURDIR}/extensions/ublock
    END

Strip Text To Max Length
    [Documentation]    Strip Text To Max Length
    [Arguments]    ${text}    ${max_length}
    ${trimmed}=    Evaluate    "${text}"[:${max_length}]
    RETURN       ${trimmed}

Update Field If Provided
    [Documentation]    Update Field If Provided
    [Arguments]    ${keyword}    ${value}
    Run Keyword If    '${value}'=='${EMPTY}'    Log    No update for ${keyword}
    ...    ELSE    Run Keyword    ${keyword}    ${value}

Wait And Click
    [Documentation]    Wait And Click
    ...    Use Click Element instead of Click Button / Click Link (it is universal)
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    ${element}=    Get WebElement    ${locator}
    ${is_clicked}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    not ${is_clicked}
        Log    Click intercepted – scrolling more and retrying
        Scroll Element Into View    ${locator}
        Press Keys    None    PAGE_UP
        Click Element    ${locator}
    END

Wait And Double Click
    [Documentation]    Wait And Double Click
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    ${element}=    Get WebElement    ${locator}
    Set Focus To Element    ${locator}
    ${is_double_clicked}=    Run Keyword And Return Status    Double Click Element    ${locator}
    IF    not ${is_double_clicked}
        Log    Click intercepted – scrolling more and retrying
        Scroll Element Into View    ${locator}
        Press Keys    None    PAGE_UP
        Double Click Element    ${locator}
    END

### VALIDATION ###
Validate Field Type
    [Documentation]    Validate Field Type
    [Arguments]    ${webelement}    ${field_type}    ${value}
    Element Attribute Value Should Be    ${webelement}    ${field_type}    ${value}

Validate Input Field Value
    [Documentation]    Validate Input Field Value
    [Arguments]    ${locator}    ${expected_value}
    ${actual}=     Get Element Attribute    ${locator}    value
    Should Be Equal    ${actual}    ${expected_value}
