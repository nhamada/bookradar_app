//
//  GBAVolumeInfo.swift
//
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import Foundation

public struct GBAVolumeInfo: Decodable {
    public let title: String
    public let subtitle: String?
    public let authors: [String]?
    public let publisher: String?
    public let publishedDate: String?
    public let description: String?
    
    public let categories: [String]?
    public let industryIdentifiers: [GBAVolumeInfoIndutryIdentifier]
    public let imageLinks: GBAVolumeInfoImageLink
    
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
        self.industryIdentifiers = try container.decode([GBAVolumeInfoIndutryIdentifier].self, forKey: .industryIdentifiers)
        self.imageLinks = try container.decode(GBAVolumeInfoImageLink.self, forKey: .imageLinks)
    }
}
