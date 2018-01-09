import json
from behave import *
from nose.tools import eq_
from utils.data_structure.traverse import traverse_compare


@then('the response should contain')
def json_at_path(context):
    if 'response' in context:
        actual = context.response
        data = context.text or context.data
        expected = json.loads(data.decode('utf-8'))
        eq_(traverse_compare(expected, actual), [])
    else:
        context.scenario.skip()
