//
//  GBAVolumeInfoIndutryIdentifier.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

public struct GBAVolumeInfoIndutryIdentifier: Decodable {
    public let type: String
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
