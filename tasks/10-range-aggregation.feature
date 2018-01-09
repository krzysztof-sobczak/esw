Feature: Aggregations

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-range-aggregation.html

  # Note that the name of the bucket aggregation in the response (weight_ranges) is the one used in the query.

  Scenario: Find out how many pizzas have a weight between 0-500, 500-1000, and 1000-1500 grams
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "aggregations":{
        "weight_ranges":{
          "buckets":[
            {
              "to":500,
              "doc_count":0
            },
            {
              "from":500,
              "to":1000,
              "doc_count":9
            },
            {
              "from":1000,
              "doc_count":1
            }
          ]
        }
      }
    }
    """