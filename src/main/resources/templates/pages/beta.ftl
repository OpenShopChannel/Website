<#import "../includes/header.ftl" as header>

<html>
<@header.header>
    <meta name="robots" content="noindex">
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<#include "../includes/alert.ftl">
<section class="section">
    <div class="container">
        <#if redirect == "betasite">
            <div class="notification is-warning">
                <h1 class="title">
                    Information:
                </h1>
                <p class="subtitle">
                    The site at beta.oscwii.org is no longer available. Welcome to our brand new website!
                </p>
                <a class="button is-dark is-small" href="/">
                    Go Home
                </a>
            </div>
        <#elseif redirect == "theme">
            <div class="notification is-warning">
                <h1 class="title">
                    Information:
                </h1>
                <p class="subtitle">
                    Homebrew Channel Themes are no longer available on the Open Shop Channel website.
                </p>
                <a class="button is-dark is-small" href="/">
                    Go Home
                </a>
            </div>
        <#elseif redirect == "oscdlbrowser">
            <div class="notification is-warning">
                <h1 class="title">
                    APRIL FOOLS! =D
                </h1>
                <p class="subtitle">
                    Still looking to beta test for the Open Shop Channel? We have a few upcoming beta tests and while we will open applications for community beta testing, patrons will always be able to access early software!
                </p>
                <a class="button is-dark is-small" href="/">
                    Go Home
                </a>
                <center><img src="/static/images/aprilfools21/trollface.png"
                     alt="Open Shop Channel Downloader Browser Troll Face"></center>
            </div>
        </#if>
        <figure class="image is-3by1">
            <picture>
                <img style="border-radius: 4px;" src="/static/images/betabanner.png" alt="Beta Banner">
            </picture>
        </figure>
    </div>
</section>
<#include "../includes/footer.ftl">
</body>
</html>
