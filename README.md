# RobotFramework-Selenium
Given the below three scenarios, i was able to create one Test Suite containing 3 Test cases
, where i added the suitable test scripts that can confirm the success of these scenarios 
using Robot Framework for automated testing.

Below are the three scenarios that will be tested:

**Scenario 1:** Verify user can search for a movie on the IMDb homepage

● Given that the user is on the IMDb homepage "https://www.imdb.com/"

● When the user enters a search query "The Shawshank Redemption" (or any other movie
name) in the search bar.

● And clicks the search button

● Then the search results page should display movies related to the search query.

● And the first search result should be "The Shawshank Redemption" movie i.e. the name
written in the search query.


___________________________________________

**Scenario 2:** Verify user can access the top-rated movies section

● Given that the user is on the IMDb homepage "https://www.imdb.com/".

● When the user clicks on the "Top 250 Movies" link in the header.

● Then the user should be directed to the Top 250 Movies movies section page.

● And the page should display a list of the Top 250 Movies.

● And the first movie in the list should be "The Shawshank Redemption"


_____________________________________________

**Scenario3:** Verify user can search for movies released in a specific year on IMDb

● Given that the user is on the IMDb homepage "https://www.imdb.com/"

● When the user clicks on the "Advanced Search" link in the search bar filter

● The user would then be redirected to a page containing “Advanced Title Search” link,
which he should click.

● And selects "Feature Film" as title type

● And selects the “Action” genre from Genres.

● And enters a start year and end year in the "Release Date" fields (2010 - 2020).

● And clicks the "Search" button

● Then the search results page should display a list of Action movies released between
2010 and 2020, sorted by User Rating (Higher ratings appear first, i.e. descendingly).

______________________________________________