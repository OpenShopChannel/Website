/*
 * Copyright (c) 2021-2024 Open Shop Channel - All rights reserved.
 */

const toolbar = webix.ui({
    margin: 10,
    container: "toolbar",
    responsive: true,
    rows: [
        {
            view: "toolbar",
            css: {"background-color": "unset !important"},
            borderless: true,
            responsive: true,
            cols: [
                {
                    view: "button",
                    id: "view_manifest",
                    label: '<span style="color: white;"><i class="fas fa-file-contract" aria-hidden="true"></i> View Manifest</span>',
                    tooltip: "View app manifest on GitHub",
                    css: "webix_primary",
                    click: function () {
                        window.open("https://github.com/OpenShopChannel/Apps/blob/master/contents/" + encodeURIComponent("${package.slug()}") + ".oscmeta", '_blank');
                    },
                    width: 145
                },
                {
                    view: "button",
                    id: "report_outdated",
                    label: '<i class="fas fa-stopwatch" aria-hidden="true"></i> Report Outdated',
                    tooltip: "Report this application as outdated. Requires a GitHub account.",
                    css: "webix_danger",
                    click: function () {
                        window.open("https://github.com/OpenShopChannel/outdated-apps/issues/new?template=outdated.yml&current-version=" + encodeURIComponent("${package.version()}") + "&title=" + encodeURIComponent("${package.name()}"), '_blank');
                    },
                    width: 160
                },
                {
                    hidden: ($(window).width() < 1380),
                },
                {
                    hidden: !($(window).width() < 1380)
                },
                {
                    view: "button",
                    id: "download",
                    label: '<i class="fas fa-download" aria-hidden="true"></i> Download',
                    tooltip: "Go to the download section.",
                    css: "webix_secondary",
                    click: function () {
                        window.location = "#download";
                    },
                    width: 160
                },
                {
                    view: "template",
                    id: "danbo_icon",
                    css: {"background-color": "unset !important"},
                    hidden: ($(window).width() < 480),
                    template: "<picture><source srcset='/static/images/danbobar-dark.png' media='(prefers-color-scheme: dark)'> <img src='/static/images/danbobar-light.png'></picture>",
                    width: 140,
                    borderless: true
                },
            ]
        }
    ]
});

webix.event(window, "resize", function () {
    toolbar.adjust();
})
