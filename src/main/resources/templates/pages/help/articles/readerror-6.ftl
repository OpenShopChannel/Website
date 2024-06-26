<#import "../base.ftl" as base>

<@base.page title="Read Error -6" subtitle="Usually a connection error">
    To use the Homebrew Browser, your Wii needs an internet connection.
    <br><br>
    <b>Perform a connection test:</b>
    <ul>
        <li>In the Wii Menu, enter settings, then internet settings.</li>
        <li>Select your active connection and perform a connection test. <b>If prompted, do not update your system.</b>
        </li>
        <li>If the connection test failed: correct your internet settings.</li>
        <li>If the connection test succeeded: try the additional troubleshooting steps down below.</li>
    </ul>
    <b>Connection test succeeded:</b><br>
    If the connection test was successful, but you are still seeing this error, the following might help
    troubleshooting:
    <ul>
        <li>Make sure your SD card is not write-locked.</li>
        <li>Try visiting <a href="https://hbb1.oscwii.org/hbb/listv036.txt">https://hbb1.oscwii.org/hbb/listv036.txt</a>
            from a device on the same network and see if it loads. If it doesn't, Open Shop Channel might be down
            (Check our <a href="https://twitter.com/openshopwii">Twitter</a> for status updates). It could also be that
            your ISP blocks the Open Shop Channel.
        </li>
        <li>Try clearing the DNS settings in connection settings. The RiiConnect24 DNS and Wiimmfi DNS should be fine,
            but worth a try, especially if you are using a less common DNS.
        </li>
        <li>Verify through a computer that you are able to write to your SD card.</li>
    </ul>
</@base.page>
