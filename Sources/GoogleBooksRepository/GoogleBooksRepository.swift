//
//  GoogleBooksRepository.swift
//
//
//  Created by Naohiro Hamada on 2024/06/09.
//

import Foundation

import APIClient
import BookRadarEntity

public enum GoogleBooksRepositoryError: Error {
    case uknown
    case invalidRequest
    case invalidResponse
}

public protocol GoogleBooksRepository {
    func search(subjects: [GoogleBookSearchSubject],
                page: GoogleBookSearchPage,
                order: GoogleBookSearchOrder) async throws -> [GBAVolume]
}

extension GoogleBooksRepository {
    public func search(subject: GoogleBookSearchSubject) async throws -> [GBAVolume] {
        try await search(subject: subject,
                         page: .default,
                         order: .default)
    }
    
    public func search(subject: GoogleBookSearchSubject,
                       page: GoogleBookSearchPage) async throws -> [GBAVolume] {
        try await search(subject: subject,
                         page: page,
                         order: .default)
    }
    
    public func search(subject: GoogleBookSearchSubject,
                       order: GoogleBookSearchOrder) async throws -> [GBAVolume] {
        try await search(subject: subject,
                         page: .default,
                         order: order)
    }
    
    public func search(subject: GoogleBookSearchSubject,
                       page: GoogleBookSearchPage,
                       order: GoogleBookSearchOrder) async throws -> [GBAVolume] {
        try await search(subjects: [subject],
                         page: page,
                         order: order)
    }
    
    public func search(subjects: [GoogleBookSearchSubject]) async throws -> [GBAVolume] {
        try await search(subjects: subjects,
                         page: .default,
                         order: .default)
    }
    
    public func search(subjects: [GoogleBookSearchSubject],
                       page: GoogleBookSearchPage) async throws -> [GBAVolume] {
        try await search(subjects: subjects,
                         page: page,
                         order: .default)
    }
    
    public func search(subjects: [GoogleBookSearchSubject],
                       order: GoogleBookSearchOrder) async throws -> [GBAVolume] {
        try await search(subjects: subjects,
                         page: .default,
                         order: order)
    }
}
