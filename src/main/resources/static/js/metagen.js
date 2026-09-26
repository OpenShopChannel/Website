/*
 * Copyright (c) 2021-2026 Open Shop Channel
 *
 * This program is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this
 * program. If not, see <https://www.gnu.org/licenses/>.
 */

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