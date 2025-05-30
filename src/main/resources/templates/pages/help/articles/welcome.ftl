<#import "../base.ftl" as base>

<@base.page title="Welcome!" subtitle="Open Shop Channel Help & Troubleshooting">
    <figure class="image is-128x128" style="float: right;">
        <img src="/static/images/help/danbo-help-desk.png" alt="Danbo Help Desk">
    </figure>
    <span class="is-hidden-mobile"><---- Use the navigation box on the left to switch between help pages.</span>
    <span class="is-hidden-desktop">Use the navigation box at the top to switch between help pages.</span>
    <br><br>
    I will add more articles here eventually. A little busy right now.<br>
    You can add articles too, or suggest some, or improve some,
    <a href="https://github.com/OpenShopChannel/Website">here</a>.
    Credit yourself too if you'd like.

    <h1 class="title">Contributing</h1>
    There are several ways you can contribute to Open Shop Channel's help site:<br><br>
    <article class="message is-info">
        <div class="message-header">
            <p>Updating an existing page</p>
        </div>
        <div class="message-body">
            Every page in this help site has an "Edit Page" link at the top. This link will take you to GitHub, where
            you can submit edits to the page.<br><br>
            If you came upon a new way to fix a problem, don't hesitate to add it to the correct page, and even credit
            yourself in the bottom of the page if you'd like.
        </div>
    </article>
    <article class="message is-primary">
        <div class="message-header">
            <p>Creating a new page</p>
        </div>
        <div class="message-body">
            Many issues and topics are not discussed in the help site.<br><br> Through the website's GitHub repository,
            you can add new pages and choose to display them on the help navigation box or link them in other help pages
            where relevant.<br><br>
            To get started, you can copy another page's source (/templates/pages/help/articles/[ name of article ].html)
            and modify it.
        </div>
    </article>
    <article class="message is-success">
        <div class="message-header">
            <p>Suggest improvements</p>
        </div>
        <div class="message-body">
            You can create an issue on our GitHub to suggest improvements or new pages.
        </div>
    </article>
</@base.page>
