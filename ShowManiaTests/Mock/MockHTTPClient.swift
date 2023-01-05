//
//  MockHTTPClient.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import Foundation

class MockHTTPClient: HTTPClientImpl {
    
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?){
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }
    
    
    func request<T>(endpoint: Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        if let error = self.error {
            throw error
        }
        if let response = self.urlResponse as? HTTPURLResponse,
              !((200...300) ~= response.statusCode) {
            let statusCode = response.statusCode
            throw NetworkError.invalidStatusCode(statusCode: statusCode)
        }
        
        guard let data = self.data else {
            throw NetworkError.noData
        }
        
        guard let data = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return data
    }
    
    
    
}
