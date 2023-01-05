//
//  JSONMapper.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import Foundation

struct JSONMapper {
    //MARK:- for mapping Stub Data
    static func decode<T: Decodable>(data: Data, type: T.Type) throws -> T {
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    }
}
