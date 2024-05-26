//
//  GBAVolumeList.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

/**
 * Google Books API から取得したボリュームの一覧
 */
public struct GBAVolumeList: Decodable {
    /**
     * リソースのタイプ
     */
    public let kind: String
    
    /**
     * 見つかったボリュームの数
     */
    public let totalItems: Int
    
    /**
     * ボリュームのリスト
     */
    public let items: [GBAVolume]
    
    public enum CodingKeys: CodingKey {
        case kind
        case totalItems
        case items
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.totalItems = try container.decode(Int.self, forKey: .totalItems)
        self.items = try container.decode([GBAVolume].self, forKey: .items)
    }
}
