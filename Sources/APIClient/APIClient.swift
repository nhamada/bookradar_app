//
//  APIClient.swift
//
//
//  Created by Naohiro Hamada on 2024/05/29.
//

import Foundation

public enum APIClientError: Error {
    case noData
    case invalidResponse
    case decoding
}

public final class APIClient {
    
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func send<Request: APIRequest, Response: APIResponse & Decodable>(request: Request) async -> Result<Response, APIClientError> where Response == Request.Response {
        let httpRequest = request.build()
        
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(for: httpRequest)
        } catch {
            return .failure(.noData)
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.invalidResponse)
        }
        guard !data.isEmpty else {
            return .failure(.noData)
        }
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(Response.self, from: data)
            return .success(result)
        } catch {
            return .failure(.decoding)
        }
    }
}
