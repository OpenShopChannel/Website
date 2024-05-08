<#import "../../includes/header.ftl" as header>

<#macro page title subtitle>
<html>
<@header.header title="Help & Troubleshooting: " + title>
    <meta name="description" content="Help with Open Shop Channel.">
</@header.header>

<body>
<#include "../../includes/navigation.ftl">
<#include "../../includes/alert.ftl">
<div class="section">
    <div class="container">
        <div class="columns">
            <div class="column is-one-quarter">
                <#include "navigation.ftl">
            </div>
            <div class="column">
                <nav class="level">
                    <!-- Left side -->
                    <div class="level-left">
                        <div class="level-item">
                            <h1 class="title">
                                ${title}
                            </h1>
                        </div>
                    </div>

                    <!-- Right side -->
                    <div class="level-right">
                        <a class="level-item" aria-label="contribute"
                           href="https://github.com/OpenShopChannel/Website/tree/master/src/main/resources/templates/pages/help/articles/${name}.ftl"
                           target=”_blank”>
                            <span class="icon is-small">
                                <i class="fas fa-file-pen" aria-hidden="true" style="margin-right: .75em"></i>
                            </span>
                            Edit this page on GitHub
                        </a>
                    </div>
                </nav>
                <p class="subtitle">
                    ${subtitle}
                </p>
                <hr>
                <div class="content">
                    <#nested>
                </div>
                <hr>
                <article class="message">
                    <div class="message-body">
                        Still need help? Join our Discord server: <a href="https://discord.gg/osc">discord.gg/osc</a>
                    </div>
                </article>
                <article class="message">
                    <div class="message-body">
                        Managed to solve this issue in a different way? Contribute to this page on GitHub:<br>
                        <a class="level-item" style="text-decoration: none"
                           href="https://github.com/OpenShopChannel/Website/tree/master/src/main/resources/templates/pages/help/articles/${name}.html"
                           target=”_blank”>
                            <span class="icon is-small">
                                <i class="fas fa-file-pen" aria-hidden="true" style="margin-right: .75em"></i>
                            </span>
                            <u>Edit this page on GitHub</u>
                        </a>
                    </div>
                </article>
            </div>
        </div>
    </div>
</div>
<#include "../../includes/footer.ftl">
</body>
</html>
</#macro>