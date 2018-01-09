Feature: Pagination

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-from-size.html

  Scenario: Get the last five pizzas
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
               "topping": [
                  "Pepperoni"
               ],
               "id": 4,
               "weight": 590,
               "name": "Double Pepperoni"
            }
         },
         {
            "_source": {
               "topping": [
                  "Meatballs",
                  "Marinated Beef",
                  "Bacon"
               ],
               "id": 6,
               "weight": 1015,
               "name": "Take Away Meat Lover"
            }
         },
         {
            "_source": {
               "topping": [
                  "Marinated Chicken"
               ],
               "id": 1,
               "weight": 680,
               "name": "California Sunset Chicken"
            }
         },
         {
            "_source": {
               "topping": [
                  "Beef"
               ],
               "id": 7,
               "weight": 610,
               "name": "New York Grilled Steak"
            }
         },
         {
            "_source": {
               "topping": [
                  "Ham"
               ],
               "id": 3,
               "weight": 580,
               "name": "Classic American"
            }
         }
      ]
      }
    }
    """