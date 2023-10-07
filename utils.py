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
    # check if added in the past 30 days
    if datetime.now().timestamp() - int(package["release_date"]) < 2592000:
        badges["recently-updated"] = "Recently Updated"

    # check if the app has a birthday
    if datetime.fromtimestamp(int(package["release_date"])).strftime('%m%d') == datetime.now().strftime('%m%d'):
        # verify that it was not added today
        if datetime.fromtimestamp(int(package["release_date"])).strftime('%Y%m%d') != datetime.now().strftime('%Y%m%d'):
            # determine app age
            age = int((datetime.now().timestamp() - int(package["release_date"])) / 31536000)

            # determine st/nd/rd/th
            if age % 10 == 1 and age % 100 != 11:
                age = str(age) + "st"
            elif age % 10 == 2 and age % 100 != 12:
                age = str(age) + "nd"
            elif age % 10 == 3 and age % 100 != 13:
                age = str(age) + "rd"
            else:
                age = str(age) + "th"
            badges["birthday-app"] = f"Happy {age} Birthday, {package['name']}!"

    return badges
