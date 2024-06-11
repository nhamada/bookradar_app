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
    
    public func search(title: String) async -> Result<[GBAVolume], APIClientError> {
        let request = VolumeSearchRequest(queryParameter: .init(query: "intitle:\(title)"))
        let result = await apiClient.send(request: request)
        switch result {
        case .success(let success):
            return .success(success.items)
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
