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
    try:
        return datetime.fromtimestamp(int(release_date)).strftime('%B %e, %Y')
    except ValueError:
        return release_date


def application_badges(package):
    badges = {}
    if "wwwwgcnsk" in package["controllers"]:
        badges["all-peripherals"] = "All Peripherals"

    if package["short_description"] == "No description provided.":
        badges["needs-no-description"] = "Needs no description"

    # check if added in the past 30 days
    if datetime.now().timestamp() - int(package["release_date"]) < 2592000:
        badges["recently-updated"] = "Recently Updated"

    return badges
