Feature: Term level queries (exact terms)

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-term-query.html

  # Extra info: As you can see from the elasticsearch documentation, string
  # fields should be set to index:true when using term queries. We have
  # already done this for 'topping' in mapping.json.

  # Can you figure out the difference between "match" and "term"?

  Scenario: Find the pizzas that has "Marinated Beef" topping
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
                "Meatballs",
                "Marinated Beef",
                "Bacon"
              ],
              "name":"Take Away Meat Lover"
            }
          }
        ]
      }
    }
    """
