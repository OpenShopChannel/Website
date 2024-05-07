<#import "../includes/header.ftl" as header>
<#import "../includes/category_icon.ftl" as categoryIcon>
<#assign AssetUtil=statics['org.oscwii.website.utils.AssetUtil']>

<html>
<@header.header>
    <meta name="description" content="Official website for the Open Shop Channel open source homebrew apps repository.">

    <script src="/static/js/app_category.js"></script>
    <script src="/static/js/newest_apps.js" async></script>
    <script src="/static/ticker/ticker.js"></script>
    <link rel="stylesheet" href="/static/ticker/ticker.css">

    <noscript>
        <style>
            #ticker {
                display: none;
            }
        </style>
    </noscript>
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<#--{% include 'includes/alert.html' %}-->
<div class="notification is-hidden-mobile" id="ticker"
     style="margin-bottom: unset; border-radius: unset; padding: 0.25rem 2.5rem 0.25rem 1.5rem;">
    <div class="columns is-vcentered">
        <div class="column">
            <div class="ticker-container">
                <ul>
                    <#-- TODO ticker -->
                    <#--{% for message in ticker %}
                        {% if message["first"] == True %}
                            <div>
                                <li><span
                                        class="ticker-item tag is-light is-medium"><b><i class="fas {{ message["icon"] }}" aria-hidden="true"
                                                                  style="margin-right: .5em"></i>{{ message["title"] }}:&nbsp;</b>{{ message["content"] }}&nbsp;<a
                                        href="{{ message["link"]["address"] }}">{{ message["link"]["text"] }}</a></span>
                                </li>
                            </div>
                        {% endif %}
                    {% endfor %}
                    <div>
                        <li><span
                                class="ticker-item tag is-light is-medium"><b><i class="fas fa-newspaper" aria-hidden="true"
                                                          style="margin-right: .5em"></i>Latest update / addition:&nbsp;</b>"{{ newest_packages["newest"]["name"] }} {{ newest_packages["newest"]["version"] }}" by {{ newest_packages["newest"]["author"] }} - {{ date(newest_packages["newest"]["release_date"]) }} - {{ newest_packages["newest"]["description"]["short"] }} -&nbsp;<a
                                href="{{ url_for('application', name=newest_packages["newest"]["slug"]) }}">Download Now!</a></span>
                        </li>
                    </div>
                    {% if newest_packages["newest"]["category"] != "games" %}
                        <div>
                            <li><span
                                    class="ticker-item tag is-danger is-medium"><b><i class="fas fa-gamepad" aria-hidden="true"
                                                              style="margin-right: .5em"></i>Latest update in Games:&nbsp;</b>"{{ newest_packages["games"]["name"] }}" by {{ newest_packages["games"]["author"] }} - Version {{ newest_packages["games"]["version"] }} - {{ date(newest_packages["games"]["release_date"]) }} - {{ newest_packages["games"]["description"]["short"] }} -&nbsp;<a
                                    href="{{ url_for('application', name=newest_packages["games"]["slug"]) }}">Download Now!</a></span>
                            </li>
                        </div>
                    {% endif %}
                    {% if newest_packages["newest"]["category"] != "utilities" %}
                        <div>
                            <li><span
                                    class="ticker-item tag is-info is-medium"><b><i class="fas fa-cog" aria-hidden="true"
                                                              style="margin-right: .5em"></i>Latest update in Utilities:&nbsp;</b>"{{ newest_packages["utilities"]["name"] }}" by {{ newest_packages["utilities"]["author"] }} - Version {{ newest_packages["utilities"]["version"] }} - {{ date(newest_packages["utilities"]["release_date"]) }} - {{ newest_packages["utilities"]["description"]["short"] }} -&nbsp;<a
                                    href="{{ url_for('application', name=newest_packages["utilities"]["slug"]) }}">Download Now!</a></span>
                            </li>
                        </div>
                    {% endif %}
                    {% if newest_packages["newest"]["category"] != "emulators" %}
                        <div>
                            <li><span
                                    class="ticker-item tag is-success is-medium"><b><i class="fas fa-microchip" aria-hidden="true"
                                                              style="margin-right: .5em"></i>Latest update in Emulators:&nbsp;</b>"{{ newest_packages["emulators"]["name"] }}" by {{ newest_packages["emulators"]["author"] }} - Version {{ newest_packages["emulators"]["version"] }} - {{ date(newest_packages["emulators"]["release_date"]) }} - {{ newest_packages["emulators"]["description"]["short"] }} -&nbsp;<a
                                    href="{{ url_for('application', name=newest_packages["emulators"]["slug"]) }}">Download Now!</a></span>
                            </li>
                        </div>
                    {% endif %}
                    <div>
                        <li><span
                                class="ticker-item tag is-warning is-medium"><b><i class="fas fa-star" aria-hidden="true"
                                                          style="margin-right: .5em"></i>App of the Day:&nbsp;</b> "{{ package["name"] }}" ({{ package["category"].capitalize() }}) by {{ package["author"] }} - {{ package["description"]["short"] }} -&nbsp;<a
                                href="{{ url_for('application', name=package["internal_name"]) }}">Download Now!</a></span></li>
                    </div>
                    {% for message in ticker %}
                        {% if not message["first"] %}
                            <div>
                                <li><span
                                        class="ticker-item tag is-light is-medium"><b><i class="fas {{ message["icon"] }}" aria-hidden="true"
                                                                  style="margin-right: .5em"></i>{{ message["title"] }}:&nbsp;</b>{{ message["content"] }}&nbsp;<a
                                        href="{{ message["link"]["address"] }}">{{ message["link"]["text"] }}</a></span>
                                </li>
                            </div>
                        {% endif %}
                    {% endfor %}-->
                </ul>
            </div>
        </div>
    </div>
