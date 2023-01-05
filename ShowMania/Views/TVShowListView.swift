//
//  TVShowListView.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

struct TVShowListView: View {
    let shows: [TVShowViewModel]
    var body: some View {
        List(shows, id: \.id) { show in
            NavigationLink(
                destination: TVShowDetailScreen(id: show.id),
                label: {
                    TVShowCell(item: show)
                })
        }
    }
}

//struct TVShowListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TVShowListView()
//    }
//}
