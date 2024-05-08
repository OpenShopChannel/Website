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

package org.oscwii.website.services;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.oscwii.website.model.Ticker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

@Service
public class TickerList
{
    private List<Ticker> tickers = new ArrayList<>();

    @Autowired
    public TickerList(Gson gson) throws IOException
    {
        Path path = Path.of("settings", "ticker.json");
        if(Files.exists(path))
        {
            try(BufferedReader reader = Files.newBufferedReader(path))
            {
                this.tickers = gson.fromJson(reader, new TypeToken<>(){});
            }
        }
    }

    public List<Ticker> getTickers()
    {
        return tickers;
    }
}
