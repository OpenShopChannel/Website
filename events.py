import json
from datetime import datetime


def is_event_running():
    """
    Checks if event is running
    :return: bool
    """
    with open('settings/events.json') as f:
        events = json.load(f)
        for event in events:
            # check if today is after an event's start date
            if datetime.fromtimestamp(event["startTime"]).date() <= datetime.today().date():
                # check if today is before an event's end date
                if datetime.fromtimestamp(event["endTime"]).date() >= datetime.today().date():
                    return True


def current_event():
    """
    Returns current event
    :return: dict
    """
    with open('settings/events.json') as f:
        events = json.load(f)
        for event in events:
            # check if today is after an event's start date
            if datetime.fromtimestamp(event["startTime"]).date() <= datetime.today().date():
                # check if today is before an event's end date
                if datetime.fromtimestamp(event["endTime"]).date() >= datetime.today().date():
                    return event
        return None
