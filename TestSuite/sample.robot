*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://google.com
${BROWSER}    Chrome

*** Test Cases ***
Open Example In Browser
    [Documentation]    Open example.com in the chosen browser
    Open Browser    ${URL}    ${BROWSER}
    Close Browser