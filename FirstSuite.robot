*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.imdb.com/
${BROWSER}        chrome
${MOVIENAME}      The Shawshank Redemption




*** Test Cases ***
TestCase1
    [Documentation]    Verify user can search for a movie on the IMDb homepage
    [Tags]    search
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Button    suggestion-search
    Input Text    css=#suggestion-search    ${MOVIENAME}
    Click Button    css=#suggestion-search-button
    Wait Until Page Contains Element    xpath=//*[@id="__next"]/main/div[2]/div[3]/section/div/div[1]/section[2]/div[2]    timeout=10s
    ${Search Results} =    Get WebElements    xpath=//*[@id="__next"]/main/div[2]/div[3]/section/div/div[1]/section[2]/div[2]/ul/li[1]/div[2]/div/a
    ${First Result Text}=    Get Text    ${Search Results}[0]
    Should Contain    ${First Result Text}    ${MOVIENAME}

    [Teardown]    Close Browser
