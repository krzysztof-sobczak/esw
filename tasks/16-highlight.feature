Feature: Highlighting matched terms

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-highlighting.html

  Scenario: Find the pizzas with a name that contains the word "Bacon" and highlight the word "Bacon"
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
       "hits":{
          "total":1,
          "hits": [
             {
                "_source": {
                   "topping": [
                      "Bacon"
                   ],
                   "id": 2,
                   "weight": 680,
                   "name": "American Bacon"
                },
                "highlight": {
                   "name": [
                      "American <em>Bacon</em>"
                   ]
                }
             }
          ]
       }
    }
    """