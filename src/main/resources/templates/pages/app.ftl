<#import "../includes/header.ftl" as header>
<#import "../includes/category_icon.ftl" as categoryIcon>
<#assign AssetUtil=statics['org.oscwii.website.utils.AssetUtil']>
<#assign FormatUtil=statics['org.oscwii.website.utils.FormatUtil']>
<#assign Flags=statics['org.oscwii.website.model.Package$Flag']>
<#assign packageIcon=AssetUtil.getIcon(package)>
<#assign archive=AssetUtil.getArchive(package)>
<#assign binary=AssetUtil.getBinary(package)>
<#assign metaXml=AssetUtil.getMetaXml(package)>
<#assign badges=FormatUtil.applicationBadges(package)>

<html>
<@header.header title=package.name()>
    <meta property="og:title" content="${package.name()}">
    <meta property="og:site_name" content="Open Shop Channel">
    <meta property="og:url" content="oscwii.org">
    <meta property="og:description" content="${package.description().shortDesc()}">
    <meta property="og:type" content="website">
    <meta property="og:image" content="${packageIcon.url()}">
    <meta name="description" content="Download ${package.name()} from the Open Shop Channel applications repository. ${package.description().shortDesc()}">

    <script src="/static/js/app_toolbar.js" defer></script>
    <style type="text/css">
        .webix_secondary .webix_button {
            background: #12b658;
            color: #FFFFFF;
        }
        .webix_secondary .webix_button:hover,
        .webix_secondary .webix_button:focus,
        .webix_secondary .webix_button:active {
            background: #0e9747;
        }
    </style>
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<div class="section">
    <div class="container">
        <nav class="breadcrumb has-arrow-separator" aria-label="breadcrumbs">
            <ul>
                <li><b><a href="/library" class="has-text-${color}">Library</a></b></li>
                <li><span class="tag mx-2 is-${color}"><b>${package.category()?upper_case}</b></span></li>
                <li class="is-active"><a href="" aria-current="page">${package.name()}</a></li>
            </ul>
        </nav>
        <div class="notification is-${color} is-bold" style="margin-bottom: 10px;">
            <div class="container" style="margin: unset;">
                <div class="columns is-vcentered">
                    <div class="column">
                        <h1 class="title">
                            <@categoryIcon.icon package/>${package.name()}
                        </h1>
                        <h2 class="subtitle">
                            Homebrew application created by <u><b>
                            <a href="/library?coder=${package.author()}">${package.author()}</a></b></u>
                        </h2>
                    </div>
                    <div class="column is-one-fifth" style="width: unset;">
                        <img src="${packageIcon.url()}" style="vertical-align: middle;"
                             alt="Icon for ${package.name()}">
                    </div>
                </div>
            </div>
        </div>
        <article class="message is-${color}">
            <div class="message-body" style="padding: unset;">
                <div id="toolbar"></div>
            </div>
        </article>
        <div class="columns" style="padding-top: 10px;">
            <div class="column is-one-third">
                <article class="message is-${color}">
                    <div class="message-body">
                        <div class="columns is-vcentered is-centered">
                            <div class="column">
                                <b class="subtitle">
                                    <@categoryIcon.icon package/>${categoryDisplay}</b>
                            </div>
                        </div>
                    </div>
                </article>

                <#if badges?has_content>
                <article class="message is-${color} is-hidden-mobile">
                    <div class="message-body">
                        <div class="columns is-multiline">
                            <#list badges as badge, title>
                                <div class="column is-one-quarter has-tooltip-bottom" data-tooltip="${title}">
                                    <img src="/static/images/badges/${badge}.png" alt="${title}">
                                </div>
                            </#list>
                        </div>
                        <small>What are these? Find out <a href="/help/badges">here</a>.</small>
                    </div>
                </article>
                </#if>

                <article class="message is-${color}">
                    <div class="message-header">
                        <p><i class="fas fa-info fa-fw" aria-hidden="true"></i> Information </p>
                    </div>
                    <div class="message-body">
                        <p><b><i class="fas fa-wrench fa-fw" aria-hidden="true"></i>
                            Version:</b> ${package.version()}</p>
                        <#if package.releaseDate() gt 0>
                        <p><b><i class="fas fa-calendar-alt fa-fw" aria-hidden="true"></i> Release
                            Date:</b> ${FormatUtil.date(package.releaseDate())}</p>
                        </#if>
                        <p><b><i class="fas fa-sd-card fa-fw" aria-hidden="true"></i> App
                            Size:</b> ${FormatUtil.fileSize(package.uncompressedSize())}</p>
                        <p><b><i class="fas fa-user fa-fw" aria-hidden="true"></i> Author:</b>
                            <a href="/library?coder=${package.author()}">${package.author()}</a>
                        </p>
                        <#if package.authors()?size gt 0>
                        <p><b><i class="fas fa-users fa-fw" aria-hidden="true"></i> Developers:</b>
                            ${package.authors()?join(", ")}</p>
                        </#if>
                        <#if package.contributors()?size gt 0>
                        <p><b><i class="fas fa-star fa-fw" aria-hidden="true"></i> Contributors:</b>
                            ${package.contributors()?join(", ")}</p>
                        </#if>
                    </div>
                </article>
                <article class="message is-${color}">
                    <div class="message-header">
                        <p><i class="fas fa-info fa-fw" aria-hidden="true"></i> Technical Information </p>
                    </div>
                    <div class="message-body">
                        <p><b><i class="fas fa-file-contract fa-fw" aria-hidden="true"></i>
                            Manifest:</b> <a href="https://github.com/OpenShopChannel/Apps/blob/master/contents/${package.slug()}.oscmeta">${package.slug()}.oscmeta</a></p>
                        <p><b><i class="fas fa-hashtag fa-fw" aria-hidden="true"></i>
                            Title Version:</b> ${package.titleInfo().titleVersion()}</p>
                        <p><b><i class="fas fa-id-card fa-fw" aria-hidden="true"></i>
                            Title ID:</b> ${package.titleInfo().titleId()}</p>
                    </div>
                </article>
                <article class="message is-${color}">
                    <div class="message-header">
                        <p><i class="fas fa-gears fa-fw" aria-hidden="true"></i> Supported Platforms</p>
                    </div>
                    <div class="message-body">
                        <#include "../includes/platforms.ftl">
                    </div>
                </article>
                <article class="message is-${color}">
                    <div class="message-header">
                        <p><i class="fas fa-gamepad fa-fw" aria-hidden="true"></i> Peripherals</p>
                    </div>
                    <div class="message-body">
                        <#include "../includes/peripherals.ftl">
                    </div>
                </article>
                <article class="message is-${color}">
                    <div class="message-header">
                        <p><i class="fas fa-gamepad fa-share-alt" aria-hidden="true"></i> Share</p>
                    </div>
                    <div class="message-body">
                        <b><i class="fas fa-info fa-link" aria-hidden="true"></i> Application link:</b>
                        <input class="input is-${color}" type="text" readonly
                               value="https://oscwii.org${request.servletPath}">
                        <b><i class="fas fa-info fa-link mt-3" aria-hidden="true"></i> Author link:</b>
                        <input class="input is-${color}" type="text" readonly
                               value="https://oscwii.org/library?coder=${package.author()}">
                        <b><i class="fas fa-info fa-share mt-3" aria-hidden="true"></i> Social media:</b><br>
                        <a class="button is-${color}"
                           href="https://twitter.com/intent/tweet?text=${package.name()} on Open Shop Channel: https://oscwii.org${request.servletPath} @openshopwii">
                            <span class="icon">
                                <i class="fab fa-twitter"></i>
                            </span>
                            <span>Twitter</span>
                        </a>
                    </div>
                </article>
            </div>

            <div class="column">
                <div class="divider is-left">Description</div>
                <#if package.flags()?seq_contains(Flags.DEPRECATED) >
                    <div class="notification is-warning is-bold" style="margin-bottom: 10px;">
                        <i class="fa-solid fa-triangle-exclamation"></i> <b>Notice:</b>
                        This homebrew application is deprecated, and should only be used when a better alternative
                        is not available.
                    </div>
                </#if>
                <#if package.flags()?seq_contains(Flags.WRITES_TO_NAND) >
                    <div class="notification is-danger is-bold" style="margin-bottom: 10px;">
                        <i class="fa-solid fa-triangle-exclamation"></i> <b>Notice:</b>
                        This homebrew application makes permanent changes to the system's NAND, thus,
                        this application should be used with caution. (And generally, you should always use homebrew
                        applications with caution!)
                    </div>
                </#if>
                <#if package.description().shortDesc() == package.description().longDesc()>
                    <div id="description"></div>
                <#else>
                    <pre><b>${package.description().shortDesc()}</b></pre>
                    <pre style="white-space: pre-wrap">${package.description().longDesc()}</pre>
                </#if>

                <div class="divider is-left" id="download">Recommended Download</div>

                <div class="card mb-4">
                    <header class="card-header">
                        <p class="card-header-title">
                            <i class="fas fa-file-archive fa-fw" aria-hidden="true" style="margin-right: 5px"></i>
                            ${package.name()} (.ZIP)
                        </p>
                        <span style="float: right" class="card-header-icon">
                            <span class="tag is-${color}">${FormatUtil.fileSize(archive.size())}</span>
                        </span>
                    </header>
                    <div class="card-content">
                        <div class="content">
                            A zip file containing the application.<br>
                            <small>MD5 Checksum: <code>${archive.hash()}</code></small>
                        </div>
                    </div>
                    <footer class="card-footer">
                        <a href="${archive.url()}" class="card-footer-item has-text-${color}">
                            <i class="fas fa-download fa-fw" aria-hidden="true" style="margin-right: 5px"></i>
                            Download File
                        </a>
                    </footer>
                </div>

                <div>
                    <div class="divider is-left">Other Download Options</div>
                </div>

                <div class="card mb-4 is-${color}">
                    <header class="card-header">
                        <p class="card-header-title">
                            <i class="fas fa-terminal fa-fw" aria-hidden="true" style="margin-right: 5px"></i>
                            boot.${package.packageType()}
                        </p>
                        <span style="float: right" class="card-header-icon">
                            <span class="tag is-${color}">${FormatUtil.fileSize(binary.size())}</span>
                        </span>
                    </header>
                    <div class="card-content">
                        <div class="content">
                            The application's binary.<br>
                            <small>MD5 Checksum: <code>${binary.hash()}</code></small>
                        </div>
                    </div>
                    <footer class="card-footer">
                        <a href="${binary.url()}" class="card-footer-item has-text-${color}">
                            <i class="fas fa-download fa-fw" aria-hidden="true" style="margin-right: 5px"></i>
                            Download File
                        </a>
                    </footer>
                </div>

                <div class="card mb-4">
                    <header class="card-header">
                        <p class="card-header-title">
                            <i class="fas fa-file-signature fa-fw" aria-hidden="true" style="margin-right: 5px"></i>
                            meta.xml
                        </p>
                    </header>
                    <div class="card-content">
                        <div class="content">
                            The meta.xml provided with the application, containing information specified by the
                            developer such as version, coder, and description.
                        </div>
                    </div>
                    <footer class="card-footer">
                        <a href="${metaXml.url()}"
                           class="card-footer-item has-text-${color}">View File</a>
                    </footer>
                </div>

                <div class="card mb-4">
                    <header class="card-header">
                        <p class="card-header-title">
                            <i class="fas fa-image fa-fw" aria-hidden="true" style="margin-right: 5px"></i>icon.png
                        </p>
                        <span style="float: right" class="card-header-icon">
                            <span class="tag is-${color}">${FormatUtil.fileSize(packageIcon.size())}</span>
                        </span>
                    </header>
                    <div class="card-content">
                        <div class="content">
                            The application icon image.
                        </div>
                    </div>
                    <footer class="card-footer">
                        <a href="${packageIcon.url()}" class="card-footer-item has-text-${color}">View File</a>
                    </footer>
                </div>

            </div>
        </div>
    </div>
</div>
<#include "../includes/footer.ftl">
</body>
</html>

