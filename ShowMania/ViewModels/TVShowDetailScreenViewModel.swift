//
//  TVShowDetailScreenViewModel.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

class TVShowDetailScreenViewModel: BaseViewModel {
    
    @Published var showDetail: TVShowDetailsViewModel?
    
    private let client : HTTPClientImpl!
    
    init(client: HTTPClientImpl = HTTPClient()) {
        self.client = client
    }
    
    @MainActor
    func getShowDetailsBy(id: Int) async {
        
        loadingState = .loading

        do {
            let response = try await client.request(endpoint: .showDetail(id: id), type: TVShowDetails.self)
            self.showDetail = TVShowDetailsViewModel(showDetails: response)
            self.loadingState = .success
        } catch {
            self.loadingState = .failed
        }
        
    }
    
}
