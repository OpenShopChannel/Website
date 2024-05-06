<#import "../base.ftl" as base>

<@base.page title="Wii U Wii Mode Support (vWii)"
    subtitle="Does the Homebrew Browser support the Wii U's Wii Mode (vWii)?">
    The Homebrew Browser itself <b><u>does support</u></b> the Wii U's Wii Mode (vWii).<br><br>
    However, some applications, specifically those who write to NAND (Wii internal memory) or install cIOSs, might not work properly,
    or even be harmful, when running in vWii.
    <b class="has-text-danger">Before running any application that you suspect writes to NAND, make sure it supports the Wii U.</b>
</@base.page>
