//
//  TVShowListViewModel.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

class TVShowListViewModel: BaseViewModel {
    
    @Published var shows = [TVShowViewModel]()
    
    private let client : HTTPClientImpl!
    
    init(client: HTTPClientImpl = HTTPClient()) {
        self.client = client
    }
    
    @MainActor
    func searchBy(title keywords: String) async {
        loadingState = .loading
        do {
            let response = try await client.request(endpoint: .showSearch(title: keywords.trimmedAndEscaped()), type: [SearchItem].self)
                .map{$0.show}
                .map(TVShowViewModel.init)
            self.shows = response
            self.loadingState = .success
        } catch {
            self.loadingState = .failed
        }
    }
}
