Feature: Aggregations

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-metrics-sum-aggregation.html

  # Note that the name of the bucket aggregation in the response (total_weight) is the one used in the query.

  Scenario: Calculate the pizzas total weight
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "aggregations":{
        "total_weight":{
          "value":6725
        }
      }
    }
    """