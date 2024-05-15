<#import "../includes/announcer.ftl" as announcer>

<#macro header title="">
<head>
    <meta charset="utf-8">
    <title>${title}<#if title?has_content> - </#if>Open Shop Channel</title>

    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <link rel="icon" type="image/png" href="/static/images/blacklogo.png"/>

    <link rel="stylesheet" type="text/css" href="/static/css/bulma.css">

    <link rel="stylesheet" type="text/css" href="/static/css/bulma-timeline.min.css">

    <link rel="stylesheet" type="text/css" href="/static/css/bulma-prefers-dark.css">

    <link rel="stylesheet" type="text/css" href="/static/css/bulma-ribbon.min.css">

    <link rel="stylesheet" type="text/css" href="/static/css/bulma-divider.min.css">

    <link rel="stylesheet" type="text/css" href="/static/css/bulma-tooltip.min.css">

    <link rel="stylesheet" type="text/css" href="/static/webix/skins/materialshop.css">

    <link rel="stylesheet" href="/static/fa/css/all.min.css">

    <!--JS -->
    <script src="/static/bulmajs/bulma.js"></script>
    <script src="/static/js/jquery-3.6.0.min.js"></script>

    <!-- Load webix contrast skin if dark mode is on -->
    <script>
        let dark = window.matchMedia('(prefers-color-scheme: dark)').matches;

        webix_skin = "material";
        if(dark){
            var head  = document.getElementsByTagName('head')[0];
            var link  = document.createElement('link');
            link.rel  = 'stylesheet';
            link.type = 'text/css';
            link.href = '/static/webix/skins/contrastshop.css';
            head.appendChild(link);
        }
    </script>

    <!-- More JS -->
    <script src="/static/webix/webix.min.js"></script>

    <!-- General Meta tags for SEO -->
    <meta name="language" content="en">
    <meta name="title" content="Open Shop Channel">
    <meta name="author" content="Open Shop Channel">
    <meta name="copyright" content="© Open Shop Channel">
    <meta name="robots" content="index, follow">
    <meta name="subject" content="Wii Homebrew">
    <meta name="keywords" content="Wii, Homebrew, Shop, Browser, OSC">
    <meta name="classification" content="Official website for the Open Shop Channel open source homebrew apps repository.">
    <#nested>

    <#list announcements as text>
        <@announcer.announcement text/>
    </#list>
</head>
</#macro>