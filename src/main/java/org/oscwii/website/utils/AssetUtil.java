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
import org.oscwii.website.Package.Asset;

@SuppressWarnings("unused")
public class AssetUtil
{
    public static Asset getArchive(Package app)
    {
        return app.assets().get(Asset.Type.ARCHIVE);
    }

    public static Asset getBinary(Package app)
    {
        return app.assets().get(Asset.Type.BINARY);
    }

    public static Asset getIcon(Package app)
    {
        return app.assets().get(Asset.Type.ICON);
    }

    public static Asset getMetaXml(Package app)
    {
        return app.assets().get(Asset.Type.META);
    }

    private static final String ICON_TYPE = "icon";
}