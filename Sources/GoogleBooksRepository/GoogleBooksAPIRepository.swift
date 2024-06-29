//
//  GoogleBooksAPIRepository.swift
//
//
//  Created by Naohiro Hamada on 2024/06/29.
//

import Foundation

import APIClient
import BookRadarEntity

public final class GoogleBooksAPIRepository: GoogleBooksRepository {
    
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func search(subjects: [GoogleBookSearchSubject],
                       page: GoogleBookSearchPage,
                       order: GoogleBookSearchOrder) async throws -> [GBAVolume] {
        let requestParameter = VolumeSearchRequestParameter(subjects: subjects,
                                                            page: page,
                                                            order: order)
        let request = VolumeSearchRequest(queryParameter: requestParameter)
        let result = await apiClient.send(request: request)
        switch result {
        case .success(let books):
            return books.items
        case .failure(let failure):
            switch failure {
            case .noData:
                throw GoogleBooksRepositoryError.invalidResponse
            case .invalidResponse:
                throw GoogleBooksRepositoryError.invalidResponse
            case .decoding:
                throw GoogleBooksRepositoryError.invalidResponse
            }
        }
    }
}
