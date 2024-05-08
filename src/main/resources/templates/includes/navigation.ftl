<#macro page title route>
    <a class="navbar-item<#if request.getServletPath() == route || (request.getServletPath() == "application" && route == "apps")> is-active</#if>" href="${route}">
        ${title}
    </a>
</#macro>

<nav class="navbar is-spaced is-light" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
        <a class="navbar-item" href="/">
            <#-- TODO events -->
            <#if enabledEvents && events.isEventRunning()>
                <#assign event=events.getCurrentEvent()>
                <picture class="is-hidden-mobile">
                    <source srcset="${event.logoSourceDark()}" media="(prefers-color-scheme: dark)">
                    <img src="${event.logoSourceLight()}" height="28">
                </picture>
                <picture class="is-hidden-desktop">
                    <source srcset="/static/images/open-logo.png" media="(prefers-color-scheme: dark)">
                    <img src="/static/images/open-logo.png" height="28">
                </picture>
            <#else>
                <picture>
                    <source srcset="/static/images/open-logo.png" media="(prefers-color-scheme: dark)">
                    <img src="/static/images/open-logo.png" height="28">
                </picture>
            </#if>
            <span class="tag is-light" style="display: none">Beta</span>
        </a>

        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
            <@page title="Home" route="/"/>
            <@page title="Library" route="/library"/>

            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link" tabindex="0">
                    Docs
                </a>

                <div class="navbar-dropdown">
                    <a class="navbar-item" href="https://docs.oscwii.org/repository-manager/">
                        Repository Manager & API
                    </a>
                    <a class="navbar-item" href="https://docs.oscwii.org/wii-shop-channel/">
                        WSC
                    </a>
                </div>
            </div>

            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link" tabindex="0">
                    Tools
                </a>

                <div class="navbar-dropdown">
                    <@page title="meta.xml Generator" route="/tools/metaxml"/>
                </div>
            </div>
            <a class="navbar-item" href="https://github.com/OpenShopChannel/Apps">
                Repository
            </a>
            <@page title="Donate" route="/donate"/>
            <@page title="Help" route="/help"/>
            <@page title="About" route="/about"/>
        </div>

        <div class="navbar-end">
            <div class="navbar-item">
                <div class="buttons">
                    <a class="button is-hidden-widescreen-only is-hidden-desktop-only" style="color: #00ACEE"
                       href="https://twitter.com/openshopwii">
                        <span class="icon">
                            <i class="fab fa-twitter"></i>
                        </span>
                        <span>Follow on Twitter!</span>
                    </a>
                    <a class="button is-hidden-widescreen-only is-hidden-desktop-only" style="color: #5865F2"
                       href="https://discord.gg/osc">
                        <span class="icon">
                            <i class="fab fa-discord"></i>
                        </span>
                        <span>Join our Discord!</span>
                    </a>
                    <a class="button is-hidden-widescreen-only is-hidden-desktop-only"
                       href="https://github.com/OpenShopChannel">
                        <span class="icon">
                            <i class="fab fa-github"></i>
                        </span>
                        <span>GitHub</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>
<#if enabledEvents && events.isEventRunning()>
    <div class="notification"
         style="margin-bottom: unset; border-radius: unset; padding: 0.25rem 2.5rem 0.25rem 1.5rem; text-align: center;">
        <strong <#if event.announcementColor()??>style="color: ${event.announcementColor()}"</#if>>
            <i class="fas ${event.announcementIcon()}" aria-hidden="true" style="margin-right: .5em; margin-left: .5em"></i>
            ${event.announcementText()}
            <i class="fas ${event.announcementIcon()}" aria-hidden="true" style="margin-right: .5em; margin-left: .5em"></i>
        </strong>
    </div>
</#if>