//
//  TVShowListScreen.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

struct TVShowListScreen: View {
    
    @StateObject private var listVM : TVShowListViewModel
    @State private var query: String = ""
    
    init() {
        self._listVM = StateObject(wrappedValue: TVShowListViewModel())
    }
    
    var body: some View {
        VStack() {
            SearchView()
            Spacer()
            .navigationBarTitle("TV Shows",displayMode: .inline)
            
            if listVM.loadingState == .success {
                TVShowListView(shows: listVM.shows)
            } else if listVM.loadingState == .failed {
                FailedView()
            } else if listVM.loadingState == .loading {
                LoadingView()
            }
            
            Spacer()
        } //: VStack
        .embedNavigationView()
        .onFirstAppear {
            Task {
                await self.listVM.searchBy(title: "Batman")
            }
        }
    }
    
    fileprivate func SearchView() -> some View {
        return TextField("Search TV Show", text: $query, onCommit: {
            Task {
                await self.listVM.searchBy(title: query)
            }
        }).textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(8)
    }
    
    
}

struct TVShowListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TVShowListScreen()
    }
}


