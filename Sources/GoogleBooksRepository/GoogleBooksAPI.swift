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
        var result: [URLQueryItem] = []
        let searchQuery = subjects.map {
            $0.queryValue
        }
            .joined(separator: "+")
        result.append(
            .init(name: GoogleBookSearchSubject.queryName,
                  value: searchQuery)
        )
        if let page {
            result.append(page.startIndexQueryItem)
            result.append(page.countQueryItem)
        }
        if let order {
            result.append(order.queryValue)
        }
        return result
    }
    
    private let subjects: [GoogleBookSearchSubject]
    private let page: GoogleBookSearchPage?
    private let order: GoogleBookSearchOrder?
    
    internal init(subjects: [GoogleBookSearchSubject],
                  page: GoogleBookSearchPage?,
                  order: GoogleBookSearchOrder?) {
        self.subjects = subjects
        self.page = page
        self.order = order
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
