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
    private var repository: GoogleBooksRepository!
    
    override func setUp() async throws {
        try await super.setUp()
        
        repository = GoogleBooksAPIRepository(apiClient: apiClient)
    }

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testQuery_Alphabet() async throws {
        let keyword = "flower"
        do {
            let result = try await repository.search(subject: .title(keyword))
            let checkCondition = result.map {
                $0.volumeInfo.title.lowercased().contains(keyword)
            }
                .contains(false)
            XCTAssert(checkCondition, "all book title must contains: \(keyword)")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testQuery_Japanese() async throws {
        let keyword = "プログラミング"
        do {
            let result = try await repository.search(subject: .title(keyword))
            let checkCondition = result.map {
                $0.volumeInfo.title.lowercased().contains(keyword)
            }
                .contains(false)
            XCTAssert(checkCondition, "all book title must contains: \(keyword)")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
