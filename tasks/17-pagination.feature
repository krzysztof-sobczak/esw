Feature: Pagination

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-from-size.html

  Scenario: Get the first five pizzas
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
       "hits":{
         "hits": [
         {
            "_source": {
               "topping": [],
               "id": 5,
               "weight": 580,
               "name": "Triple Cheese"
            }
         },
         {
            "_source": {
               "topping": [
                  "Chorizo"
               ],
               "id": 8,
               "weight": 630,
               "name": "Meat lover"
            }
         },
         {
            "_source": {
               "topping": [
                  "Ham"
               ],
               "id": 9,
               "weight": 680,
               "name": "California Malibu"
            }
         },
         {
            "_source": {
               "topping": [
                  "Meatballs"
               ],
               "id": 10,
               "weight": 680,
               "name": "California Meatballs"
            }
         },
         {
            "_source": {
               "topping": [
                  "Bacon"
               ],
               "id": 2,
               "weight": 680,
               "name": "American Bacon"
            }
         }
      ]
      }
    }
    """