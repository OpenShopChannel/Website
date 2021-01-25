import json
import random
from datetime import datetime
from apscheduler.schedulers.background import BackgroundScheduler
import requests


def filter_packages(packages, developer=None, category=None):
    newpackages = []
    for package in packages:
        if developer:
            if package["coder"] == developer:
                if category:
                    if package["category"] == category:
                        newpackages.append(package)
                        return newpackages
                newpackages.append(package)
                return newpackages
        elif category:
            if package["category"] == category:
                newpackages.append(package)
        else:
            newpackages.append(package)

    return newpackages

class API:
    packages = None
    themes_packages = None
    package_of_the_day = None

    def __init__(self):
        scheduler = BackgroundScheduler()
        # Schedule packages list for refresh once per 30 minutes
        scheduler.add_job(func=self.load_packages, trigger="interval", minutes=30)
        # Schedule app of the day for refresh once per day at 2:00
        scheduler.add_job(func=self.set_package_of_the_day, trigger='cron', hour='2', minute='00')
        scheduler.start()

    def load_packages(self):
        self.packages = json.loads(requests.get(f"https://api.oscwii.org/v2/primary/packages").text)
        self.themes_packages = json.loads(requests.get(f"https://api.oscwii.org/v2/themes/packages").text)

    def get_packages(self, developer=None, category=None):
        return filter_packages(packages=self.packages, developer=developer, category=category)

    def get_themes(self, developer=None, category=None):
        return filter_packages(packages=self.themes_packages, developer=developer, category=category)

    def package_by_name(self, name):
        for package in self.packages:
            if package["internal_name"] == name:
                try:
                    package["release_date"] = datetime.fromtimestamp(int(package["release_date"])).strftime(
                        '%B %e, %Y at %R')
                except ValueError:
                    pass
                return package

    def theme_by_name(self, name):
        for package in self.themes_packages:
            if package["internal_name"] == name:
                try:
                    package["release_date"] = datetime.fromtimestamp(int(package["release_date"])).strftime(
                        '%B %e, %Y at %R')
                except ValueError:
                    pass
                return package

    def set_package_of_the_day(self):
        # some quality assurance, some of the apps have covid
        while True:
            package = random.choice(self.packages)
            # they do not have covid, just did not specify a description
            if package["short_description"] == "No description provided.":
                continue
            # they do not have covid, just simply a demo and we can't have that
            if package["category"] == "demos":
                continue
            # they do not have covid, but don't support wii remotes
            if "w" not in package["controllers"]:
                continue
            # they do not have covid, but the developer is Danbo
            if package["coder"] == "Danbo":
                continue
            break
        self.package_of_the_day = package
