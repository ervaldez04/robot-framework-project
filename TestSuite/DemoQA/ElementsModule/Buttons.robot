*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Web Tables
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_Buttons
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Buttons Page

*** Test Cases ***
Validate when Double Click button is clicked
    [Documentation]    Double Click the button Double Click Me
    [Tags]    Regression    Positive
    Select Type Of Click for Double Click Me    ${DOUBLE_CLICK}
    Validate Button Message    ${DOUBLE_CLICK}

Validate when Right Click button is clicked
    [Documentation]    Right Click the button Right Click Me
    [Tags]    Regression    Positive
    Select Type Of Click for Right Click Me    ${RIGHT_CLICK}
    Validate Button Message    ${RIGHT_CLICK}

Validate when Click button is clicked
    [Documentation]    Click the button Click Me
    [Tags]    Regression    Positive
    Select Type Of Click for Click Me    ${CLICK}
    Validate Button Message    ${CLICK}

Validate when incorrect type of click is done in Double Click button
    [Documentation]    Click the button Double Click with incorrect type of click
    [Tags]    Regression    Negative
    Select Type Of Click for Double Click Me    ${CLICK}
    Validate Button Message Not Displayed

Validate when incorrect type of click is done in Right Click button
    [Documentation]    Click the button Right Click with incorrect type of click
    [Tags]    Regression    Negative
    Select Type Of Click for Right Click Me    ${DOUBLE_CLICK}
    Validate Button Message Not Displayed

Validate when incorrect type of click is done in Click Me button
    [Documentation]    Click the button Click Me with incorrect type of click
    [Tags]    Regression    Negative
    Select Type Of Click for Click Me    ${RIGHT_CLICK}
    Validate Button Message Not Displayed