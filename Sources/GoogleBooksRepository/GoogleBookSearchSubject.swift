//
//  GoogleBookSearchSubject.swift
//
//
//  Created by Naohiro Hamada on 2024/06/16.
//

import Foundation

import BooksRepository

/**
 * Google Books APIの検索対象
 */
public enum GoogleBookSearchSubject: BooksSearchSubject {
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

extension GoogleBookSearchSubject {
    internal static var queryName: String {
        "q"
    }
    
    internal var queryValue: String {
        switch self {
        case .title(let title):
            "intitle:\(title)"
        case .isbn(let isbn):
            "isbn:\(isbn)"
        case .publisher(let publisher):
            "inpublisher:\(publisher)"
        case .author(let author):
            "inauthor:\(author)"
        case .keyword(let keyword):
            keyword
        }
    }
}
