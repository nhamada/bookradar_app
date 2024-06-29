//
//  APIRequest.swift
//
//
//  Created by Naohiro Hamada on 2024/05/29.
//

import Foundation

public protocol APIResponse {
}

public protocol APIRequest {
    associatedtype Response = APIResponse
    
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeoutInterval: TimeInterval { get }
    
    var scheme: APIHTTPScheme { get }
    var hostname: String { get }
    var path: String { get }
    
    var method: APIHTTPMethod { get }
    
    var queryParameter: APIRequestQueryParameter? { get }
    var body: APIRequestBodyParameter? { get }
    
    func build() -> URLRequest
}

extension APIRequest {
    public func build() -> URLRequest {
        var urlComponent = URLComponents()
        
        urlComponent.scheme = self.scheme.stringValue
        urlComponent.host = self.hostname
        urlComponent.path = self.path
        urlComponent.queryItems = self.queryParameter?.items
        
        guard let url = urlComponent.url else {
            fatalError()
        }
        
        var request = URLRequest(url: url,
                                 cachePolicy: self.cachePolicy,
                                 timeoutInterval: self.timeoutInterval)
        request.httpMethod = self.method.stringValue
        request.httpBody = self.body?.data
        
        return request
    }
}
