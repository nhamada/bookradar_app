//
//  GBAVolumeSaleInfo.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

public struct GBAVolumeSaleInfo: Decodable {
    public struct Price: Decodable {
        public let amount: Int
        public let currencyCode: String
    }
    
    public let country: String
    public let saleability: String
    public let listPrice: Price?
    public let retailPrice: Price?
}
