*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String

*** Variables ***
${URL}            https://www.imdb.com/
${BROWSER}        chrome
${START_DATE}     2010
${END_DATE}       2020

${Genre}          Action


*** Test Cases ***
TestCase
    [Documentation]    Verify user can search for movies released in a specific genre on IMDb
    [Tags]    Adv Search
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath=//*[@id="nav-search-form"]/div[1]/div/label
    Wait Until Element Is Visible    xpath=//*[@id="navbar-search-category-select-contents"]/ul/a
    Click Element    xpath=//*[@id="navbar-search-category-select-contents"]/ul/a
    Click Element    xpath=//*[@id="main"]/div[2]/div[1]/a
    Click Element    //*[@id="title_type-1"]
    Click Element    xpath=//*[@id="genres-1"]
    Input Text    xpath=//*[@id="main"]/div[3]/div[2]/input[1]    ${START_DATE}
    Input Text    xpath=//*[@id="main"]/div[3]/div[2]/input[2]    ${END_DATE}
    Click Button    xpath=//*[@id="main"]/p[3]/button
    @{geners}=    Get WebElements    class:genre
    FOR    ${genre}    IN    @{geners}
        ${genre_text}    get text    ${genre}
        Should Contain    ${genre_text}    Action
    END










    [Teardown]    Close Browser

TestCaseYear
    [Documentation]    Verify user can search for movies released in a specific year on IMDb
    [Tags]    adv search
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath=//*[@id="nav-search-form"]/div[1]/div/label
    Wait Until Element Is Visible    xpath=//*[@id="navbar-search-category-select-contents"]/ul/a
    Click Element    xpath=//*[@id="navbar-search-category-select-contents"]/ul/a
    Click Element    xpath=//*[@id="main"]/div[2]/div[1]/a
    Click Element    //*[@id="title_type-1"]
    Click Element    xpath=//*[@id="genres-1"]
    Input Text    xpath=//*[@id="main"]/div[3]/div[2]/input[1]    ${START_DATE}
    Input Text    xpath=//*[@id="main"]/div[3]/div[2]/input[2]    ${END_DATE}
    Click Button    xpath=//*[@id="main"]/p[3]/button
    @{years}=    Get WebElements    xpath=//span[@class='lister-item-year text-muted unbold']
    FOR    ${year}    IN    @{years}
        ${year_text}    get text    ${year}
        ${year_text}=    Remove String    ${year_text}    (    )    I
        ${year_text}=    convert to number    ${year_text.strip('$')}
        Should Be True    2010 <= ${year_text} <= 2020
    END


    [Teardown]    Close Browser

TestCaseRate
    [Documentation]    Verify user can search for movies released in a specific genre and year orderd based on rate or not
    [Tags]    adv search
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath=//*[@id="nav-search-form"]/div[1]/div/label
    Wait Until Element Is Visible    xpath=//*[@id="navbar-search-category-select-contents"]/ul/a
    Click Element    xpath=//*[@id="navbar-search-category-select-contents"]/ul/a
    Click Element    xpath=//*[@id="main"]/div[2]/div[1]/a
    Click Element    //*[@id="title_type-1"]
    Click Element    xpath=//*[@id="genres-1"]
    Input Text    xpath=//*[@id="main"]/div[3]/div[2]/input[1]    ${START_DATE}
    Input Text    xpath=//*[@id="main"]/div[3]/div[2]/input[2]    ${END_DATE}
    Click Button    xpath=//*[@id="main"]/p[3]/button
    @{Rates}=    Get WebElements    name = ir
    ${original_rates}=    Create List
    FOR    ${Rate}    IN    @{Rates}
        ${rate_attr}=    get text    ${Rate}
        ${rate_attr}=    convert to number    ${rate_attr.strip('$')}
        Append To List    ${original_rates}    ${rate_attr}
    END
    ${copied_rates}=    Copy List    ${original_rates}
    Sort List    ${copied_rates}
    Lists Should Be Equal    ${copied_rates}    ${original_rates}





    [Teardown]    Close Browser
