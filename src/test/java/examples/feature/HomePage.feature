
Feature: Test for the home page

    Background: Define URL
        Given url 'https://conduit-api.bondaracademy.com/api/'

    @debug @ignore
        Scenario: Get all tags
                Given path 'tags'
                When method Get
                Then status 200
                And match response.tags contains ['Test', 'GitHub']
                And match response.tags !contains 'truck' 
                And match response.tags == "#array"
                And match each response.tags == "#string"
        @smoke
        Scenario: Get 10 articles from the page
                Given params { limit: 10, offset: 0 }
                Given path 'articles'
                When method Get
                Then status 200
                And match response.articles == '#[10]'