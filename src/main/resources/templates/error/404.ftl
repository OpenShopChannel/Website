<#import "../includes/header.ftl" as header>

<html>
<@header.header>
    <meta property="og:title" content="404 - Page Not Found">
    <meta property="og:site_name" content="Open Shop Channel">
    <meta property="og:url" content="oscwii.org">
    <meta property="og:description" content="This page is not present on the Open Shop Channel website.">
    <meta property="og:type" content="website">
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<#--{% include 'includes/alert.html' %}-->
<section class="section">
    <div class="container">

        <div class="notification is-danger">
            <h1 class="title">
                Error 404: Not Found.
            </h1>
            <p class="subtitle">
                The requested page is not a part of the Open Shop Channel website, or it has been removed. If you
                entered the URL manually, please check your spelling and try again. If this is a page for a new application, it might take some time to show up.
            </p>
            <a class="button is-dark is-small" href="/">
                Go Home
            </a>
        </div>
        <figure class="image is-3by1">
            <picture>
                <img style="border-radius: 4px;" src="/static/images/errorbanner.png" alt="Error Banner">
            </picture>
        </figure>
    </div>
</section>
<#include "../includes/footer.ftl">
</body>
</html>
