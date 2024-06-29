//
//  APIHTTPScheme.swift
//  
//
//  Created by Naohiro Hamada on 2024/06/04.
//

import Foundation

/**
 * APIリクエスト エンドポイントのURLスキーム
 */
public enum APIHTTPScheme {
    /// HTTP
    case http
    /// HTTPS
    case https
    
    internal var stringValue: String {
        switch self {
        case .http:
            "http"
        case .https:
            "https"
        }
    }
}
