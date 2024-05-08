/*
 * Copyright (c) 2021-2024 Open Shop Channel
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

package org.oscwii.website.controllers;

import cz.jiripinkas.jsitemapgenerator.ChangeFreq;
import cz.jiripinkas.jsitemapgenerator.WebPage;
import cz.jiripinkas.jsitemapgenerator.generator.SitemapGenerator;
import org.oscwii.website.OSCAPI;
import org.oscwii.website.model.Package;
import org.oscwii.website.config.OSCWebConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping(produces = MediaType.APPLICATION_XML_VALUE)
public class SitemapController
{
    private final OSCAPI api;
    private final OSCWebConfig config;

    @Autowired
    public SitemapController(OSCAPI api, OSCWebConfig config)
    {
        this.api = api;
        this.config = config;
    }

    @GetMapping("/sitemap.xml")
    public String sitemap() throws URISyntaxException
    {
        return buildSitemap();
    }

    private String buildSitemap() throws URISyntaxException
    {
        SitemapGenerator generator = SitemapGenerator.of(config.baseUrl())
                .defaultChangeFreqWeekly()
                .addPage("")
                .addPage("about")
                .addPage("donate")
                .addPage("help")
                .addPage("tools/metaxml")
                .addPage("publish")
                .addPage(page("library"));

        // Add all help articles
        for(String article : getHelpArticles())
            generator.addPage("help/" + article);

        // Add all packages
        for(Package app : api.getPackages())
            generator.addPage(page("library/app/" + app.slug()));

        return generator.toString();
    }

    private List<String> getHelpArticles() throws URISyntaxException
    {
        URL folder = getClass().getResource("/templates/pages/help/articles/");
        Assert.notNull(folder, "Help articles folder not found");
        return Arrays.stream(Objects.requireNonNull(Path.of(folder.toURI()).toFile().listFiles()))
                .map(file -> file.getName().replace(".ftl", ""))
                .toList();
    }

    private WebPage page(String name)
    {
        return WebPage.builder()
                .name(name)
                .changeFreq(ChangeFreq.DAILY)
                .build();
    }
}
