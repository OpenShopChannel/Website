<#macro article title id>
    <a class="panel-block<#if id == name > is-active</#if>" href="/help/${id}">
    <span class="panel-icon">
      <i class="fas fa-book" aria-hidden="true"></i>
    </span>
        ${title}
    </a>
</#macro>

<#macro category text>
    <div class="panel-block" style="padding: .1em .75em; justify-content: center">
        ${text}
    </div>
</#macro>

<article class="panel is-link">
    <p class="panel-heading">
        Help & Troubleshooting
    </p>
    <@category "General"/>
    <@article "Welcome" "welcome"/>
    <@article "Frequently Asked Questions" "faq"/>
    <@category "Homebrew Browser"/>
    <@article "Installation Guide" "hbb-install-guide"/>
    <@article "Read Error -6" "readerror-6"/>
    <@article "Wii U Wii Mode Support (vWii)" "vwii-support"/>
    <@category "LibreShop"/>
    <@article "Installation Guide" "libreshop-install-guide"/>
</article>
