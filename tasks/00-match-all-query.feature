Feature: The most simple query

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-all-query.html

  Scenario: Find all the pizzas
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "hits":{
        "total":10,
        "hits":[
          {
            "_source":{
              "topping":[

              ],
              "id":5,
              "weight":580,
              "name":"Triple Cheese"
            }
          },
          {
            "_source":{
              "topping":[
                "Chorizo"
              ],
              "id":8,
              "weight":630,
              "name":"Meat lover"
            }
          },
          {
            "_source":{
              "topping":[
                "Ham"
              ],
              "id":9,
              "weight":680,
              "name":"California Malibu"
            }
          },
          {
            "_source":{
              "topping":[
                "Meatballs"
              ],
              "id":10,
              "weight":680,
              "name":"California Meatballs"
            }
          },
          {
            "_source":{
              "topping":[
                "Bacon"
              ],
              "id":2,
              "weight":680,
              "name":"American Bacon"
            }
          },
          {
            "_source":{
              "topping":[
                "Pepperoni"
              ],
              "id":4,
              "weight":590,
              "name":"Double Pepperoni"
            }
          },
          {
            "_source":{
              "topping":[
                "Meatballs",
                "Marinated Beef",
                "Bacon"
              ],
              "id":6,
              "weight":1015,
              "name":"Take Away Meat Lover"
            }
          },
          {
            "_source":{
              "topping":[
                "Marinated Chicken"
              ],
              "id":1,
              "weight":680,
              "name":"California Sunset Chicken"
            }
          },
          {
            "_source":{
              "topping":[
                "Beef"
              ],
              "id":7,
              "weight":610,
              "name":"New York Grilled Steak"
            }
          },
          {
            "_source":{
              "topping":[
                "Ham"
              ],
              "id":3,
              "weight":580,
              "name":"Classic American"
            }
          }
        ]
      }
    }
    """