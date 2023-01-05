//
//  TVShowDetails.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

import Foundation

struct TVShowDetails: Codable {
    let id: Int
    let name: String
    let tvMazePath: String?
    let officialSite: String?
    let language: String?
    let genres: [String]?
    let rating: Rating?
    let image: ShowImage?
    let summary: String?
    let premiered: String?
    let ended: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case tvMazePath = "url"
        case officialSite = "officialSite"
        case language = "language"
        case genres = "genres"
        case rating = "rating"
        case image = "image"
        case summary = "summary"
        case premiered = "premiered"
        case ended = "ended"
    }
}
