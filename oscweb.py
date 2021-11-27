import json

import sentry_sdk
from flask import Flask, render_template, request, abort, redirect
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
OpenShopChannel.set_package_of_the_day()
OpenShopChannel.newest_apps()

app = Flask(__name__)
app.url_map.strict_slashes = False

# jinja2 functions
app.jinja_env.globals.update(file_size=utils.file_size)
app.jinja_env.globals.update(date=utils.date)

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


@app.route("/publish")
def publish():
    return render_template('pages/publish.html', packages=OpenShopChannel.get_packages(),
                           themes=OpenShopChannel.get_themes())


@app.route("/feedback")
def feedback():
    return render_template('pages/feedback.html')


@app.route("/about")
def about():
    return render_template('pages/about.html', version=site_version, version_name=site_version_name)


@app.route("/faq")
def faq():
    return render_template('pages/faq.html')


@app.route("/donate")
def donate():
    return render_template('pages/donate.html')


# april fools 2021 route
@app.route("/browser")
def aprilfools21():
    return render_template('pages/aprilfools21.html')


@app.route("/beta")
def beta():
    # return 404 if not betasite redirect
    if request.args.get("redirect") != "betasite":
        if request.args.get("redirect") != "oscdlbrowser":
            abort(404)
    return render_template('pages/beta.html')


@app.route("/tools/metaxml")
def metagen():
    return render_template('pages/metagen.html')


@app.route("/library")
def apps():
    return render_template('pages/newlibrary.html', newest_packages=OpenShopChannel.newest_packages)


@app.route("/beta/library")
def beta_apps():
    return redirect("/library")


@app.route("/library/<pkg_type>/<name>")
def application(name, pkg_type):
    # error handling in case the app doesn't exist
    try:
        if pkg_type == "theme":
            category = OpenShopChannel.theme_by_name(name)["category"]
            return render_template('pages/app.html', package=OpenShopChannel.theme_by_name(name),
                                   packages=OpenShopChannel.get_themes(), repo="themes", host="hbb3.oscwii.org")
        else:
            category = OpenShopChannel.package_by_name(name)["category"]
            return render_template('pages/app.html', package=OpenShopChannel.package_by_name(name),
                                   packages=OpenShopChannel.get_packages(), repo="apps", host="hbb1.oscwii.org")
    except Exception:
        abort(404)


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
