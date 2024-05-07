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

import org.oscwii.website.Category;
import org.oscwii.website.OSCAPI;
import org.oscwii.website.Package;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;

@Controller
@RequestMapping("/library")
public class LibraryController extends BaseController
{
    @Autowired
    private OSCAPI api;

    @GetMapping
    public String library(@RequestParam(required = false) Optional<String> optCoder, Model model)
    {
        model.addAttribute("coder", optCoder.orElse(""))
                .addAttribute("newestPackages", api.getNewestPackages());
        return "pages/newlibrary";
    }

    @GetMapping("/app/{slug}")
    public String app(@PathVariable String slug, Model model)
    {
        Package app = api.getBySlug(slug);
        if(app == null)
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        model.addAttribute("package", app)
                .addAttribute("categoryDisplay", getCategoryDisplay(app))
                .addAttribute("color", getColor(app.category()));
        return "pages/app";
    }

    @SuppressWarnings("MVCPathVariableInspection")
    @GetMapping("/theme/{theme}")
    public String theme()
    {
        return "redirect:/beta?redirect=theme";
    }

    private String getCategoryDisplay(Package app)
    {
        return api.getCategories().stream()
                .filter(category -> category.name().equals(app.category()))
                .findFirst()
                .map(Category::displayName)
                .orElse(app.category());
    }

    private String getColor(String category)
    {
        return switch(category)
        {
            case "emulators" -> "success";
            case "games"     -> "danger";
            case "media"     -> "warning";
            default          -> "info";
        };
    }
}
