/*
 * Copyright (c) 2021-2024 Open Shop Channel - All rights reserved.
 */

const params = new URLSearchParams(window.location.search);

const library = webix.ui({
    margin: 10,
    container: "AppsList",
    responsive: true,
    rows: [
        {
            view: "dataview",
            id: "appsview",
            css: {"background-color": "unset"},
            responsive: true,
            scroll: false,
            select: true,
            tooltip: function (obj) {
                return "<i class='fas fa-calendar-alt fa-fw' aria-hidden='true' style='margin-right: .25em'></i>"
                    + new Date(obj.release_date * 1000).toLocaleDateString('en-US', {
                        month: 'long',
                        day: 'numeric',
                        year: 'numeric'
                    }) + "<br>" +
                    "<i class='fas fa-sd-card fa-fw' aria-hidden='true' style='margin-right: .25em'></i>" + file_size(obj.extracted) + " (Extracted)<br>" +
                    "<i class='fas fa-wrench fa-fw' aria-hidden='true' style='margin-right: .25em'></i>Version " + obj.version;
            },
            template: function (obj) {
                return "<a href='/library/app/" + obj.internal_name + "' style='color:inherit;'><div style='line-height:35px; height:42px; white-space:nowrap; overflow:hidden;'>" +
                    "<i class='" + CategoryIcon(obj.category) + "' aria-hidden='true' style='margin-right: .75em'></i>"
                    + obj.display_name + "</div>" +
                    "<div style='float: left; height: 100%; margin-right: 10px;'>" +
                    "<img src='" + obj.icon_url + "' style='height: 48px'></div>" +
                    "<div><div>" + obj.short_description + "<br>By " + obj.coder + "<br></div></div></a>";
            },
            on: {
                "onAfterRender": function () {
                    // update amount of apps
                    $$("amount_of_apps").setValue(this.count() + " Apps")
                },
                "onLoadError": function () {
                    this.parse([{
                        "display_name": "Error",
                        "short_description": "There was an error loading the library.",
                        "icon_url": "/static/images/apipaper.png",
                        "coder": "Danbo. Click to refresh library.",
                        "internal_name": "../"
                    }])
                },
                "onBeforeLoad": function () {
                    // show loading screen
                    webix.extend(this, webix.ProgressBar);
                    this.showProgress();
                },
                "onAfterLoad": function () {
                    // hide loading screen
                    this.hideProgress();
                }
            },
            type: {
                height: 150,
                width: 380,
                type: "tiles",
            },
            borderless: true,
            yCount: 7,
            // TODO API v4
            url: "https://api.oscwii.org/v2/primary/packages",
            ready: function () {
                if (params.has("page")) {
                    // navigate to specified page number using pager "paginationbar"
                    $$("paginationbar").select(params.get("page") - 1);
                }
                if (params.has("coder")) {
                    this.filter(function (obj) {
                        return obj.coder !== params.get("coder");
                    });
                }
                this.sort("display_name", "asc");
            },
            pager: "paginationbar"
        },
        {
            view: "pager",
            id: "paginationbar",
            on: {
                "onAfterPageChange": function () {
                    // scroll page back up
                    window.scrollTo(0, 0)

                    // change URL without reloading page, with the new page number
                    let url = new URL(window.location.href);
                    url.searchParams.set("page", this.config.page + 1);
                    window.history.replaceState({}, "", url);
                }
            },
            size: 24,
            group: 4,
            template: "{common.first()}{common.prev()}{common.pages()}{common.next()}{common.last()}"
        }
    ]
});

library_toolbar = webix.ui({
    margin: 10,
    container: "LibraryToolbar",
    responsive: true,
    rows: [
        {
            view: "toolbar",
            borderless: true,
            responsive: true,
            css: {"background-color": "unset"},
            cols: [
                {
                    view: "search",
                    placeholder: "Search Applications..",
                    id: "search",
                    on: {
                        "onTimedKeyPress": function () {
                            // set category to disabled if search bar has text
                            var value = this.getValue().toLowerCase();
                            if (value) {
                                $$("category").disable()
                                $$("category").setValue("All Apps")
                            } else {
                                $$("category").enable()
                            }
                            $$("appsview").filter(function (obj) {
                                return obj.display_name.toLowerCase().indexOf(value) !== -1;
                            })
                        }
                    },
                    // properly scale search bar on mobile devices
                    width: ($(window).width() < 480) ? $(window).width() - 92 : 300,
                },
                {
                    view: "combo",
                    id: "category",
                    hidden: ($(window).width() < 480),
                    value: "All Apps",
                    on: {
                        "onChange": function (category) {
                            if (category === "All Apps")
                                category = ""
                            else
                                category = category.toLowerCase();

                            $$("appsview").filter(function (obj) {
                                return obj.category.toLowerCase().indexOf(category) !== -1;
                            })
                        }
                    },
                    width: 200,
                    options: ["All Apps", "Utilities", "Emulators", "Games", "Media", "Demos"]
                },
                {},
                {
                    view: "label",
                    id: "amount_of_apps",
                    label: "Loading...",
                    hidden: ($(window).width() < 480),
                    align: "right"
                },
                {
                    view: "template",
                    id: "danbo_icon",
                    css: {"background-color": "unset"},
                    hidden: ($(window).width() < 480),
                    template: "<picture><source srcset='/static/images/danbobar-dark.png' media='(prefers-color-scheme: dark)'> <img src='/static/images/danbobar-light.png'></picture>",
                    width: 140,
                    borderless: true
                },
            ]
        }
    ]
});


// convert file length to human-readable units
function file_size(length) {
    const units = ['', 'K', 'M', 'G', 'T', 'P', 'E', 'Z'];
    for (let i = 0; i < units.length; i++) {
        if (Math.abs(length) < 1000.0) {
            return length.toFixed(1) + units[i] + "B";
        }
        length /= 1000.0;
    }
    return length.toFixed(1) + 'Yi' + "B";
}

webix.event(window, "resize", function () {
    library.adjust();
})
webix.event(window, "resize", function () {
    library_toolbar.adjust();
})