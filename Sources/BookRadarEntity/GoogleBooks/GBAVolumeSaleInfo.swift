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
        
        public enum CodingKeys: CodingKey {
            case amount
            case currencyCode
        }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<GBAVolumeSaleInfo.Price.CodingKeys> = try decoder.container(keyedBy: GBAVolumeSaleInfo.Price.CodingKeys.self)
            self.amount = try container.decode(Int.self, forKey: GBAVolumeSaleInfo.Price.CodingKeys.amount)
            self.currencyCode = try container.decode(String.self, forKey: GBAVolumeSaleInfo.Price.CodingKeys.currencyCode)
        }
    }
    
    public let country: String
    public let saleability: String
    public let listPrice: Price?
    public let retailPrice: Price?
    
    public enum CodingKeys: CodingKey {
        case country
        case saleability
        case listPrice
        case retailPrice
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.saleability = try container.decode(String.self, forKey: .saleability)
        self.listPrice = try container.decodeIfPresent(GBAVolumeSaleInfo.Price.self, forKey: .listPrice)
        self.retailPrice = try container.decodeIfPresent(GBAVolumeSaleInfo.Price.self, forKey: .retailPrice)
    }
}
