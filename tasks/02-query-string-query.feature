Feature: Full text queries

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html

  Scenario: Find the pizzas that contains the words "Bacon" or "Lover"
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "hits":{
        "total":3,
        "hits":[
          {
            "_source":{
              "topping":[
                "Meatballs",
                "Marinated Beef",
                "Bacon"
              ],
              "name":"Take Away Meat Lover"
            }
          },
          {
            "_source":{
              "topping":[
                "Chorizo"
              ],
              "name":"Meat lover"
            }
          },
          {
            "_source":{
              "topping":[
                "Bacon"
              ],
              "name":"American Bacon"
            }
          }
        ]
      }
    }
    """