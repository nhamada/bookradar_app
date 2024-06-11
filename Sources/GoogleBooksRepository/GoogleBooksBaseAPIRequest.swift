//
//  GoogleBooksBaseAPIRequest.swift
//  
//
//  Created by Naohiro Hamada on 2024/06/09.
//

import Foundation

import APIClient

extension APIRequest {
    var cachePolicy: URLRequest.CachePolicy {
        .reloadIgnoringLocalCacheData
    }
    
    var timeoutInterval: TimeInterval {
        60
    }
    
    var scheme: APIHTTPScheme {
        .https
    }
    
    var hostname: String {
        "www.googleapis.com"
    }
}
