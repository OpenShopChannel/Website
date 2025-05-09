<#import "../base.ftl" as base>

<@base.page title="Frequently Asked Questions"
    subtitle="Below are answers for several questions we get asked frequently, to save you time:">
    <article class="message is-info">
        <div class="message-body">
            Most of the information on this page will eventually be moved to dedicated pages.
        </div>
    </article>
    <p class="subtitle" style="margin-bottom: unset; margin-top: 1.5rem">
        <b>Why do I get "read error -81" on the Homebrew Browser?</b>
    </p>
    <p>
        This is usually resolved after restarting the Wii console. If this keeps happening, double check the
        following:
        the SD card is not write-locked, you are using Open Shop Channel's copy of the Homebrew Browser, the server
        in
        the config is set to 0, and additionally check the Open Shop Channel twitter for any status updates or
        maintenance.
    </p>

    <div id="sd-corrupted"></div>
    <p class="subtitle" style="margin-bottom: unset; margin-top: 1.5rem">
        <b>My SD card got corrupted, what did I do wrong?</b>
    </p>
    <p>
        You should not abruptly turn off the Wii while an homebrew app is writing files to the SD card,
        It's not Windows and it will not automatically repair it. The Homebrew Browser is writing icon
        files to the SD card in the background, and for this reason is susceptible for this problem.
        To properly and safely exit homebrew apps, return to loader and only then power off the Wii.
        To repair your SD card: Use the Windows "chkdsk" utility. There is usually no reason to use
        commercial utilities.
    </p>

    <p class="subtitle" style="margin-bottom: unset; margin-top: 1.5rem">
        <b>Who should I contact for support?</b>
    </p>
    <p>
        You can hit us up on Twitter direct messages (<a href="https://twitter.com/openshopwii">@openshopwii</a>) or on
        our Discord in the appropriate channel.
        <b>Please do not contact RiiConnect24 support.</b>
    </p>
</@base.page>
