//
//  APIHTTPMethod.swift
//
//
//  Created by Naohiro Hamada on 2024/06/04.
//

import Foundation

/**
 * APIリクエスト HTTPリクエストメソッド
 */
public enum APIHTTPMethod {
    /// `GET`メソッド
    case get
    /// `POST`メソッド
    case post
    /// `PUT`メソッド
    case put
    /// `DELETE`メソッド
    case delete
    /// `PATCH`メソッド
    case patch
    
    internal var stringValue: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        case .put:
            "PUT"
        case .delete:
            "DELETE"
        case .patch:
            "PATCH"
        }
    }
}
