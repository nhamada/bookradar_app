//
//  GoogleBookSearchOrder.swift
//
//
//  Created by Naohiro Hamada on 2024/06/16.
//

import Foundation

/**
 * 検索結果の並び順
 */
public enum GoogleBookSearchOrder {
    /// デフォルトの並び順
    public static let `default`: GoogleBookSearchOrder = .relevance
    
    /**
     * 最近のものから並べる
     */
    case newest
    
    /**
     * 関連度順で並べる
     */
    case relevance
}

extension GoogleBookSearchOrder {
    private static var queryName: String {
        "orderBy"
    }
    
    internal var queryValue: URLQueryItem {
        .init(name: Self.queryName,
              value: self.name)
    }
    
    private var name: String {
        switch self {
        case .newest:
            "newest"
        case .relevance:
            "relevance"
        }
    }
}
