package org.oscwii.website;

import com.google.gson.annotations.SerializedName;

import java.util.List;
import java.util.Set;

public record Package(String slug, String name, String author, String category,
                      Description description, Set<String> flags, String packageType,
                      int releaseDate, String version, List<Asset> assets, List<Peripheral> peripherals,
                      List<Platform> supportedPlatforms)
{
    public record Asset(String type, String url, String hash, long size) {}

    public record Description(@SerializedName("short") String shortDesc, @SerializedName("long") String longDesc) {}

    public record Peripheral(String name, String displayName, int amount) {}

    public record Platform(String name, String displayName) {}
}
