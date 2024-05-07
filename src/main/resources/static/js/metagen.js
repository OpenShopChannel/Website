function pad2(n) {
    return n < 10 ? '0' + n : n
}

function ahb_access(n) {
    if (n === true)
        return "\n<ahb_access/>";
    else
        return "";
}

function update_output() {
    var formatteddate;

    if ($$("sets").getItem("app_release_date").value) {
        var date = $$("sets").getItem("app_release_date").value;
        formatteddate = date.getFullYear().toString() + pad2(date.getMonth() + 1) + pad2(date.getDate()) + pad2(date.getHours()) + pad2(date.getMinutes()) + pad2(date.getSeconds());
    } else {
        formatteddate = "";
    }

    const result = document.querySelector('#output');
    result.textContent = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<app version="1">
	<name>${$$("sets").getItem("app_name").value}</name>
	<version>${$$("sets").getItem("app_version").value}</version>
	<release_date>${formatteddate}</release_date>
	<coder>${$$("sets").getItem("app_author").value}</coder>
	<short_description>${$$("sets").getItem("app_short_description").value}</short_description>
	<long_description>${$$("sets").getItem("app_long_description").value}
</long_description>${ahb_access($$("sets").getItem("app_ahb_access").value)}
</app>
`;
}