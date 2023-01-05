//
//  URLImage.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData, let image = UIImage(data: data) {
            return Image(uiImage:image).resizable()
        } else {
            return Image(placeholder).resizable()
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://picsum.photos/seed/picsum/200/300")
    }
}
