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

package org.oscwii.website;

import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.concurrent.TimeUnit;

@SpringBootApplication
@Controller
@ConfigurationPropertiesScan(value = "org.oscwii.website.config")
public class WebsiteApp
{
    private final Logger logger = LogManager.getLogger(WebsiteApp.class);

    @Autowired
    private OSCAPI api;

    @GetMapping("/")
    public String home(Model model, HttpServletRequest request)
    {
        model.addAttribute("request", request)
                .addAttribute("featuredPackage", api.getFeaturedApp());
        return "pages/home";
    }

    @Scheduled(fixedDelay = 1, timeUnit = TimeUnit.HOURS)
    public void refreshCatalog()
    {
        api.loadPackages();
        api.retrieveFeaturedApp();
        logger.info("Fetched {} packages from the catalog", api.getPackages().size());
    }

    public static void main(String[] args)
    {
        SpringApplication.run(WebsiteApp.class, args);
    }
}
