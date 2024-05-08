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
import org.oscwii.website.config.OSCWebConfig;
import org.oscwii.website.services.Events;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class BaseController
{
    @Autowired
    private Events events;
    @Autowired
    private OSCWebConfig config;

    @ModelAttribute("request")
    protected HttpServletRequest getRequest(HttpServletRequest request)
    {
        return request;
    }

    @ModelAttribute("enabledEvents")
    private boolean enabledEvents()
    {
        return config.enableEvents();
    }

    @ModelAttribute("events")
    private Events getEvents()
    {
        return events;
    }
}
