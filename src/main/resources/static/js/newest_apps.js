var newest_apps = webix.ui({
    margin: 10,
    container: "newest_apps",
    responsive: true,
    rows: [
        {
            view: "toolbar",
            css: {"background-color": "unset !important"},
            borderless: true,
            responsive: true,
            cols: [
                {
                    view: "template",
                    css: {"background-color": "unset !important"},
                    template: '<h1 class="subtitle">Recent Additions / Updates</h1>',
                    borderless: true,
                    width: ($(window).width() < 480) ? $(window).width() - 54 : 420
                },
                {},
                {
                    view: "button",
                    label: "View All Apps",
                    click: function () {
                        window.open("/library", "_self");
                    },
                    width: ($(window).width() < 480) ? $(window).width() - 54 : 120
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
        },
        {
            view: "dataview",
            id: "appsview",
            css: {"background-color": "unset !important"},
            responsive: true,
            scroll: false,
            select: true,
            template: function (obj) {
                return "<div class='notification' style='margin-bottom: unset; margin-top: 0.25rem; padding: 0 0.5rem 0 0.5rem; text-align: center;'>"
                    + humanDate(obj.release_date) + "</div><div style='line-height:35px; height:42px; white-space:nowrap; overflow:hidden;'>"
                    + "<i class='" + CategoryIcon(obj.category) + "' aria-hidden='true' style='margin-right: .75em'></i><b>"
                    + obj.display_name + "</b> " + obj.version + "</div>" +
                    "<div style='float: left; height: 100%; margin-right: 10px;'>" +
                    "<img src='" + obj.icon_url + "'></div>" +
                    "<div><div>" + obj.short_description + "<br>By " + obj.coder + "<br></div></div>";
            },
            on: {
                "onItemClick": function (id) {
                    window.location = "/library/app/" + this.getItem(id).internal_name;
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
                height: 180,
                width: 380,
                type: "tiles",
            },
            borderless: true,
            yCount: 1,
            // TODO API v3
            url: "https://api.oscwii.org/v2/primary/packages",
            ready: function () {
                this.sort("release_date", "des");
            }
        }
    ]
});

webix.event(window, "resize", function () {
    newest_apps.adjust();
})

function CategoryIcon(category) {
    switch (category) {
        case "utilities":
            return "fas fa-cog fa-fw"
        case "emulators":
            return "fas fa-microchip fa-fw"
        case "games":
            return "fas fa-gamepad fa-fw"
        case "media":
            return "fas fa-photo-video fa-fw"
        case "demos":
            return "fas fa-vial fa-fw"
        default:
            return "fas fa-question fa-fw"
    }
}

function humanDate(date) {
    var d = new Date(date * 1000);
    var month = d.getMonth() + 1;
    return d.getDate() + "/" + month + "/" + d.getFullYear();
}