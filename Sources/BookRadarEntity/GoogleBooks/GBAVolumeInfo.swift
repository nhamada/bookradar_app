//
//  GBAVolumeInfo.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

/**
 * Google Books API から取得したボリュームの一般情報
 */
public struct GBAVolumeInfo: Decodable {
    /**
     * ボリュームのタイトル
     */
    public let title: String
    
    /**
     * ボリュームのサブタイトル
     */
    public let subtitle: String?
    
    /**
     * ボリュームの著者や編集者の名前の一覧
     */
    public let authors: [String]?
    
    /**
     * ボリュームの出版社
     */
    public let publisher: String?
    
    /**
     * ボリュームの公開日
     */
    public let publishedDate: String?
    
    /**
     * ボリュームの概要
     */
    public let description: String?
    
    /**
     * ボリュームの分類の一覧
     */
    public let categories: [String]?
    
    /**
     * ボリュームの業界標準識別子
     */
    public let industryIdentifiers: [GBAVolumeInfoIndutryIdentifier]?
    
    /**
     * ボリュームの画像リンク
     */
    public let imageLinks: GBAVolumeInfoImageLink?
    
    public enum CodingKeys: CodingKey {
        case title
        case subtitle
        case authors
        case publisher
        case publishedDate
        case description
        case categories
        case industryIdentifiers
        case imageLinks
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try? container.decode(String.self, forKey: .subtitle)
        self.authors = try? container.decode([String].self, forKey: .authors)
        self.publisher = try? container.decode(String.self, forKey: .publisher)
        self.publishedDate = try? container.decode(String.self, forKey: .publishedDate)
        self.description = try? container.decode(String.self, forKey: .description)
        self.categories = try? container.decode([String].self, forKey: .categories)
        self.industryIdentifiers = try? container.decode([GBAVolumeInfoIndutryIdentifier].self, forKey: .industryIdentifiers)
        self.imageLinks = try? container.decode(GBAVolumeInfoImageLink.self, forKey: .imageLinks)
    }
}
