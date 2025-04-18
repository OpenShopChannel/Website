/*
 * Copyright (c) 2021-2025 Open Shop Channel
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

package org.oscwii.website.services;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.oscwii.website.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Service
public class Events
{
    private List<Event> events = new ArrayList<>();

    @Autowired
    public Events(Gson gson) throws IOException
    {
        Path path = Path.of("settings", "events.json");
        if(Files.exists(path))
        {
            try(BufferedReader reader = Files.newBufferedReader(path))
            {
                this.events = gson.fromJson(reader, new TypeToken<>(){});
            }
        }
    }

    public boolean isEventRunning()
    {
        long now = Instant.now().getEpochSecond();
        for(Event event : events)
        {
            if(event.startTime() < now && event.endTime() > now)
                return true;
        }

        return false;
    }

    public Event getCurrentEvent()
    {
        long now = Instant.now().getEpochSecond();
        for(Event event : events)
        {
            if(event.startTime() < now && event.endTime() > now)
                return event;
        }

        return null;
    }

    public List<Event> getEvents()
    {
        return events;
    }
}
