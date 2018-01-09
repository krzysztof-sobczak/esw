Feature: Full text and term level queries combined

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-bool-query.html

  Scenario: Find the pizzas with a name that contains the word "California" and that has "Meatballs" topping
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
        "hits":[
          {
            "_source":{
              "topping":[
                "Meatballs"
              ],
              "name":"California Meatballs"
            }
          }
        ]
      }
    }
    """