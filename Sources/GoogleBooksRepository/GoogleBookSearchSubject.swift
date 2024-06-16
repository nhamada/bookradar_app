//
//  GoogleBookSearchSubject.swift
//
//
//  Created by Naohiro Hamada on 2024/06/16.
//

import Foundation

/**
 * Google Books APIの検索対象
 */
public enum GoogleBookSearchSubject {
    /**
     * タイトル検索
     */
    case title(String)
    
    /**
     * ISBN検索
     */
    case isbn(String)
    
    /**
     * 出版社検索
     */
    case publisher(String)
    
    /**
     * 著者検索
     */
    case author(String)
    
    /**
     * キーワード検索
     */
    case keyword(String)
}
