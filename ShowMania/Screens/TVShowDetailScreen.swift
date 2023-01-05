//
//  TVShowDetailScreen.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

struct TVShowDetailScreen: View {
    
    let id: Int
    @StateObject private var detailVM : TVShowDetailScreenViewModel
    
    init(id: Int) {
        self.id = id
        self._detailVM = StateObject(wrappedValue: TVShowDetailScreenViewModel())
        
    }
    
    var body: some View {
        VStack {
            if let detail = detailVM.showDetail {
                TVShowDetailView(vm: detail)
            }
            else if (detailVM.loadingState == .loading) {
                LoadingView()
            }
            else if (detailVM.loadingState == .failed) {
                FailedView()
            }
        } //: VStack
        .padding().embedNavigationView()
        .onAppear {
            Task {
                await detailVM.getShowDetailsBy(id: id)
            }
        }
    }
}

struct TVShowDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailScreen(id: 1)
    }
}
