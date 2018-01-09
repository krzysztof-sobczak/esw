Feature: Aggregations

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-terms-aggregation.html

  Scenario: For every topping, count the number of pizzas containing that topping
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "aggregations":{
        "toppings":{
          "buckets":[
            {
              "key":"Bacon",
              "doc_count":2
            },
            {
              "key":"Ham",
              "doc_count":2
            },
            {
              "key":"Meatballs",
              "doc_count":2
            },
            {
              "key":"Beef",
              "doc_count":1
            },
            {
              "key":"Chorizo",
              "doc_count":1
            },
            {
              "key":"Marinated Beef",
              "doc_count":1
            },
            {
              "key":"Marinated Chicken",
              "doc_count":1
            },
            {
              "key":"Pepperoni",
              "doc_count":1
            }
          ]
        }
      }
    }
    """