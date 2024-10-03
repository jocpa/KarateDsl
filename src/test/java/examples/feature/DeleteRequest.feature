
Feature: Post Request

    Background: Define URL
        Given url 'https://conduit-api.bondaracademy.com/api/'
        Given path 'users/login'
        And request {"user": {"email": "test@prueba.com", "password": "Prueba1"}}
        When method Post
        Then status 200
        * def token = response.user.token

        @delete
        Scenario: Login       
                Given header Authorization = 'Token ' + token
                Given path 'articles'
                And request {"article": {"tagList": [], "title": "Delete Article","description": "Esto es una descripcion", "body": "Este es el cuerpo del articulo"}}
                When method Post
                Then status 201
                * articleId = response.article.slug

                Given params { limit: 10, offset: 0 }
                Given path 'articles'
                When method Get
                Then status 200
                And match response.articles[0].title == "Delete Article

                Given header Authorization = 'Token ' + token
                Given path 'articles',articleId
                When method Delete
                Then status 204
