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
}
