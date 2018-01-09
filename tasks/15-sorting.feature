Feature: Sorting

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-sort.html

  Scenario: Sort all the pizzas by weight in descending order
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
             "weight":1015,
             "name":"Take Away Meat Lover"
           },
           "sort":[
             1015
           ]
         },
         {
           "_source":{
             "weight":680,
             "name":"California Malibu"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "weight":680,
             "name":"California Meatballs"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "weight":680,
             "name":"American Bacon"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "weight":680,
             "name":"California Sunset Chicken"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "weight":630,
             "name":"Meat lover"
           },
           "sort":[
             630
           ]
         },
         {
           "_source":{
             "weight":610,
             "name":"New York Grilled Steak"
           },
           "sort":[
             610
           ]
         },
         {
           "_source":{
             "weight":590,
             "name":"Double Pepperoni"
           },
           "sort":[
             590
           ]
         },
         {
           "_source":{
             "weight":580,
             "name":"Triple Cheese"
           },
           "sort":[
             580
           ]
         },
         {
           "_source":{
             "weight":580,
             "name":"Classic American"
           },
           "sort":[
             580
           ]
         }
       ]
      }
    }
    """