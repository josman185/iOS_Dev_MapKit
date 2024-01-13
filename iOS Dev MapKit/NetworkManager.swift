//
//  NetworkManager.swift
//  iOS Dev MapKit
//
//  Created by Jose Vargas on 1/13/24.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    private enum NetworkError: Error {
        case invalidResponse
        case decodingError(Error)
    }
    
    func fetchData(at url: URL) async throws -> [Restroom] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode([Restroom].self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
