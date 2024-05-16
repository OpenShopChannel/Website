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

package org.oscwii.website;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.jetbrains.annotations.Nullable;
import org.oscwii.website.config.OSCWebConfig;
import org.oscwii.website.model.Category;
import org.oscwii.website.model.Package;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class OSCAPI
{
    private final Gson gson;
    private final OkHttpClient httpClient;
    private final String apiHost;

    private String featuredApp;
    private List<Category> categories;
    private List<Package> packages;
    private Map<String, String> newestApps;

    @Autowired
    public OSCAPI(Gson gson, OkHttpClient httpClient, OSCWebConfig config)
    {
        this.gson = gson;
        this.httpClient = httpClient;
        this.apiHost = config.repoManHost();
    }

    public List<Category> getCategories()
    {
        return categories;
    }

    public List<Package> getPackages()
    {
        return packages;
    }

    public List<Package> filterPackages(@Nullable String category, @Nullable String name)
    {
        return packages.stream()
            .filter(pkg -> category == null || pkg.category().equals(category))
            .filter(pkg -> name == null || pkg.name().toLowerCase().contains(name.toLowerCase()))
            .toList();
    }

    public Map<String, Package> getNewestPackages()
    {
        Map<String, Package> packages = new HashMap<>();
        for(Map.Entry<String, String> entry : newestApps.entrySet())
            packages.put(entry.getKey(), getBySlug(entry.getValue()));
        return packages;
    }

    public Package getFeaturedApp()
    {
        return packages.stream()
            .filter(pkg -> pkg.slug().equalsIgnoreCase(featuredApp))
            .findFirst()
            .orElseThrow(() -> new IllegalStateException("Featured app not found!"));
    }

    public Package getBySlug(String slug)
    {
        return packages.stream()
            .filter(pkg -> pkg.slug().equalsIgnoreCase(slug))
            .findFirst()
            .orElse(null);
    }

    public void retrieveInformation()
    {
        Request request = new Request.Builder()
            .url(API_ENDPOINT.formatted(apiHost, "information"))
            .header("User-Agent", "OSC Website Server")
            .build();

        JsonObject obj = doRequest(request, TypeToken.get(JsonObject.class));
        JsonArray availableCategories = obj.getAsJsonArray("available_categories");
        this.categories = gson.fromJson(availableCategories, new TypeToken<>(){});
    }

    public void loadPackages()
    {
        Request request = new Request.Builder()
            .url(API_ENDPOINT.formatted(apiHost, "contents"))
            .header("User-Agent", "OSC Website Server")
            .build();

        this.packages = doRequest(request, new TypeToken<>(){});
        this.newestApps = calculateNewestPackages();
    }

    public void retrieveFeaturedApp()
    {
        Request request = new Request.Builder()
            .url(API_ENDPOINT.formatted(apiHost, "featured-app"))
            .header("User-Agent", "OSC Website Server")
            .build();

        this.featuredApp = doRequest(request, TypeToken.get(Package.class)).slug();
    }

    private Map<String, String> calculateNewestPackages()
    {
        Map<String, String> packages = new HashMap<>();
        packages.put("newest", getNewest(getPackages()));

        for(Category category : categories)
        {
            String newest = getNewest(filterPackages(category.name(), null));
            if(newest != null)
                packages.put(category.name(), newest);
        }

        return packages;
    }

    private String getNewest(List<Package> selection)
    {
        long date = 0;
        Package selected = null;

        for(Package app : selection)
        {
            if(date < app.releaseDate())
            {
                date = app.releaseDate();
                selected = app;
            }
        }

        return selected != null ? selected.slug() : null;
    }

    private <T> T doRequest(Request request, TypeToken<T> type)
    {
        try(Response response = httpClient.newCall(request).execute())
        {
            if(!response.isSuccessful())
                throw new IOException("HTTP request failed with status code " + response.code());

            Assert.notNull(response.body(), "Response body is null!");
            return gson.fromJson(new InputStreamReader(response.body().byteStream()), type);
        }
        catch(IOException e)
        {
            throw new RuntimeException("Failed to fetch data from API:", e);
        }
    }

    private static final String API_ENDPOINT = "%s/api/v4/%s";
}
