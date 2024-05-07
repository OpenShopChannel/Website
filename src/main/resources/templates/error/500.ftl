<#import "../includes/header.ftl" as header>

<html>
<@header.header>
    <meta property="og:title" content="500 - Internal Server Error">
    <meta property="og:site_name" content="Open Shop Channel">
    <meta property="og:url" content="oscwii.org">
    <meta property="og:description" content="A critical server-side error has occurred.">
    <meta property="og:type" content="website">
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<section class="section">
    <div class="container">
        <div class="notification is-danger">
            <h1 class="title">
                Error 500: Internal Server Error.
            </h1>
            <p class="subtitle">
                A critical server-side error has occurred. Please report this event.
            </p>
            <a class="button is-dark is-small" href="/">
                Go Home
            </a>
        </div>
        <figure class="image is-3by1">
            <picture>
                <img style="border-radius: 4px;" src="/static/images/error500banner.png" alt="Error Banner">
            </picture>
        </figure>
    </div>
</section>
<#include "../includes/footer.ftl">
</body>
</html>
