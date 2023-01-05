//
//  BaseViewModel.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class BaseViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
