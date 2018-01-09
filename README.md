# Elasticsearch Workshop  
 
Workshop consists of 19 tasks for learning how to write [Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html).

During these tasks you will learn how to do:

* [Match all](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-all-query.html) (task 0) 						
* [Full-text search](https://www.elastic.co/guide/en/elasticsearch/reference/current/full-text-queries.html) (task 1-4)
* [Filtering](https://www.elastic.co/guide/en/elasticsearch/reference/current/term-level-queries.html) (task 5-8)
* [Aggregations](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations.html) (task 9-13)
* Combine full-text search and aggregations (task 14)
* [Sorting](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-sort.html) (task 15)
* [Highlightning](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-highlighting.html) (task 16)
* [Pagination](https://www.elastic.co/guide/en/elasticsearch/guide/current/pagination.html) (task 17-18) 

## Pizzas

The data that are used during the workshop is a list of pizzas, see [data/documents.json](data/documents.json).
 
### Mapping

[Mapping](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html) is the process of defining how a document, and the fields it contains, are stored and indexed.

The pizzas has the mapping:

```
{
  "pizza": {
    "properties": {
      "id": {
        "type": "long"
      },
      "name": {
        "type": "text"
      },
      "topping": {
        "type": "text",
        "index": "true"
      },
      "weight": {
        "type": "long"
      }
    }
  }
}
```
## Tasks

The [tasks](tasks) are based on feature tests, and they look like this:

```
Feature: Topic of the task
 
 // Use reference to documentation
 
 Scenario: Description of the task
  Given all pizzas are indexed
  When I make a query
  """
  { todo }
  """
  Then the response should contain
  """
  { subset }
  """
```

Your task is to replace the `{ todo }` with the correct query.  

The comment `use https://...` points you to the page where you can find information about how to write the correct query. 

A query needs to return a correct response `{ subset }` to be passed. To make the tests more compact and easy to read, they only compare and validates against a `{ subset }`. 

## Initializing workshop

```bash
make init
```

## Verifying task solutions

```bash
make solve
```

## Evaluating queries and exploring with Kibana

1. Access [localhost:5601](localhost:5601) in order to open Kibana.
2. Go to `Dev tools` tab
3. Execute Elasticsearch queries

Example query in Kibana:
```
GET /workshop/pizza/_search
{
  "query": {
    "match_all": {}
  }
}
```