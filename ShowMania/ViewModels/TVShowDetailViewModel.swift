//
//  TVShowDetailViewModel.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

struct TVShowDetailsViewModel {
    
    let showDetails: TVShowDetails
    
    var id: Int {
        showDetails.id
    }
    
    var image: String {
        showDetails.image?.medium ?? ""
    }
    
    var title: String {
        showDetails.name
    }
    
    var tvMazePath: String? {
        showDetails.tvMazePath
    }
    
    let goToTVMazeTitile = "More on TVMaze.com"
    
    var officialSite: String? {
        showDetails.officialSite
    }
    
    let goToOfficialSite = "More on Official Site"
    
    private var startYear : String {
        showDetails.premiered?.getYear() ?? ""
    }
    
    private var endYear : String {
        showDetails.ended?.getYear() ?? ""
    }
    
    var language : String {
        showDetails.language ?? ""
    }
    
    var timeline : String? {
        if startYear.isEmpty && endYear.isEmpty {
            return nil
        }
        return "(\(startYear)-\(endYear))"
    }
    
    var rating: String? {
        if let rate = showDetails.rating?.average {
            return String(format: "%.1f", rate)
        }
        return nil
    }
    
    var genres: String {
        showDetails.genres?.joined(separator: " | ") ?? ""
    }
    
    var summery: String {
        showDetails.summary ?? "No description"
    }
    
}
