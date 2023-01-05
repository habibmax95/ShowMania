//
//  NetworkError.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case badUrl
    case noData
    case decodingError
    case invalidStatusCode(statusCode: Int)
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "URL isn't valid"
        case .noData:
            return "Response data is invalid"
        case .decodingError:
            return "Failed to decode"
        case .invalidStatusCode(_):
            return "Status code falls into the wrong range"
        case .custom(let error):
            return "Something went wrong \(error.localizedDescription)"
        }
    }
}
