//
//  TVShow.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

struct TVShow: Codable {
    let id: Int
    let name: String
    let genres: [String]?
    let image: ShowImage?
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case genres = "genres"
        case image = "image"
    }
}

struct SearchItem: Codable {
    let score: Double
    let show: TVShow
    private enum CodingKeys: String, CodingKey {
        case score = "score"
        case show = "show"
    }
}

struct Rating: Codable {
    let average: Double?
    
    private enum CodingKeys: String, CodingKey {
        case average = "average"
    }
}

struct ShowImage: Codable {
    let medium: String?
    let original: String?
    
    private enum CodingKeys: String, CodingKey {
        case medium = "medium"
        case original = "original"
    }
}
