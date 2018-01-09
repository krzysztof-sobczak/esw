from terminaltables import AsciiTable
from colorclass import Color, Windows
import os

if os.name == 'nt':
    Windows.enable(auto_colors=True, reset_atexit=True)

def colored_status(status, text):
    if status == u'passed':
        return Color('{autogreen}%s{/autogreen}' % text)
    elif status == u'skipped':
        return Color('{autocyan}%s{/autocyan}' % text)
    else:
        return Color('{autored}%s{/autored}' % text)


def two_decimals(number):
    return "{0:.2f}".format(number)


def print_overview_features(features):
    table_data = [['Feature', 'Status', 'Scenario', 'Duration']]
    for feature in features:
        for scenario in feature.scenarios:
            # Hack for the workshop
            status = scenario.status
            if status == 'skipped':
                status = 'todo'
            table_data.append([feature.filename,
                               status,
                               colored_status(scenario.status, scenario.name),
                               two_decimals(scenario.duration)])
    table = AsciiTable(table_data)
    print(table.table)


def print_overview_errors(errors):
    print("Errors: %s" % len(errors))

    for error in errors:
        table_data = [
            ['Feature', 'Step', 'Line'],
            [error.filename, error.name, str(error.line)]
        ]
        table = AsciiTable(table_data)
        print(table.table)
        print("Error: \n")
        print(error.exception)
        print("\n")
        print(error.error_message)
