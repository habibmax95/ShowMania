//
//  TVShowViewModel.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

struct TVShowViewModel {
    
    var show: TVShow
    
    var id: Int {
        show.id
    }
    
    var image: String {
        show.image?.medium ?? ""
    }
    
    var title: String {
        show.name
    }
    
    var genres: String {
        show.genres?.joined(separator: " | ") ?? ""
    }
}
