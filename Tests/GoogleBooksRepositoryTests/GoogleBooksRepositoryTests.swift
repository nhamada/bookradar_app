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

    func testQuery_Alphabet() async throws {
        let keyword = "flower"
        let repository = GoogleBooksRepository(apiClient: apiClient)
        let result = await repository.search(title: keyword)
        switch result {
        case .success(let books):
            let result = books.map {
                $0.volumeInfo.title.lowercased().contains(keyword)
            }
            .contains(false)
            XCTAssert(result, "all book title must contains: \(keyword)")
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
    
    func testQuery_Japanese() async throws {
        let keyword = "プログラミング"
        let repository = GoogleBooksRepository(apiClient: apiClient)
        let result = await repository.search(title: keyword)
        switch result {
        case .success(let books):
            let result = books.map {
                $0.volumeInfo.title.lowercased().contains(keyword)
            }
            .contains(false)
            XCTAssert(result, "all book title must contains: \(keyword)")
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
}