</div>
<section class="section">
    <div class="container">
        <div class="columns is-vcentered">
            <div class="column">
                <img src="/static/images/RainbowOpenLogo.png" alt="Open Shop Channel Logo" width="448" height="224">
            </div>
            <div class="column is-one-half is-hidden-mobile">
                <a href="/library/app/${featuredPackage.slug()}">
                    <article class="message is-warning">
                        <div class="message-header">
                            <p><i class="fas fa-star" aria-hidden="true"
                                                          style="margin-right: .75em"></i> App of the Day</p>
                        </div>
                        <div class="message-body">
                            <div class="card-content" style="padding: 0;">
                            <div class="media">
                                <div class="media-left">
                                    <figure class="image">
                                        <img src="${AssetUtil.getIcon(featuredPackage).url()}" alt="App Icon">
                                    </figure>
                                </div>
                                <div class="media-content">
                                    <p class="title is-4">${featuredPackage.name()}</p>
                                    <p class="subtitle is-6">Made by <b>${featuredPackage.author()?truncate(15)}</b></p>
                                </div>
                            </div>
                            <p>
                                <@categoryIcon.icon package=featuredPackage/>
                                ${featuredPackage.description().shortDesc()}
                            </p>
                        </div>
                        </div>
                    </article>
                </a>
                <small>How is the app of the day determined? <a href="/help/appoftheday">Find out here.</a></small>
            </div>
        </div>
        <h1 class="title">
            Open Shop Channel
        </h1>
        <p class="subtitle">
            Homebrew apps library for the Nintendo Wii.
        </p>
        <div class="divider is-center">How would you like to use the Open Shop Channel?</div>
        <div class="tile is-ancestor">
            <div class="tile is-parent">
                <div class="card">
                    <div class="card-content">
                        <div class="media">
                            <div class="media-left">
                                <figure class="image is-48x48">
                                    <img src="/static/images/hbb-icon.png" alt="Homebrew Browser Logo">
                                </figure>
                            </div>
                            <div class="media-content">
                                <p class="title is-4">Homebrew Browser</p>
                                <p class="subtitle is-6">Wii <a href="/help/hbb-install-guide">(HBB Installation Guide)</a></p>
                            </div>
                        </div>

                        <div class="content">
                            Originally developed by <a href="https://wiibrew.org/wiki/User:Teknecal">teknecal</a>, the
                            Homebrew Browser was an app repository for the Wii first released in
                            June 2008.
                            <br><br>
                            To make it usable 15 years later, we, the Open Shop Channel, modified it to connect to our
                            servers. While showing its age in many places, it
                            is still the most popular way to use the Open Shop Channel, because of the convenience of it
                            running on the console itself.
                        </div>
                        <a class="button is-link is-large"
                           href="/library/app/homebrew_browser">Get
                            Homebrew Browser</a>
                        <br><br>
                        <small>Having trouble using the Homebrew Browser? Visit <a href="/help/welcome">Help & Troubleshooting</a> or our <a href="https://discord.gg/osc">Discord server</a>.</small>
                    </div>
                </div>
            </div>
            <div class="tile is-parent">
                <div class="card">
                    <div class="card-content">
                        <div class="media">
                            <div class="media-left">
                                <figure class="image is-48x48">
                                    <img src="/static/images/oscdlicon-small.png" alt="OSCDL Logo">
                                </figure>
                            </div>
                            <div class="media-content">
                                <p class="title is-4">OSCDL</p>
                                <p class="subtitle is-6"><i class="fa-brands fa-microsoft fa-fw"></i><i class="fa-brands fa-linux fa-fw"></i><i class="fa-brands fa-apple fa-fw"></i></p>
                            </div>
                        </div>

                        <div class="content">
                            OSCDL is an open source and modern GUI desktop client for downloading apps from the Open Shop Channel, developed by
                            <a href="https://github.com/dhtdht020">dhtdht020</a>, the former lead maintainer of the Open Shop Channel project.
                            <br><br>
                            Using OSCDL, apps can be sent to the console over the internet with "Send to Wii" or over USBGecko.
                            OSCDL is cross-platform and is available for Windows, Linux, and macOS.
                        </div>
                        <a class="button is-link is-large" href="https://github.com/dhtdht020/osc-dl/releases">Get OSCDL</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="divider is-center is-hidden-mobile">Alternatively, just use the online library!</div>
        <div id="newest_apps" class="is-hidden-mobile card" style="margin-bottom: 1.5rem;"></div>
        <div class="divider is-center">Awesome, where can I talk all about this stuff?</div>
        <div class="card">
            <div class="card-content has-text-centered">
                <h1 class="title">
                    We are on Discord!
                </h1>
                <p class="subtitle">
                    Get support from other community members and directly contact project maintainers by joining our Discord server!
                </p>
                <a class="button is-link is-medium" style="background-color: #5865F2"
                   href="https://discord.gg/osc">Join our
                    Discord Server</a>
            </div>
        </div>

    </div>
</section>
<#include "../includes/footer.ftl">
</body>
</html>
