//
//  GBAVolume.swift
//  
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

/**
 * Google Books API から取得したボリュームの情報
 */
public struct GBAVolume: Decodable {
    /**
     * リソースタイプ
     */
    public let kind: String
    
    /**
     * ボリュームの識別子
     */
    public let id: String
    
    /**
     * ボリュームのリソースの識別子
     */
    public let etag: String
    
    /**
     * ボリュームの一般情報
     */
    public let volumeInfo: GBAVolumeInfo
    
    /**
     * ボリュームの販売情報
     */
    public let saleInfo: GBAVolumeSaleInfo
    
    public enum CodingKeys: CodingKey {
        case kind
        case id
        case etag
        case volumeInfo
        case saleInfo
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.id = try container.decode(String.self, forKey: .id)
        self.etag = try container.decode(String.self, forKey: .etag)
        self.volumeInfo = try container.decode(GBAVolumeInfo.self, forKey: .volumeInfo)
        self.saleInfo = try container.decode(GBAVolumeSaleInfo.self, forKey: .saleInfo)
    }
}
