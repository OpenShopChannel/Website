/*
 * Copyright (c) 2021-2024 Open Shop Channel - All rights reserved.
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