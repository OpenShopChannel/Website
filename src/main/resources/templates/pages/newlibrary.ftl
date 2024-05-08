<#import "../includes/header.ftl" as header>
<#assign FormatUtil=statics['org.oscwii.website.utils.FormatUtil']>

<html>
<@header.header title=(coder?has_content)?then(coder + "'s Developer Profile", "Library")>
    <#if coder?has_content>
        <meta name="description" content="Download and list apps made by ${coder} from the Open Shop Channel applications repository.">
    </#if>

    <script src="/static/js/app_category.js"></script>
    <script src="/static/js/app_library.js"></script>
    <script src="/static/ticker/ticker.js"></script>
    <link rel="stylesheet" href="/static/ticker/ticker.css">
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<#include "../includes/alert.ftl">
<section class="section">
    <div class="container">
        <#if coder?has_content>
            <nav class="breadcrumb has-arrow-separator" aria-label="breadcrumbs">
                <ul>
                    <li><b><a href="/library">Library</a></b></li>
                    <li class="is-active"><a href="" aria-current="page">Developer Profile: ${coder}</a></li>
                </ul>
            </nav>
            <div class="notification is-primary is-bold" style="margin-bottom: 10px;">
                <h1 class="title"><i class="fas fa-id-card fa-fw" aria-hidden="true" style="margin-right: 5px"></i>${coder}</h1>
                <h2 class="subtitle">Developer Profile</h2>
            </div>
            <div id="LibraryToolbar"></div>
        <#else>
            <nav class="breadcrumb has-arrow-separator" aria-label="breadcrumbs">
                <ul>
                    <li><b><a href="/library">Library</a></b></li>
                    <li class="marquee is-active"><a href="" aria-current="page">Home</a></li>
                </ul>
            </nav>
            <div class="notification" style="margin-bottom: 10px;">
                <h1 class="title" style="text-align: center;">Open Shop Channel</h1>
                <div class="columns is-vcentered mb-0">
                    <div class="column" style="padding-top: unset; margin-top: -0.8rem;">
                        <div class="ticker-container is-hidden-mobile">
                            <ul>
                                <div>
                                    <#if newestPackages["games"]??>
                                        <li><h2 class="subtitle" class="ticker-item"><b>Latest
                                                    update in Games:</b> "${newestPackages["games"].name()}"
                                                by ${newestPackages["games"].author()} -
                                                Version ${newestPackages["games"].version()}
                                                - ${FormatUtil.date(newestPackages["games"].releaseDate())}</h2>
                                        </li>
                                    </#if>
                                </div>
                                <div>
                                    <#if newestPackages["utilities"]??>
                                        <li><h2 class="subtitle" class="ticker-item"><b>Latest
                                                    update in Utilities:</b> "${newestPackages["utilities"].name()}"
                                                by ${newestPackages["utilities"].author()} -
                                                Version ${newestPackages["utilities"].version()}
                                                - ${FormatUtil.date(newestPackages["utilities"].releaseDate())}</h2>
                                        </li>
                                    </#if>
                                </div>
                                <div>
                                    <#if newestPackages["emulators"]??>
                                        <li><h2 class="subtitle" class="ticker-item"><b>Latest
                                                    update in Emulators:</b> "${newestPackages["emulators"].name()}"
                                                by ${newestPackages["emulators"].author()} -
                                                Version ${newestPackages["emulators"].version()}
                                                - ${FormatUtil.date(newestPackages["emulators"].releaseDate())}</h2>
                                        </li>
                                    </#if>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="LibraryToolbar" style="margin: -10px;"></div>
            </div>
        </#if>
        <div id="AppsList"></div>
        <script>library("${apiHost}");</script>
    </div>
</section>
<#include "../includes/footer.ftl">
</body>
</html>
