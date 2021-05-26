# Returns readable file size from file length
from datetime import datetime


def file_size(length):
    for unit in ['', 'K', 'M', 'G', 'T', 'P', 'E', 'Z']:
        if abs(length) < 1000.0:
            return "%3.1f%s%s" % (length, unit, "B")
        length /= 1000.0

    return "%.1f%s%s" % (length, 'Yi', "B")


# Returns human date
def date(release_date):
    return datetime.fromtimestamp(int(release_date)).strftime('%B %e, %Y')
