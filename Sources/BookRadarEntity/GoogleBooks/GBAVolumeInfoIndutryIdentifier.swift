//
//  GBAVolumeInfoIndutryIdentifier.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

/**
 * Google Books API から取得したボリュームの業界標準識別子の情報
 */
public struct GBAVolumeInfoIndutryIdentifier: Decodable {
    
    /**
     * ボリュームの業界標準識別子の種類
     */
    public let type: String
    
    /**
     * ボリュームの識別子
     */
    public let identifier: String
    
    public enum CodingKeys: CodingKey {
        case type
        case identifier
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.identifier = try container.decode(String.self, forKey: .identifier)
    }
}
