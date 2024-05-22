//
//  GBAVolumeInfoImageLink.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

public struct GBAVolumeInfoImageLink: Decodable {
    public let thumbnail: URL?
    public let smallThumbnail: URL?
    public let small: URL?
    public let medium: URL?
    public let large: URL?
    public let extraLarge: URL?
    
    public enum CodingKeys: CodingKey {
        case thumbnail
        case smallThumbnail
        case small
        case medium
        case large
        case extraLarge
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.thumbnail = try container.decodeIfPresent(URL.self, forKey: .thumbnail)
        self.smallThumbnail = try container.decodeIfPresent(URL.self, forKey: .smallThumbnail)
        self.small = try container.decodeIfPresent(URL.self, forKey: .small)
        self.medium = try container.decodeIfPresent(URL.self, forKey: .medium)
        self.large = try container.decodeIfPresent(URL.self, forKey: .large)
        self.extraLarge = try container.decodeIfPresent(URL.self, forKey: .extraLarge)
    }
}
