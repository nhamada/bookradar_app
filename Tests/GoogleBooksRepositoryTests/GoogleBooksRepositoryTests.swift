//
//  GoogleBooksRepositoryTests.swift
//  
//
//  Created by Naohiro Hamada on 2024/06/11.
//

import XCTest

@testable import APIClient
@testable import BooksRepository
@testable import GoogleBooksRepository

final class GoogleBooksRepositoryTests: XCTestCase {
    
    private typealias Repository = BooksRepository<GoogleBookSearchSubject,
                                                   GoogleBookSearchPage,
                                                   GoogleBookSearchOrder>
    
    private let apiClient = APIClient(session: .init(configuration: .ephemeral))
    private var repository: (any Repository)!
    
    override func setUp() async throws {
        try await super.setUp()
        
        repository = GoogleBooksRepository(apiClient: apiClient)
    }

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testQuery_Alphabet() async throws {
        let keyword = "flower"
        let result = await repository.search(subject: .title(keyword))
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
        let result = await repository.search(subject: .title(keyword))
        switch result {
        case .success(let books):
            let result = books.map {
                $0.volumeInfo.title.contains(keyword)
            }
            .contains(false)
            XCTAssert(result, "all book title must contains: \(keyword)")
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
}
