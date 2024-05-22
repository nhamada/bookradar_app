//
//  GBAVolume.swift
//  
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

public struct GBAVolume: Decodable {
    public let kind: String
    public let id: String
    public let etag: String
    public let volumeInfo: GBAVolumeInfo
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
