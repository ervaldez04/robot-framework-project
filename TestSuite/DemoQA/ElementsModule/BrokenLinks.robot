*** Settings ***
Documentation     Test Case for Demo QA - Elements Module - Broken Links
Resource          ../../../Configurations/ImportFileSource/DemoQA.robot
Test Tags         DemoQA_Elements_BrokenLinks
Suite Setup       Open Browser With Options   ${DEMO_QA}    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close All Browsers
Test Setup        Navigate To Broken Links Page

*** Test Cases ***
Validate when Valid Link is clicked
    [Documentation]    Valid Link is clicked
    Click Valid Link
    Validate Redirected To Certain Page

Validate when Invalid Link is clicked
    [Documentation]    Invalid Link is clicked
    Click Invalid Link
    Validate Redirected To Certain Page    ${False}