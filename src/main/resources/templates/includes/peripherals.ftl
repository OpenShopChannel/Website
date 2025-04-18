<#assign remoteCount = 0>
<#list package.peripherals() as peripheral>
    <#if peripheral == "wii_remote">
        <#assign remoteCount = remoteCount + 1>
    </#if>
</#list>

<#if package.peripherals()?seq_contains("wii_remote")>
<div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/controllericon/dark/${remoteCount}WiiRemote.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/controllericon/light/${remoteCount}WiiRemote.png" alt="Wii Remote ${remoteCount}">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>Wii Remote</strong>
                        <br>
                        <small>Can be used with a Wii Remote. Up to ${remoteCount}.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.peripherals()?seq_contains("nunchuk")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/controllericon/dark/Nunchuk.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/controllericon/light/Nunchuk.png" alt="Nunchuk">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>Nunchuk</strong>
                        <br>
                        <small>Can be used with a Nunchuk.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.peripherals()?seq_contains("classic_controller")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/controllericon/dark/ClassicController.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/controllericon/light/ClassicController.png" alt="Classic Controller">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>Classic Controller</strong>
                        <br>
                        <small>Can be used with a Classic Controller.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.peripherals()?seq_contains("gamecube_controller")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/controllericon/dark/GamecubeController.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/controllericon/light/GamecubeController.png" alt="GameCube Controller">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>GameCube Controller</strong>
                        <br>
                        <small>Can be used with a GameCube Controller.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.peripherals()?seq_contains("wii_zapper")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/controllericon/dark/WiiZapper.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/controllericon/light/WiiZapper.png" alt="Zapper">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>Wii Zapper</strong>
                        <br>
                        <small>Can be used with a Wii Zapper.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.peripherals()?seq_contains("usb_keyboard")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/controllericon/dark/USBKeyboard.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/controllericon/light/USBKeyboard.png" alt="USB Keyboard">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>USB Keyboard</strong>
                        <br>
                        <small>Can be used with a USB Keyboard.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>
<#if package.peripherals()?seq_contains("sdhc")>
    <div style="max-height: 100px; margin-bottom: 0.5rem;">
        <article class="media">
            <div class="media-left">
                <figure class="image is-64x64">
                    <picture>
                        <source srcset="/static/images/controllericon/dark/SDHC.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/controllericon/light/SDHC.png" alt="SDHC">
                    </picture>
                </figure>
            </div>
            <div class="media-content">
                <div class="content">
                    <p>
                        <strong>SDHC Card</strong>
                        <br>
                        <small>Supports SDHC cards.</small>
                    </p>
                </div>
            </div>
        </article>
    </div>
</#if>