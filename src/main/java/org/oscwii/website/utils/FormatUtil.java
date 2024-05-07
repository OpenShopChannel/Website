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

package org.oscwii.website.utils;

import org.oscwii.website.Package;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@SuppressWarnings("unused")
public class FormatUtil
{
    public static String date(long seconds)
    {
        Date date = Date.from(Instant.ofEpochSecond(seconds));
        return DATE_FORMAT.format(date);
    }

    public static String fileSize(long size)
    {
        float working = (float) size;
        for(String unit : UNITS)
        {
            if(Math.abs(working) < 1000)
                return "%3.1f%s".formatted(working, unit);
            working /= 1000;
        }

        return "%.1f%s".formatted(working, "PB");
    }

    public static Map<String, String> applicationBadges(Package app)
    {
        Instant now = Instant.now();
        Map<String, String> badges = new HashMap<>();

        // Released in the past 30 days
        if(now.getEpochSecond() - app.releaseDate() < 2592000)
            badges.put("recently-updated", "Recently Updated");

        // Check if it's the app's "birthday"
        if(app.releaseDate() > 0)
        {
            LocalDate today = now.atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate release = Instant.ofEpochSecond(app.releaseDate()).atZone(ZoneId.systemDefault()).toLocalDate();

            if(today.getMonthValue() == release.getMonthValue() && today.getDayOfMonth() == release.getDayOfMonth())
            {
                if(!today.equals(release))
                {
                    String suffix;
                    int age = today.getYear() - release.getYear();
                    if(age % 10 == 1 && age % 100 != 11)
                        suffix = "st";
                    else if(age % 10 == 2 && age % 100 != 12)
                        suffix = "nd";
                    else if(age % 10 == 3 && age % 100 != 13)
                        suffix = "rd";
                    else
                        suffix = "th";

                    badges.put("birthday-app", "Happy %d%s Birthday, %s".formatted(age, suffix, app.name()));
                }
            }
        }

        return badges;
    }

    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("MMMM d, y", Locale.ENGLISH);
    private static final String[] UNITS = new String[]{"B", "KB", "MB", "GB", "TB"};
}
