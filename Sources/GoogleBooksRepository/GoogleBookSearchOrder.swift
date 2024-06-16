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
