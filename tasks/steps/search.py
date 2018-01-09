import json
from behave import *


@given(u'all pizzas are indexed')
def step_impl(context):
    pass


@when(u'I make a query')
def step_impl(context):
    data = context.text or context.data
    if data.strip() != '{ todo }':
        body = json.loads(data.decode('utf-8'))
        context.response = context.app.elasticsearch.search(index="workshop", body=body)
