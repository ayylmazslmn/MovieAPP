//
//  ImageDownloaderClient.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 26.01.2024.
//

import Foundation

class ImageDownloaderClient:  ObservableObject {
    
    @Published var ImageDownload : Data?
    
    func ImageDownload (url : String) {
        
        
        guard let imageUrl = URL(string: url) else {
            
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { (data , response, error) in
            
            guard let data = data , error == nil  else {
                
                return
            }
            
            DispatchQueue.main.async {
                
                self.ImageDownload = data
            }
            
          
            
            
        }.resume()
    }
}



