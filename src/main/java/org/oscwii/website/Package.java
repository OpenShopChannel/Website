package org.oscwii.website;

import com.google.gson.annotations.SerializedName;

import java.util.EnumSet;
import java.util.List;
import java.util.Map;

public record Package(String slug, String name, String author, String category,
                      Description description, Map<Asset.Type, Asset> assets, EnumSet<Flag> flags,
                      String packageType, List<String> peripherals, int releaseDate,
                      List<String> supportedPlatforms, String version)
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

    public enum Flag
    {
        WRITES_TO_NAND
    }

    public record Description(@SerializedName("short") String shortDesc, @SerializedName("long") String longDesc) {}
}
