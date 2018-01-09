import time
import logging
import json

from app import create_app
from tasks.results import print_overview_errors, print_overview_features

app = create_app()

logging.getLogger('elasticsearch.trace').addHandler(logging.NullHandler())


def before_scenario(context, scenario):
    context.client = app.test_client()
    context.ctx = app.test_request_context()
    context.ctx.push()
    context.app = app


def after_scenario(context, scenario):
    context.ctx.pop()


def before_all(context):
    context.start = time.time()
    context.errors = []
    context.features = []

    # Custom mapping
    with open('data/mapping.json') as data_file:
        mapping = json.load(data_file)
        app.elasticsearch.indices.delete(index='workshop', ignore=[400, 404])
        app.elasticsearch.indices.create(index='workshop')
        app.elasticsearch.indices.put_mapping(index="workshop", doc_type="pizza", body=mapping)
        app.elasticsearch.cluster.health(wait_for_status='yellow', request_timeout=1000)

    # Index the pizzas
    with open('data/documents.json') as data_file:
        data = json.load(data_file)
        for entry in data:
            app.elasticsearch.index(index="workshop", doc_type="pizza", id=entry['id'], body=entry)
        app.elasticsearch.indices.refresh(index='workshop')


def after_all(context):
    print_overview_features(context.features)
    print_overview_errors(context.errors)
    print("Total time: %s \n" % str(time.time() - context.start))


def after_feature(context, feature):
    context.features.append(feature)


def after_step(context, step):
    if step.status == 'failed':
        context.errors.append(step)
