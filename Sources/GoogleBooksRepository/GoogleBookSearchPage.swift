//
//  GoogleBookSearchPage.swift
//  
//
//  Created by Naohiro Hamada on 2024/06/16.
//

import Foundation

/**
 * 検索範囲
 */
public struct GoogleBookSearchPage {
    /// デフォルトの設定
    public static var `default`: Self {
        .init(startIndex: 0, count: 30)
    }
    
    /**
     * 開始位置
     */
    public let startIndex: Int
    
    /**
     * 検索件数
     *
     * 最大40まで
     */
    public let count: Int
    
    /**
     * 検索範囲
     *
     * - parameters:
     *     - startIndex: 開始位置
     *     - count: 検索件数 (最大40まで)
     */
    public init(startIndex: Int = Self.default.startIndex,
                count: Int = Self.default.count) {
        self.startIndex = startIndex
        self.count = count
    }
}
