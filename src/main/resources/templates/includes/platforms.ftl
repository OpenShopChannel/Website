<#if package.supportedPlatforms()?seq_contains("wii")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/platforms/dark/Wii.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/platforms/light/WIi.png" alt="Wii">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>Wii</strong>
                        <!--<br>
                        <small>Can be used with a Nunchuk.</small>-->
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.supportedPlatforms()?seq_contains("vwii")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/platforms/dark/WiiU.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/platforms/light/WiiU.png" alt="vWii">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>vWii</strong>
                        <br>
                        <small>Wii Mode (vWii) on Wii U.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.supportedPlatforms()?seq_contains("wii_mini")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/platforms/dark/WiiMini.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/platforms/light/WiiMini.png" alt="Wii Mini">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>Wii Mini</strong>
                        <!--<br>
                        <small>Can be used with a Nunchuk.</small>-->
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>