//
//  GoogleBooksDecodingTests.swift
//  
//
//  Created by Naohiro Hamada on 2024/05/22.
//

import XCTest
@testable import BookRadarEntity

internal final class GoogleBooksDecodingTests: XCTestCase {
    
    internal func testISBN_9784059200208() {
        guard let data = loadJSONDate(filename: "isbn-9784059200208") else {
            XCTFail("Failed to load JSON data.")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let volumes = try decoder.decode(GBAVolumeList.self, from: data)
        } catch {
            XCTFail("Failed to decode JSON data: \(error.localizedDescription)")
        }
    }
    
    internal func testISBN_9784140887196() {
        guard let data = loadJSONDate(filename: "isbn-9784140887196") else {
            XCTFail("Failed to load JSON data.")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let volumes = try decoder.decode(GBAVolumeList.self, from: data)
        } catch {
            XCTFail("Failed to decode JSON data: \(error.localizedDescription)")
        }
    }
    
    internal func testISBN_9784327453053() {
        guard let data = loadJSONDate(filename: "isbn-9784327453053") else {
            XCTFail("Failed to load JSON data.")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let volumes = try decoder.decode(GBAVolumeList.self, from: data)
        } catch {
            XCTFail("Failed to decode JSON data: \(error.localizedDescription)")
        }
    }
    
    private func loadJSONDate(filename: String) -> Data? {
        guard let resourceURL = Bundle.module.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: resourceURL)
    }
}
