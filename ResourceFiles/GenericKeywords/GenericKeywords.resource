### Note: arrange alhabetically ###
*** Settings ***
Documentation     Generic Keywords that can be used in any testing site
Resource          ../../Configurations/ImportGenericFile/GenericFile.robot

*** Keywords ***
Wait And Click
    [Documentation]    Wait And Click
    ...    Use Click Element instead of Click Button / Click Link (it is universal)
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    ${element}=    Get WebElement    ${locator}
    Scroll Element Into View    ${locator}
    Press Keys    None    PAGE_DOWN
    Press Keys    None    PAGE_DOWN
    # Press Keys    None    PAGE_UP
    ${is_clicked}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    not ${is_clicked}
        Log    Click intercepted – scrolling more and retrying
        Press Keys    None    PAGE_UP
        # Press Keys    None    PAGE_UP
        Click Element    ${locator}
    END

    # Run Keyword If    '${is_clicked}'=='${True}'    Log    Click Element is used
    # ...    ELSE    Run Keywords    Execute Javascript    arguments[0].scrollIntoView({block: 'center'});    ${element}
    # ...    AND    Execute Javascript    arguments[0].click();    ${element}
    # Execute Javascript    arguments[0].click();    ${locator}
    # Click Element    ${locator}

# ### For Flaky ###
# Wait And Click With Retry
#     [Documentation]    Retries click once if the first click fails due to animation or overlay.
#     [Arguments]    ${locator}    ${timeout}=10s
#     Wait Until Element Is Visible    ${locator}    ${timeout}
#     Wait Until Element Is Enabled    ${locator}    ${timeout}
#     Scroll Element Into View    ${locator}
#     Run Keyword And Ignore Error    Click Element    ${locator}
#     Sleep    500ms
#     Click Element    ${locator}

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
    [Arguments]    ${url}    ${browser}    ${headless}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # ${options}=    Evaluate    __import__("selenium.webdriver").webdriver.ChromeOptions()
    ### Run Headless ###
    Run Keyword If    '${headless}'=='${True}'    Call Method    ${options}    add_argument    --headless=new
    Run Keyword If    '${headless}'=='${True}'    Call Method    ${options}    add_argument    --remote-allow-origins
    Run Keyword If    '${headless}'=='${True}'    Call Method    ${options}    add_argument    --disable-gpu
    ### Run in Continuous Integration ###
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-setuid-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    ${ci}=    Get Environment Variable    CI    default=${False}
    IF    '${ci}'=='${True}'
        Call Method    ${options}    add_argument    --disable-extensions-except=${EXECDIR}\\Resources\\Extensions\\ublock
        Call Method    ${options}    add_argument    --load-extension=${EXECDIR}\\extensions\\ublock
    END
    ### Set window size ###
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    ### Disable Google Password Manager ###
    Call Method    ${options}    add_argument    --disable-automation-extension
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --incognito
    Log    ${options}

    # Create WebDriver    ${WEBDRIVER_CHROME}    options=${options}

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
