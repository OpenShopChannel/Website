/*
 * Copyright (c) 2021-2026 Open Shop Channel
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

function CategoryIcon(category) {
    switch (category) {
        case "utilities":
            return "fas fa-cog fa-fw"
        case "emulators":
            return "fas fa-microchip fa-fw"
        case "games":
            return "fas fa-gamepad fa-fw"
        case "media":
            return "fas fa-photo-video fa-fw"
        case "demos":
            return "fas fa-vial fa-fw"
        default:
            return "fas fa-question fa-fw"
    }
}