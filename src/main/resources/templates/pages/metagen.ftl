<#import "../includes/header.ftl" as header>

<html>
<@header.header title="Metadata XML Generator">
    <script src="/static/js/metagen.js"></script>
</@header.header>

<body>
<#include "../includes/navigation.ftl">
<section class="section">
    <div class="container">
        <nav class="breadcrumb" aria-label="breadcrumbs">
            <ul>
                <li>
                    <a href="/">
                <span class="icon is-small">
                  <i class="fas fa-home" aria-hidden="true"></i>
                </span>
                        <span>Open Shop Channel</span>
                    </a>
                </li>
                <li class="is-active">
                    <a href="#">
                <span class="icon is-small">
                  <i class="fas fa-tools" aria-hidden="true"></i>
                </span>
                        <span>Developer Tools</span>
                    </a>
                </li>
                <li class="is-active">
                    <a href="">
                <span class="icon is-small">
                  <i class="fas fa-file-signature" aria-hidden="true"></i>
                </span>
                        <span>Metadata XML Generator</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="columns">
            <div class="column">
                <h1 class="title">
                    Metadata XML Generator
                </h1>
                <p class="subtitle">
                    Quickly generate a meta.xml file for your Homebrew app.
                </p>
            </div>
        </div>
        <div class="columns">
            <div class="column is-one-third">
                <div id="properties"></div>
                <script type="text/javascript" charset="utf-8">
                    webix.ready(function () {
                        let properties_pane = webix.ui({
                            margin: 10,
                            height: 625,
                            container: "properties",
                            responsive: true,
                            rows: [
                                {
                                    view: "property",
                                    id: "sets",
                                    nameWidth: 200,
                                    elements: [
                                        {label: "Metadata", type: "label"},
                                        {label: "App Name", type: "text", id: "app_name"},
                                        {label: "Coder", type: "text", id: "app_author"},
                                        {label: "Version", type: "text", id: "app_version"},
                                        {label: "Short Description", type: "text", id: "app_short_description"},
                                        {label: "Long Description", type: "popup", id: "app_long_description"},
                                        {label: "Release Date", type: "date", id: "app_release_date"},
                                        {label: "AHB access", type: "checkbox", id: "app_ahb_access"}
                                    ],
                                    on: {
                                        onAfterEditStop: function () {
                                            update_output()
                                        },
                                        onCheck: function () {
                                            update_output()
                                        }
                                    }
                                }
                            ]
                        });

                        webix.event(window, "resize", function(){ properties_pane.adjust(); })
                    });
                </script>

            </div>
            <div class="column">
                <textarea class="textarea" readonly id="output" rows="25"></textarea>
            </div>
        </div>
    </div>
</section>
<#include "../includes/footer.ftl">
</body>
</html>
