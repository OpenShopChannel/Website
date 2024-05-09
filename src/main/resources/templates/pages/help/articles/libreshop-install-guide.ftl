<#import "../base.ftl" as base>

<@base.page title="LibreShop Installation Guide"
    subtitle="Learn how to install LibreShop">
    <h1 class="title">Requirements</h1>
    To use LibreShop you need the following:
    <br>
    <ul>
        <li>
            A Homebrewed Wii with Internet Access
            <ul>
                <li>If your Wii is not homebrewed, visit
                    <a href="https://wii.hacks.guide/get-started" target="_blank">this guide</a>, and then come back.</li>
            </ul>
        </li>
        <li>An SD Card</li>
    </ul>

    <h1 class="title">Instructions</h1>
    <ol>
        <li>
            Go to <a href="/library/app/libreshop" target="_blank">this page</a> to download LibreShop.
            <br>
            Scroll down to the "Recommended Download" section and click "Download File".<br><br>
            <img src="/static/images/guide/ls1.png">
        </li>
        <li>Connect your SD Card to your computer and extract the contents of the .ZIP file you just downloaded into
            the <a href="/static/images/guide/wherestheroot.png" target="_blank">root</a> folder.</li>
        <li>
            Extract the SD Card from your computer and insert it into the Wii, load the Homebrew Channel and
            you should see LibreShop.
            <ul><li>If you don't see LibreShop you did Step 2 wrong. Check the linked image for reference.</li></ul>
            <img src="/static/images/guide/ls2.png">
        </li>
        <br>
        <div class="notification is-warning is-bold" style="margin-bottom: 10px;">
            <i class="fa-solid fa-triangle-exclamation"></i> <b>Notice:</b>
            Ensure your SD card is <b>NOT</b> <a href="/static/images/guide/sdcard.png" target="_blank">write-protected!</a>
            LibreShop won't be able to download apps if it is.
        </div>
    </ol>
</@base.page>
