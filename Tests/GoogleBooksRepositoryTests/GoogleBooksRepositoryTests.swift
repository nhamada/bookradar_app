//
//  GoogleBooksRepositoryTests.swift
//  
//
//  Created by Naohiro Hamada on 2024/06/11.
//

import XCTest

@testable import APIClient
@testable import GoogleBooksRepository

final class GoogleBooksRepositoryTests: XCTestCase {
    
    private let apiClient = APIClient(session: .init(configuration: .ephemeral))

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testQuery() async throws {
        let repository = GoogleBooksRepository(apiClient: apiClient)
        let result = await repository.search(title: "Flower")
        switch result {
        case .success(let books):
            break
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
}
