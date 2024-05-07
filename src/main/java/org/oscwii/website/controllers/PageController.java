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

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@Controller
public class PageController
{
    @GetMapping("/about")
    public String about(Model model)
    {
        model.addAttribute("version", System.getProperty("oscweb.release"));
        return "pages/about";
    }

    @GetMapping("/beta")
    public String beta(@RequestParam(required = false) String redirect, Model model)
    {
        if(!List.of("betasite", "oscdlbrowser", "theme").contains(redirect))
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        model.addAttribute("redirect", redirect);
        return "pages/beta";
    }

    // April's Fools 2021
    @GetMapping("/browser")
    public String browserAF21()
    {
        return "pages/aprilfools21";
    }

    @GetMapping("/donate")
    public String donate()
    {
        return "pages/donate";
    }

    @GetMapping("/faq")
    public String faq()
    {
        return "redirect:/help/faq";
    }

    @GetMapping({"/help", "/help/{article}"})
    public String help(Model model, @PathVariable(value = "article", required = false) Optional<String> optArticle)
    {
        String article = optArticle.orElse("welcome");
        model.addAttribute("name", article);
        if(optArticle.isPresent() && getClass().getResource("/templates/pages/help/articles/" + article + ".ftl") == null)
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        //noinspection SpringMVCViewInspection
        return "pages/help/articles/" + article;
    }

    @GetMapping("/tools/metaxml")
    public String metaGen()
    {
        return "pages/metagen";
    }

    @GetMapping("/publish")
    public String publish()
    {
        return "pages/publish";
    }

    @ModelAttribute("request")
    private HttpServletRequest getRequest(HttpServletRequest request)
    {
        return request;
    }
}
