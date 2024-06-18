//
//  GoogleBooksRepository.swift
//
//
//  Created by Naohiro Hamada on 2024/06/09.
//

import Foundation

import APIClient
import BooksRepository
import BookRadarEntity

public final class GoogleBooksRepository: BooksRepository {
    public typealias Subject = GoogleBookSearchSubject
    public typealias Page = GoogleBookSearchPage
    public typealias Order = GoogleBookSearchOrder
    
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func search(subjects: [GoogleBookSearchSubject],
                       page: GoogleBookSearchPage,
                       order: GoogleBookSearchOrder) async -> SearchResult {
        let requestParameter = VolumeSearchRequestParameter(subjects: subjects,
                                                            page: page,
                                                            order: order)
        let request = VolumeSearchRequest(queryParameter: requestParameter)
        let result = await apiClient.send(request: request)
        switch result {
        case .success(let success):
            return .success(success.items)
        case .failure(let failure):
            switch failure {
            case .noData:
                return .failure(.invalidResponse)
            case .invalidResponse:
                return .failure(.invalidResponse)
            case .decoding:
                return .failure(.invalidResponse)
            }
        }
    }
}
