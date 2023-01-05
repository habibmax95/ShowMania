//
//  TVShowCell.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

struct TVShowCell: View {
    
    let item: TVShowViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top) {
                URLImage(url: item.image)
                    .frame(width: 45,height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(5)
                VStack(alignment: .leading,spacing: 4) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.genres)
                        .font(.caption)
                        .padding(.top, 8)
                } //: VStack
                .padding(.horizontal,8)
            } //: HStack
        } //: VStack
        .contentShape(Rectangle())
    }
}

/*
struct TVShowCell_Previews: PreviewProvider {
    static var previews: some View {
        TVShowCell()
    }
}
*/

