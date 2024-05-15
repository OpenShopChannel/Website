<#macro buttonIcon label icon link>
    <a aria-label="${label}" class="button" href="${link}" style="width: 48px; height: 48px" target="_blank">
        <span class="icon">
            <i class="${icon}" style="font-size: x-large"></i>
        </span>
    </a>
</#macro>

<footer class="footer">
    <div class="contents">
        <div style="display: grid; grid-template-columns: auto 1fr auto auto; gap: 2rem">
            <div style="display: inline-flex">
                <picture>
                    <source srcset="/static/images/open-logo.png" media="(prefers-color-scheme: dark)">
                    <img src="/static/images/open-logo.png" style="height: 48px">
                </picture>
            </div>
            <p style="text-align: left">
                <span class="is-hidden-mobile"><strong>Open Shop Channel</strong>, an open source homebrew repository for the Nintendo Wii.<br></span>
                <span>Copyright © Open Shop Channel 2018-${.now?string('yyyy')} - All rights reserved.</span>
            </p>
            <div class="buttons is-hidden-mobile" style="display: inline-flex">
                <@buttonIcon "X (Twitter)" "fa-brands fa-x-twitter" "https://twitter.com/openshopwii"/>
                <@buttonIcon "Discord" "fa-brands fa-discord" "https://discord.gg/osc"/>
                <@buttonIcon "GitHub" "fa-brands fa-github" "https://github.com/OpenShopChannel"/>
                <@buttonIcon "Status" "fa-solid fa-signal" "https://status.oscwii.org"/>
            </div>
        </div>
    </div>
</footer>
<script src="https://status.oscwii.org/embed/script.js"></script>