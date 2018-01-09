Feature: Aggregations

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-metrics-stats-aggregation.html

  Scenario: Calculate the pizzas min, max, total, and avg weight
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "aggregations":{
        "weight_stats":{
          "min":580,
          "max":1015,
          "avg":672.5,
          "sum":6725
        }
      }
    }
    """