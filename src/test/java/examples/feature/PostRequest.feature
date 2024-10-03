
Feature: Post Request

    Background: Define URL
        Given url 'https://conduit-api.bondaracademy.com/api/'
        Given path 'users/login'
        And request {"user": {"email": "test@prueba.com", "password": "Prueba1"}}
        When method Post
        Then status 200
        * def token = response.user.token

        Scenario: Login       
                Given header Authorization = 'Token ' + token
                Given path 'articles'
                And request {"article": {"tagList": [], "title": "Test3","description": "Esto es una descripcion", "body": "Este es el cuerpo del articulo"}}
                When method Post
                Then status 201
                And match response.article.title == 'Test3'