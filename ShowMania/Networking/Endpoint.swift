//
//  Endpoint.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

enum Endpoint {
    
    private enum Constant {
        static let baseURL = "https://api.tvmaze.com"
    }

    case showSearch(title: String)
    case showDetail(id: Int)
    
    private var path: String {
        switch self {
        case .showSearch(let title):
            //https://api.tvmaze.com/search/shows?q=girls
            return "\(Constant.baseURL)/search/shows?q=\(title)"
        case .showDetail(let id):
            //https://api.tvmaze.com/shows/1
            return "\(Constant.baseURL)/shows/\(id)"
        }
    }
    
    var url: URL? {
        URL(string: path)
    }
}
