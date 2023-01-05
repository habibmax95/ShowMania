//
//  TVShowDetailView.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

struct TVShowDetailView: View {
    let vm : TVShowDetailsViewModel
    var body: some View {
    
            ScrollView {
                VStack (alignment: .leading, spacing: 10) {
                    
                    URLImage(url: vm.image)
                        .scaledToFit()
                        .cornerRadius(10)
                    
                    HStack {
                        Text(vm.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        if let timeline = vm.timeline {
                            Text(timeline)
                                .font(.title3)
                        }
                    }
                    HStack {
                        Text(vm.language)
                            .font(.caption)
                        if let rating = vm.rating {
                            Spacer()
                            Assets.starImage.resizable()
                                .frame(width: 24, height: 24)
                            Text(rating)
                                .font(.title3)
                        }
                    }
                    
                    Text(vm.genres)
                        .font(.title3)
                    Text(vm.summery.html2String)
                        .font(.caption)
                    Spacer()
                    VStack {
                        if let path = vm.tvMazePath {
                            LinkView(title: vm.goToTVMazeTitile, path: path)
                        }
                        if let path = vm.officialSite {
                            LinkView(title: vm.goToOfficialSite, path: path)
                        }
                    }
                }.padding()

            
            }
        
    }
}

/*
struct TVShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailView()
    }
}
*/



struct LinkView: View {
    let title : String
    let path: String
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Assets.linkImage
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                
            } //: HStack
            Color.gray
                .frame(height: 0.5)
                .padding(.vertical, 2)
        } //: VStack
        .padding(4)
        .onTapGesture {
             if let url = URL(string: path) {
                 UIApplication.shared.open(url)
             }
        }
    }
}
