Feature: Term level queries (exact terms)

  # Use: https://www.elastic.co/guide/en/elasticsearch/guide/current/_finding_multiple_exact_values.html

  Scenario: Find the pizzas that has "Bacon" or "Marinated Chicken" topping
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
                "Bacon"
              ]
            }
          },
          {
            "_source":{
              "topping":[
                "Meatballs",
                "Marinated Beef",
                "Bacon"
              ]
            }
          },
          {
            "_source":{
              "topping":[
                "Marinated Chicken"
              ]
            }
          }
        ]
      }
    }
    """
