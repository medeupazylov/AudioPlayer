//
//  Image.swift
//  Muslink
//
//  Created by Aisha Nurgaliyeva on 05.08.2023.

import UIKit

enum Image {
    case alert
    case check
    case chevronDown
    case chevronFirst
    case chevronLast
    case chevronLeft
    case chevronRight
    case chevronUp
    case close
    case heart
    case instagram
    case listMusic
    case pauseCircle
    case pause
    case play
    case playFill
    case playground
    case repeating
    case search
    case share
    case shuffle
    case spotify
    case volume1
    case volume2
    case volumeX
    case yandexMusic
    case youtube
    case vkontakte
    case telegram
    case trash
    case pencil
    case settings
    case profile
    case plus
    case instagramNegative
    case spotifyNegative
    case vkontakteNegative
    case yandexMusicNegative
    case youtubeNegative
    case location
    case music
    case verified
    case mapPin
}

extension Image {
    var image: UIImage {
        var image: UIImage?

        switch self {
        case .alert:
            image = UIImage(named: "alert")
        case .check:
            image = UIImage(named: "check")
        case .chevronDown:
            image = UIImage(named: "chevron_down")
        case .chevronFirst:
            image = UIImage(named: "chevron_first")
        case .chevronLast:
            image = UIImage(named: "chevron_last")
        case .chevronLeft:
            image = UIImage(named: "chevron_left")
        case .chevronRight:
            image = UIImage(named: "chevron_right")
        case .chevronUp:
            image = UIImage(named: "chevron_up")
        case .close:
            image = UIImage(named: "close")
        case .heart:
            image = UIImage(named: "heart")
        case .instagram:
            image = UIImage(named: "instagram")
        case .listMusic:
            image = UIImage(named: "list_music")
        case .pauseCircle:
            image = UIImage(named: "pause_circle")
        case .pause:
            image = UIImage(named: "pause")
        case .play:
            image = UIImage(named: "play")
        case .playFill:
            image = UIImage(named: "play_fill")
        case .playground:
            image = UIImage(named: "playground")
        case .repeating:
            image = UIImage(named: "repeating")
        case .search:
            image = UIImage(named: "search")
        case .share:
            image = UIImage(named: "share")
        case .shuffle:
            image = UIImage(named: "shuffle")
        case .spotify:
            image = UIImage(named: "spotify")
        case .volume1:
            image = UIImage(named: "volume_1")
        case .volume2:
            image = UIImage(named: "volume_2")
        case .volumeX:
            image = UIImage(named: "volume_x")
        case .yandexMusic:
            image = UIImage(named: "yandex_music")
        case .youtube:
            image = UIImage(named: "youtube")
        case .vkontakte:
            image = UIImage(named: "vkontakte")
        case .telegram:
            image = UIImage(named: "telegram")
        case . trash:
            image = UIImage(named: "trash")
        case . pencil:
            image = UIImage(named: "pencil")
        case .settings:
            image = UIImage(named: "settings")
        case .profile:
            image = UIImage(named: "profile")
        case .plus:
            image = UIImage(named: "plus")
        case .instagramNegative:
            image = UIImage(named: "instagram_negative")
        case .spotifyNegative:
            image = UIImage(named: "spotify_negative")
        case .vkontakteNegative:
            image = UIImage(named: "vk_negative")
        case .yandexMusicNegative:
            image = UIImage(named: "yandex_music_negative")
        case .youtubeNegative:
            image = UIImage(named: "youtube_negative")
        case .location:
            image = UIImage(named: "location")
        case .music:
            image = UIImage(named: "music")
        case .verified:
            image = UIImage(named: "verified")
        case .mapPin:
            image = UIImage(named: "map_pin")
        }

        return image ?? UIImage()
    }
}
