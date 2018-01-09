Feature: Full text queries, term level queries and aggregations combined

  Scenario: Find pizzas with a name that contains the word "California" and then, for every topping, count the number of pizzas containing that topping
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
                   "name":"California Malibu"
                }
             },
             {
                "_source":{
                   "name":"California Meatballs"
                }
             },
             {
                "_source":{
                   "name":"California Sunset Chicken"
                }
             }
          ]
       },
       "aggregations":{
          "toppings":{
             "buckets":[
                {
                   "key":"Ham",
                   "doc_count":1
                },
                {
                   "key":"Marinated Chicken",
                   "doc_count":1
                },
                {
                   "key":"Meatballs",
                   "doc_count":1
                }
             ]
          }
       }
    }
    """
