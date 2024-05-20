//
//  BookInfo.swift
//
//
//  Created by Naohiro Hamada on 2024/05/20.
//

import Foundation

/**
 * 書籍情報
 */
public struct BookInfo {
    /**
     * 書籍ID
     */
    public let id: String
    
    /**
     * タイトル
     */
    public let title: String
    
    /**
     * サブタイトル
     */
    public let subtitle: String
    
    /**
     * 著者、編集者
     */
    public let authors: [String]
    
    /**
     * 出版社
     */
    public let publisher: String
    
    /**
     * 公開日
     */
    public let publishedDate: Date
    
    /**
     * ISBN
     */
    public let isbn: String
    
    /**
     * 説明文
     */
    public let bookDescription: String
    
    /**
     * 販売価格
     */
    public let price: Int
}
