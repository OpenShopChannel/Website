<#import "../includes/header.ftl" as header>

<#macro creditsEntry name title avatarImage url="" urlText="">
    <div>
        <div class="card-content">
            <div class="media">
                <div class="media-left">
                    <figure class="image is-48x48">
                        <img src="/static/images/credits/${avatarImage}" alt="Profile Picture">
                    </figure>
                </div>
                <div class="media-content">
                    <p class="title is-4">${name}</p>
                    <p class="subtitle is-6">${title}<#if url?has_content> - <a href="${url}">${urlText}</a></#if>
                    </p>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro timelineEntry content date image url="" urlText="">
    <div class="timeline-item">
        <div class="timeline-marker is-image is-32x32"
             style="background: none; border: none; border-radius: unset;">
            <img src="/static/images/${image}">
        </div>
        <div class="timeline-content">
            <p class="heading">${date}</p>
            <p>
                ${content}
            </p>
            <#if url?has_content>
                <br>
                <a href="${url}" class="button is-fullwidth">${urlText}</a>
            </#if>
        </div>
    </div>
</#macro>

<html>
<@header.header title="About">
    <meta name="description" content="Official website for the Open Shop Channel open source homebrew apps repository.">
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<div class="section">
    <div class="container">
        <h1 class="title">
            About Us
        </h1>
        <p class="subtitle" style="text-align: center">
            <b>Our Story</b>
        </p>
        <p>
            The Open Shop Channel was started in March 2018, with the goal to revive the Wii Shop Channel before its
            planned discontinuation.
            The original plan for the project was to make a Wii Shop Channel replacement,
            But over time, our focus went towards providing a general open source repository of apps.
        </p>
        <div class="divider is-left">Open Shop Channel: A team effort</div>
        <div class="columns">
            <div class="column">
                <p class="subtitle" style="text-align: center">
                    <b>Credits</b>
                </p>
                
                <@creditsEntry "Artuto" "Project Lead" "Artuto.png" "https://github.com/Artuto" "@Artuto"/>
                <@creditsEntry "dhtdht020" "Former Project Lead" "dhtdht020.png" "https://twitter.com/dhtdht020" "@dhtdht020"/>
                <@creditsEntry "DarkOK" "Maintainer" "DarkOK.png" "https://twitter.com/darkphoenix10ok" "@darkphoenix10ok"/>
                <@creditsEntry "ramblecube" "Maintainer" "ramblecube.png" "https://github.com/ramblecube" "@ramblecube"/>
                <@creditsEntry "Spotlight" "Former Maintainer" "Spotlight.png" "https://joscomputing.space/" "joscomputing.space"/>
                <@creditsEntry "Puppercino" "Former Designer" "PuppercinoK.png"/>
                <@creditsEntry "Icons8" "Provided some of the iconography used in this website" "icons8.png" "https://icons8.com" "icons8.com"/>
                <@creditsEntry "JetBrains" "Sponsoring IDEs used by the team" "jetbrains.png" "https://www.jetbrains.com/" "www.jetbrains.com"/>

                <div>
                    <div class="card-content">
                        <div class="media">
                            <div class="media-content">
                                <p class="title is-4">...And you!</p>
                            </div>
                        </div>
                        <div class="content">
                            Thank you to all project contributors and donors, which helped us create the Open Shop
                            Channel!
                        </div>
                    </div>
                </div>
            </div>

            <div class="column">
                <p class="subtitle" style="text-align: center">
                    <b>Project Timeline</b>
                <div class="timeline">
                    <header class="timeline-header">
                        <span class="tag is-medium is-link">2018</span>
                    </header>
                    <@timelineEntry "The Open Shop Channel project is launched, with the goal to restore functionality of the Wii Shop Channel." "March 2018" "oldlogo.png"/>
                    <@timelineEntry "The Open Shop Channel begins providing a repository to replace the one in the Homebrew Browser, with more up to date applications and a larger variety of content." "August 2019" "hbb-icon.png" "/library/app/homebrew_browser" "Download Homebrew Browser"/>
                    <@timelineEntry "Open Shop Channel Downloader, also known as OSCDL, was released. It allows downloading content from the Open Shop Channel on desktop computers, as well as wirelessly sending apps to Wii systems on the same network." "April 2020" "oscdlicon-small.png" "https://github.com/dhtdht020/osc-dl/releases" "Download OSCDL"/>
                    <@timelineEntry "The public Open Shop Channel API has been released, allowing everyone to make use of Open Shop Channel's services and library directly, and provide custom services and clients making use of it." "October 2020" "apipaper.png" "https://docs.oscwii.org/repository-manager/api" "View Documentation"/>
                    <@timelineEntry "The Open Shop Channel release a new online library, making use of its public API to provide a convenient location to download apps from the Open Shop Channel." "November 2021" "dlbrowsericon.png" "/library" "Browse Library"/>
                    <@timelineEntry "Our new infrastructure, backend and repository system, \"Repository Manager\", is released, fully open sourcing the repository's contents'." "August 2023" "repository-manager-logo.png" "https://docs.oscwii.org/repository-manager" "View Documentation"/>

                    <div class="timeline-header">
                        <span class="tag is-medium is-link">${.now?string('yyyy')}</span>
                    </div>
                </div>
            </div>
        </div>

        <p class="subtitle" style="text-align: center">
            <b>Who is Danbo?</b>
        </p>
        <div class="columns">
            <div class="column is-one-quarter">
                <figure class="image">
                    <img src="/static/images/jem-sahagun-danbo.jpg" alt="Danbo on a Yamaha Organ">
                </figure>
            </div>
            <div class="column">
                <p>
                    Danbo is a fictional cardboard character originating from the Kiyohiko Azuma manga
                    series, "Yotsuba&!". We personally love it and have decided to feature it in several pages on this
                    website.
                </p>
                <p>
                    Physical copies of Yotsuba&! can be purchased <a
                        href="https://www.bookdepository.com/author/Kiyohiko-Azuma">here, from the author on Book
                    Depository</a>.
                </p>
                <p>
                    We recommend buying and reading the entire series, it's amazing. Danbo makes an appearance on
                    volumes 5 and 10.
                </p>
                <div class="section">
                    <i>Photo: Danbo on a Yamaha Organ by <a
                            href="https://unsplash.com/@jemsahagun?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Jem
                        Sahagun</a>.</i>
                </div>
            </div>
        </div>

        <div class="notification">
            Website by dhtdht020.
        </div>
        <span>Some of the icons and assets on this website are provided by <a href="https://icons8.com/">Icons8</a>.</span>
        <br><br>
        <div class="control">
            <div class="field is-grouped is-grouped-multiline">
                <div class="control">
                    <div class="tags has-addons">
                        <span class="tag is-dark">Website Version</span>
                        <span class="tag is-light">${version}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "../includes/footer.ftl">
</body>
</html>
