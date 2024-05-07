<#import "../includes/header.ftl" as header>

<html>
<@header.header title="OSCDL Web Browser">
    <script src="/static/images/aprilfools21/confetti.min.js"></script>
    <meta property="og:title" content="Open Shop Channel Downloader Web Browser">
    <meta property="og:site_name" content="OSCDL Web Browser">
    <meta property="og:url" content="https://oscwii.org/browser">
    <meta property="og:description" content="The Open Shop Channel Downloader Web Browser is the most advanced web browser in the wor...">
    <meta property="og:type" content="website">
    <meta name="robots" content="noindex">

    <style>
        .bruh {
            display: flex;
            align-items: center;
        }

        /* Page content */
        .content {
            padding: 16px;
        }

        /* The sticky class is added to the header with JS when it reaches its scroll position */
        .sticky {
            position: fixed;
            top: 0;
            width: 100%;
            z-index:1000;
            padding: 0.25rem 2.5rem 0.25rem 1.5rem
        }

        /* Add some top padding to the page content to prevent sudden quick movement (as the header gets a new position at the top of the page (position:fixed and top:0) */
        .sticky + .content {
            padding-top: 102px;
        }
    </style>
</@header.header>

<body>
<div class="notification is-primary is-light" style="margin-bottom: 0;">
    <button class="delete"></button>
    <b>Information:</b> This is an archived web page of Open Shop Channel's April Fools 2021 prank.
</div>
<#include "../includes/navigation.ftl">

<div class="notification is-link is-light bruh" style="margin-bottom: unset; border-radius: unset;" id="Header">
    <figure class="image is-32x32">
        <img style="vertical-align: middle" src="/static/images/aprilfools21/earth.gif">
    </figure>
    <marquee scrollamount="17"><b><span style="padding-left: 5px; padding-right: 5px;">BRAND NEW RELEASE! OPEN SHOP CHANNEL DOWNLOADER WEB BROWSER AVAILABLE NOW WORLDWIDE FOR BETA TESTING! 90% FASTER THAN CHROME! MOST ADVANCED TECHNOLOGY EVER SEEN IN A PIECE OF SOFTWARE! TODAY'S NEWS: OPEN SHOP CHANNEL DOWNLOADER IS FINALLY OUT IN BETA! THIS IS INCREDIBLE - SAYS PRESIDENT OBAMA. BILLION DOLLAR COMPANIES IN SHOCK AFTER OPEN SHOP CHANNEL'S REVEAL OF THE BRAND NEW OPEN SHOP CHANNEL DOWNLOADER WEB BROWSER. COMPETING BROWSER CEO TO DHTDHT020: "THE CHROME TEAM WILL TRY THEIR BEST TO CATCH UP. WE HAVE SURVIVED THE Hi PHONE AND WE WILL SURVIVE THIS." -- ALSO ON THE NEWS: DANBO IN INTERVIEW AFTER BETA ANNOUNCEMENT OF OPEN SHOP CHANNEL BROWSER DOWNLOADER: "OPEN THE SHOP".</span></b>
    </marquee>
</div>
<section class="section">
    <div class="container">
        <div class="columns is-vcentered">
            <div class="column">
                <img src="/static/images/aprilfools21/dlbrowsericon.png"
                     alt="Open Shop Channel Downloader Browser Logo">
            </div>
            <div class="column">
                <h1 class="title">
                    Open Shop Channel Downloader Web Browser
                </h1>
                <p class="subtitle">
                    The Open Shop Channel Downloader Web Browser is the most advanced web browser in the world. It
                    includes everything you expect from a web browser and more. Ever wished your browser could send
                    homebrew apps to your Wii?! Of course you did!
                </p>
                <div class="buttons">
                    <a disabled class="button is-link is-large"
                       href="">Download
                        OSC DL WB</a>
                    <a disabled class="button is-dark is-large" href="https://github.com/dhtdht020/osc-dl/releases">Extensions
                        Store</a>

                </div>
                <span style="color: red;">* You must be in the beta program to download. Scroll down and read more to find out how to join!</span>
            </div>
        </div>


        <h1 class="title">
            It's the best browser to date!
        </h1>
        <p class="subtitle">
            The top tier technology packed inside Open Shop Channel Downloader Web Browser will completely change how we
            use the web. We expect it to surpass Chrome's market share by the end of the year.
        </p>
        <div class="columns is-vcentered">
            <div class="column">
                <img src="/static/images/aprilfools21/sendtowii.gif"
                     alt="Open Shop Channel Downloader Browser Send to Wii Feature">
            </div>
            <div class="column">
                <h1 class="title">
                    The Homebrew Browser but it has Web between Homebrew and Browser and also better
                </h1>
                <p class="subtitle">
                    You can download and send homebrew to your Wii directly with Open Shop Channel Downloader Web
                    Browser. Just go to oscwii.org, and navigate to your app of choice, then press the Send to Wii
                    button at the bottom!
                </p>
            </div>
        </div>
        <div class="columns is-vcentered">
            <div class="column">
                <h1 class="title">
                    Less than 100ms to load up oscwii.org!
                </h1>
                <p class="subtitle">
                    Speed never seen before on a browser, loads complex sites in almost 90% less time than competing web
                    browsers. It is the peak of the web.
                </p>
            </div>
            <div class="column">
                <img src="/static/images/aprilfools21/speed.png"
                     alt="Open Shop Channel Downloader Browser Speed Comparison">
            </div>
        </div>
        <div class="columns is-vcentered">
            <div class="column">
                <img src="/static/images/aprilfools21/splash.png"
                     alt="Open Shop Channel Downloader Browser Splash Banner">
            </div>
            <div class="column">
                <h1 class="title">
                    You can get it all right now by joining the beta!
                </h1>
                <p class="subtitle">
                    You can join the public beta for free in just a few steps!
                </p>
                <div class="buttons">
                    <a class="button is-link is-large" href="/beta?redirect=oscdlbrowser">Join the Beta</a>
                </div>
            </div>
        </div>
    </div>
</section>
<#include "../includes/footer.ftl">
</body>
<script>
    confetti.start()
    window.onscroll = function () {
        myFunction()
    };

    // Get the header
    var header = document.getElementById("Header");

    // Get the offset position of the navbar
    var sticky = header.offsetTop;

    // Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
    function myFunction() {
        if (window.pageYOffset > sticky) {
            header.classList.add("sticky");
            confetti.stop()
        } else {
            header.classList.remove("sticky");
            confetti.start()
        }
    }
</script>
</html>
