//
//  ImageLoader.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }.resume()
        
    }
}
