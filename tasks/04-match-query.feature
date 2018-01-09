Feature: Full text queries

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-query.html

  Scenario: Find the pizzas with a name that contains the word "Meatballs"
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
              "name":"California Meatballs"
            }
          }
        ]
      }
    }
    """
