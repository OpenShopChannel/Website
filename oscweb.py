import json
import os

import sentry_sdk
from flask import Flask, render_template, request, abort, redirect, url_for
from flask_sitemap import Sitemap
from sentry_sdk.integrations.flask import FlaskIntegration
from werkzeug.urls import url_encode
import subprocess
import config
import pathlib

import osc
import utils
import events

if config.sentry_dsn:
    sentry_sdk.init(
        dsn=config.sentry_dsn,
        integrations=[FlaskIntegration()],

        # Set traces_sample_rate to 1.0 to capture 100%
        # of transactions for performance monitoring.
        # We recommend adjusting this value in production.
        traces_sample_rate=config.sample_rate
    )

OpenShopChannel = osc.API()
OpenShopChannel.load_packages()
OpenShopChannel.newest_apps()

app = Flask(__name__)
app.url_map.strict_slashes = False

sitemap = Sitemap(app)

# jinja2 functions
app.jinja_env.globals.update(file_size=utils.file_size)
app.jinja_env.globals.update(date=utils.date)
app.jinja_env.globals.update(application_badges=utils.application_badges)

# get current git info
try:
    script_path = pathlib.Path(__file__).parent.absolute()
    site_version = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=script_path).decode('ascii').strip()
    site_version_name = subprocess.check_output(['git', 'log', '-1', '--pretty=%B'], cwd=script_path).decode('ascii').strip()
except Exception as e:
    print(e)
    site_version = "No information."
    site_version_name = "No information."


@app.context_processor
def add_imports():
    # Note: we only define the top-level module names!
    return dict(events=events, siteconfig=config)


@app.route("/")
def home():
    # load ticker json
    if config.use_ticker_json:
        try:
            with open('settings/ticker.json') as f:
                ticker = json.load(f)
        except:
            ticker = []
    else:
        ticker = []

    return render_template('pages/home.html', package=OpenShopChannel.package_of_the_day,
                           newest_packages=OpenShopChannel.newest_packages, ticker=ticker)


@sitemap.register_generator
def home():
    yield 'home', {}


@app.route("/publish")
def publish():
    return render_template('pages/publish.html', packages=OpenShopChannel.get_packages())


@sitemap.register_generator
def publish():
    yield 'publish', {}


@app.route("/about")
def about():
    return render_template('pages/about.html', version=site_version, version_name=site_version_name)


@sitemap.register_generator
def about():
    yield 'about', {}


@app.route("/faq")
def faq():
    # Now a redirect to the new FAQ page
    return redirect(url_for('help', article='faq'), 301)


@app.route("/help")
@app.route("/help/<article>")
def help(article="welcome"):
    # check if article exists
    if article + ".html" not in os.listdir("templates/pages/help/articles"):
        abort(404)
    return render_template(f'pages/help/articles/{article}.html', name=article)


@sitemap.register_generator
def help():
    for article in os.listdir("templates/pages/help/articles"):
        yield 'help', {'article': article.replace(".html", "")}


@app.route("/donate")
def donate():
    return render_template('pages/donate.html')


@sitemap.register_generator
def donate():
    yield 'donate', {}


# april fools 2021 route
@app.route("/browser")
def aprilfools21():
    return render_template('pages/aprilfools21.html')


@app.route("/beta")
def beta():
    # return 404 if not betasite redirect
    if request.args.get("redirect") not in ["betasite", "oscdlbrowser", "theme"]:
        abort(404)
    return render_template('pages/beta.html')


@app.route("/tools/metaxml")
def metagen():
    return render_template('pages/metagen.html')


@sitemap.register_generator
def metagen():
    yield 'metagen', {}


@app.route("/library")
def apps():
    return render_template('pages/newlibrary.html', newest_packages=OpenShopChannel.newest_packages)


@sitemap.register_generator
def apps():
    yield 'apps', {}


@app.route("/library/app/<name>")
def application(name):
    # check if app exists
    if OpenShopChannel.package_by_name(name):
        category = OpenShopChannel.package_by_name(name)["category"]
        color = "info"
        if category == "utilities":
            color = "info"
        elif category == "emulators":
            color = "success"
        elif category == "games":
            color = "danger"
        elif category == "media":
            color = "warning"
        return render_template('pages/app.html', package=OpenShopChannel.package_by_name(name),
                               packages=OpenShopChannel.get_packages(), color=color)
    return abort(404)


@app.route("/library/theme/<name>")
def theme(name):
    return redirect(url_for('beta', redirect="theme"))


@sitemap.register_generator
def application():
    for package in OpenShopChannel.get_packages():
        yield 'application', {'name': package["slug"]}


@app.template_global()
def modify_query(**new_values):
    args = request.args.copy()

    for key, value in new_values.items():
        args[key] = value

    return '{}?{}'.format(request.path, url_encode(args))


@app.errorhandler(404)
def page_not_found(e):
    return render_template('error/404.html'), 404


@app.errorhandler(500)
def internal_server_error(e):
    return render_template('error/500.html'), 500


if __name__ == '__main__':
    app.run(port=config.port)
