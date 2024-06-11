//
//  GoogleBooksAPI.swift
//
//
//  Created by Naohiro Hamada on 2024/06/09.
//

import Foundation

import APIClient
import BookRadarEntity

internal struct VolumeSearchRequestParameter: APIRequestQueryParameter {
    internal var items: [URLQueryItem] {
        [
            .init(name: "q", value: query)
        ]
    }
    
    private let query: String
    
    internal init(query: String) {
        self.query = query
    }
}

extension GBAVolumeList: APIResponse {
}

internal struct VolumeSearchRequest: APIRequest {
    typealias Response = GBAVolumeList
    
    internal let path: String = "/books/v1/volumes"
    
    internal let method: APIHTTPMethod = .get
    
    internal let queryParameter: (any APIRequestQueryParameter)?
    
    internal let body: (any APIRequestBodyParameter)? = nil
    
    internal init(queryParameter: VolumeSearchRequestParameter) {
        self.queryParameter = queryParameter
    }
}
