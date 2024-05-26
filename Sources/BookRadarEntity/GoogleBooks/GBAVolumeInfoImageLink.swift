//
//  GBAVolumeInfoImageLink.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

/**
 * Google Books API から取得したボリュームの画像リンク
 */
public struct GBAVolumeInfoImageLink: Decodable {
    /**
     * ボリュームのサムネイルサイズの画像
     */
    public let thumbnail: URL?
    
    /**
     * ボリュームの小さいサムネイルサイズの画像
     */
    public let smallThumbnail: URL?
    
    /**
     * ボリュームの小さいサイズの画像
     */
    public let small: URL?
    
    /**
     * ボリュームの中程度のサイズの画像
     */
    public let medium: URL?
    
    /**
     * ボリュームの大きいサイズの画像
     */
    public let large: URL?
    
    /**
     * ボリュームの特大サイズの画像
     */
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
        self.thumbnail = try? container.decodeIfPresent(URL.self, forKey: .thumbnail)
        self.smallThumbnail = try? container.decodeIfPresent(URL.self, forKey: .smallThumbnail)
        self.small = try? container.decodeIfPresent(URL.self, forKey: .small)
        self.medium = try? container.decodeIfPresent(URL.self, forKey: .medium)
        self.large = try? container.decodeIfPresent(URL.self, forKey: .large)
        self.extraLarge = try? container.decodeIfPresent(URL.self, forKey: .extraLarge)
    }
}
