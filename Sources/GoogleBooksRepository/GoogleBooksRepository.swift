//
//  GoogleBooksRepository.swift
//
//
//  Created by Naohiro Hamada on 2024/06/09.
//

import Foundation

import APIClient
import BookRadarEntity

public final class GoogleBooksRepository {
    
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func search(subject: GoogleBookSearchSubject,
                       page: GoogleBookSearchPage? = nil,
                       order: GoogleBookSearchOrder? = nil) async -> Result<[GBAVolume], APIClientError> {
        await search(subjects: [subject],
                     page: page,
                     order: order)
    }
    
    public func search(subjects: [GoogleBookSearchSubject],
                       page: GoogleBookSearchPage? = nil,
                       order: GoogleBookSearchOrder? = nil) async -> Result<[GBAVolume], APIClientError> {
        let requestParameter = VolumeSearchRequestParameter(subjects: subjects,
                                                            page: page,
                                                            order: order)
        let request = VolumeSearchRequest(queryParameter: requestParameter)
        let result = await apiClient.send(request: request)
        switch result {
        case .success(let success):
            return .success(success.items)
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
