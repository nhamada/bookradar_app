//
//  GBAVolumeSaleInfo.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

/**
 * Google Books API から取得したボリュームの販売情報
 */
public struct GBAVolumeSaleInfo: Decodable {
    
    /**
     * Google Books API から取得したボリュームの価格情報
     */
    public struct Price: Decodable {
        /**
         * 金額
         */
        public let amount: Int
        
        /**
         * 通過コード
         */
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
    
    /**
     * 販売情報の国コード
     */
    public let country: String
    
    /**
     * Google ストアで販売されているか
     */
    public let saleability: String
    
    /**
     * 推奨小売価格
     */
    public let listPrice: Price?
    
    /**
     * 実際の販売価格
     */
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
