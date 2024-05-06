<#import "../base.ftl" as base>

<@base.page title="Website Badges" subtitle="">
    Badges are automatically given to applications which meet a certain criteria.<br>
    They are intended to highlight potentially useful information about an app.<br><br>
    <table class="table is-fullwidth">
        <thead>
        <tr>
            <th>Badge</th>
            <th>Name</th>
            <th>Information</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><img src="/static/images/badges/recently-updated.png" alt="{{ title }}" width="160"></td>
            <td>Recently Updated</td>
            <td>Given to applications which were added or updated in the last 30 days.</td>
        </tr>
        <tr>
            <td><img src="/static/images/badges/birthday-app.png" alt="{{ title }}" width="160"></td>
            <td>Birthday App</td>
            <td>Given to applications celebrating one or more years since their last update.</td>
        </tr>
        </tbody>
    </table>
</@base.page>
