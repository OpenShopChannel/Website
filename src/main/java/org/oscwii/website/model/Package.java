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

package org.oscwii.website.model;

import com.google.gson.annotations.SerializedName;

import java.util.EnumSet;
import java.util.List;
import java.util.Map;

public record Package(String slug, String name, String author, String[] authors, String category,
                      String[] contributors, Description description, Map<Asset.Type, Asset> assets,
                      EnumSet<Flag> flags, @SerializedName("package_type") String packageType,
                      List<String> peripherals, @SerializedName("release_date") int releaseDate,
                      @SerializedName("shop") ShopTitle titleInfo,
                      @SerializedName("supported_platforms") List<String> supportedPlatforms,
                      @SerializedName("uncompressed_size") long uncompressedSize, String version)
{
    public record Asset(String url, String hash, long size)
    {
        public enum Type
        {
            @SerializedName("archive")
            ARCHIVE,
            @SerializedName("binary")
            BINARY,
            @SerializedName("icon")
            ICON,
            @SerializedName("meta")
            META
        }
    }

    public record ShopTitle(@SerializedName("title_id") String titleId, @SerializedName("title_version") int titleVersion) {}

    public enum Flag
    {
        @SerializedName("deprecated")
        DEPRECATED,
        @SerializedName("writes_to_nand")
        WRITES_TO_NAND
    }

    public record Description(@SerializedName("short") String shortDesc, @SerializedName("long") String longDesc) {}
}
