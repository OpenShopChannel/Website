package org.oscwii.website;

import com.google.gson.annotations.SerializedName;

import java.util.EnumSet;
import java.util.List;
import java.util.Map;

public record Package(String slug, String name, String author, String category,
                      Description description, Map<Asset.Type, Asset> assets, EnumSet<Flag> flags,
                      @SerializedName("package_type") String packageType, List<String> peripherals,
                      @SerializedName("release_date") int releaseDate,
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
        WRITES_TO_NAND
    }

    public record Description(@SerializedName("short") String shortDesc, @SerializedName("long") String longDesc) {}
}
