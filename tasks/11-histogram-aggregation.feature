Feature: Aggregations

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-histogram-aggregation.html

  # Note that the name of the bucket aggregation in the response (by_weight) is the one used in the query.    

  Scenario: Make a histogram of the pizzas weight with an interval of 100
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "aggregations":{
        "by_weight":{
          "buckets":[
            {
              "key":500,
              "doc_count":3
            },
            {
              "key":600,
              "doc_count":6
            },
            {
              "key":700,
              "doc_count":0
            },
            {
              "key":800,
              "doc_count":0
            },
            {
              "key":900,
              "doc_count":0
            },
            {
              "key":1000,
              "doc_count":1
            }
          ]
        }
      }
    }
    """