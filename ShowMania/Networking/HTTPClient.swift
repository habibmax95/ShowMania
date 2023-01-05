//
//  HTTPClient.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation



protocol HTTPClientImpl {
    func request<T: Codable>(endpoint: Endpoint,
                             type: T.Type) async throws -> T
}


class HTTPClient : HTTPClientImpl {
    
    func request<T>(endpoint: Endpoint, type: T.Type) async throws -> T where T: Codable {
        
        guard let url = endpoint.url else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkError.invalidStatusCode(statusCode: statusCode)
        }
        
        guard let data = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return data
        
    }
}
