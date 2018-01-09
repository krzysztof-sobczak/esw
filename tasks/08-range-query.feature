Feature: Range queries

  # For (>, >=, <, <=) use: https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-range-query.html#query-dsl-range-query

  Scenario: Find the pizzas with weight greater-than or equal to 1000 grams
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
              "weight":1015,
              "name":"Take Away Meat Lover"
            }
          }
        ]
      }
    }
    """
