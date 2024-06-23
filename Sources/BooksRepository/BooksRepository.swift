//
//  BooksRepository.swift
//  
//
//  Created by Naohiro Hamada on 2024/06/17.
//

import Foundation

import BookRadarEntity

public protocol BooksSearchSubject {
    
}

public protocol BooksSearchPage {
    static var `default`: Self { get }
}

public protocol BooksSearchOrder {
    static var `default`: Self { get }
}

public enum BooksRepositoryError: Error {
    case uknown
    case invalidRequest
    case invalidResponse
}

public protocol BooksRepository<Subject, Page, Order> {
    associatedtype Subject: BooksSearchSubject
    associatedtype Page: BooksSearchPage
    associatedtype Order: BooksSearchOrder
    
    typealias SearchResult = Result<[GBAVolume], BooksRepositoryError>
    
    func search(subject: Subject) async -> SearchResult
    
    func search(subject: Subject,
                page: Page) async -> SearchResult
    
    func search(subject: Subject,
                order: Order) async -> SearchResult
    
    func search(subject: Subject,
                page: Page,
                order: Order) async -> SearchResult
    
    func search(subjects: [Subject]) async -> SearchResult
    
    func search(subjects: [Subject],
                page: Page) async -> SearchResult
    
    func search(subjects: [Subject],
                order: Order) async -> SearchResult
    
    func search(subjects: [Subject],
                page: Page,
                order: Order) async -> SearchResult
}

public extension BooksRepository {
    func search(subject: Subject) async -> SearchResult {
        await search(subjects: [subject])
    }
    
    func search(subject: Subject,
                page: Page) async -> SearchResult {
        await search(subjects: [subject],
                     page: page)
    }
    
    func search(subject: Subject,
                order: Order) async -> SearchResult {
        await search(subjects: [subject],
                     order: order)
    }
    
    func search(subject: Subject,
                page: Page,
                order: Order) async -> SearchResult {
        await search(subjects: [subject],
                     page: page,
                     order: order)
    }
    
    func search(subjects: [Subject]) async -> SearchResult {
        await search(subjects: subjects,
                     page: .default,
                     order: .default)
    }
    
    func search(subjects: [Subject],
                page: Page) async -> SearchResult {
        await search(subjects: subjects,
                     page: page,
                     order: .default)
    }
    
    func search(subjects: [Subject],
                order: Order) async -> SearchResult {
        await search(subjects: subjects,
                     page: .default,
                     order: order)
    }
}
