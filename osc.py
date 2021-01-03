import json
from datetime import datetime
from apscheduler.schedulers.background import BackgroundScheduler
import requests


class API:
    packages = None

    def __init__(self):
        # Schedule metadata json for refresh once per 30 minutes
        scheduler = BackgroundScheduler()
        scheduler.add_job(func=self.load_packages, trigger="interval", minutes=30)
        scheduler.start()

    def load_packages(self):
        self.packages = json.loads(requests.get(f"https://api.oscwii.org/v2/primary/packages").text)

    def get_packages(self, developer=None):
        if developer:
            newpackages = []
            for package in self.packages:
                if package["coder"] == developer:
                    newpackages.append(package)
            return newpackages

        return self.packages

    def package_by_name(self, name):
        for package in self.packages:
            if package["internal_name"] == name:
                try:
                    package["release_date"] = datetime.fromtimestamp(int(package["release_date"])).strftime('%B %e, %Y at %R')
                except ValueError:
                    pass
                return package
