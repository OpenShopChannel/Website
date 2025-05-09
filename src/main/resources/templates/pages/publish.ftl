<#import "../includes/header.ftl" as header>

<html>
<@header.header title="Publish"/>

<body>
<#include "../includes/navigation.ftl">
<section class="section">
    <div class="container">
        <h1 class="title">
            Publish Application
        </h1>
        <article class="message is-danger">
            <div class="message-header">
                <p>Submissions through this form are closed.</p>
            </div>
            <div class="message-body">
                Open Shop Channel are in the process of a complete internal overhaul, with a new repository system.<br>
                <b>Submissions through the website form will be closed until further notice.</b><br><br>
                <b>To add or update an application to Open Shop Channel</b>, we ask you to <b>submit an application manifest
                on <a href="https://github.com/OpenShopChannel/Apps">GitHub</a> according
                to the <a href="https://docs.oscwii.org/repository-manager/">Repository Manager documentation</a></b>, through a Pull Request.<br><br>
                Thanks for your cooperation.<br><br>
                <b>Note: If you have already submitted an application through this form and did not receive an e-mail response,
                    your submission has been discarded and will not be looked at in the future.</b><br><br>
                <figure class="image is-3by1">
                    <picture>
                        <source srcset="/static/images/betabanner.png" media="(prefers-color-scheme: dark)">
                        <img src="/static/images/betabanner.png">
                    </picture>

                </figure>
            </div>
        </article>

        <form class="form-horizontal" action=""
              method="post">
            <fieldset>


                <!-- Text input-->
                <div class="field">
                    <label class="label" for="email">Email Address</label>
                    <div class="control">
                        <input id="email" name="email" type="text" placeholder="developer@oscwii.org" class="input "
                               required="" disabled>
                        <p class="help"> Best way to contact you.</p>
                    </div>
                </div>

                <!-- Text input-->
                <div class="field">
                    <label class="label" for="appname">Application Name</label>
                    <div class="control">
                        <input id="appname" name="appname" type="text" class="input " required="" disabled>
                        <p class="help">Name of your app.</p>
                    </div>
                </div>

                <!-- Text input-->
                <div class="field">
                    <label class="label" for="supportedperipherals">Supported Peripherals</label>
                    <div class="control">
                        <input id="supportedperipherals" name="supportedperipherals" type="text" class="input " required="" disabled>
                        <p class="help">e.g. 2 Wii Remotes, GameCube Controller, USB Keyboard, Nunchuk.</p>
                    </div>
                </div>

                <!-- Text input-->
                <div class="field">
                    <label class="label" for="authorname">Author Name</label>
                    <div class="control">
                        <input id="authorname" name="authorname" type="text" placeholder="dhtdht020" class="input "
                               required="" disabled>
                        <p class="help">Your name or username.</p>
                    </div>
                </div>

                <!-- Multiple Radios -->
                <div class="field">
                    <label class="label" for="reponame">Type</label>
                    <div class="control">
                        <label class="radio" for="reponame-0">
                            <input type="radio" name="reponame" id="reponame-0" value="App" checked="checked"
                                   required="required" disabled>
                            App
                        </label>
                        <label class="radio" for="reponame-1">
                            <input type="radio" name="reponame" id="reponame-1" value="Theme" required="required" disabled>
                            Theme
                        </label>
                    </div>
                </div>

                <!-- Select Basic -->
                <div class="field">
                    <label class="label" for="existingselect">If it is an update to an existing listing, select an
                        existing app / theme:</label>
                    <div class="control">
                        <div class="select">
                            <select id="existingselect" name="existingselect" class="" disabled>
                                <option>It's a new app</option>
                                <#--<optgroup label="Apps">
                                    {% for package in packages %}
                                        <option>{{ package["display_name"] }} (App)</option>
                                    {% endfor %}
                                </optgroup>
                                <optgroup label="Themes">
                                    {% for theme in themes %}
                                        <option>It's a theme</option>
                                    {% endfor %}
                                </optgroup>-->
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Text input-->
                <div class="field">
                    <label class="label" for="zipurl">URL to application zip</label>
                    <div class="control">
                        <input id="zipurl" name="zipurl" type="text" placeholder="https://example.com/amazingstuff.zip"
                               class="input " required="" disabled>

                    </div>
                </div>

                <!-- Textarea -->
                <div class="field">
                    <label class="label" for="moredetails">More Details</label>
                    <div class="control">
                        <textarea class="textarea" id="moredetails" name="moredetails" disabled></textarea>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="field">
                    <div class="control">
                        <button id="singlebutton-0" name="singlebutton-0" type="submit" class="button is-link" disabled>Submit
                            app for moderation
                        </button>
                    </div>
                </div>

            </fieldset>
        </form>
    </div>
</section>

<script src="https://s.pageclip.co/v1/pageclip.js" charset="utf-8"></script>
<#include "../includes/footer.ftl">
</body>
</html>
