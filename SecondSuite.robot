*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.imdb.com/
${BROWSER}        chrome
${MOVIENAME}      The Shawshank Redemption


*** Test Cases ***
TestCase
    [Documentation]    Verify user can access the top-rated movies section
    [Tags]    top rated movies
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath=//*[@id="imdbHeader-navDrawerOpen"]
    Wait Until Element Is Visible    xpath=//*[@id="imdbHeader"]/div[2]/aside
    Click Element    xpath=//*[@id="imdbHeader"]/div[2]/aside/div/div[2]/div/div[1]/span/div/div/ul/a[2]
    ${Result} =    Get WebElements    xpath=//*[@id="main"]/div/span/div/div/div[3]/table/tbody/tr[1]/td[2]/a
    ${Result Text}=    Get Text    ${Result}
    Should Contain    ${Result Text}    ${MOVIENAME}

    [Teardown]    Close Browser
